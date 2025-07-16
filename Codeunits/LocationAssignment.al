codeunit 50102 LocationAssignment
{
    trigger OnRun()
    begin

    end;

    procedure FillItemAvailabilityLocationwise(SalesHeader: Record "Sales Header"; ShowTotalAvailability: Boolean)
    var
        CalculateBOMTree: Codeunit "Calculate BOM Tree";
        SalesLine: Record "Sales Line";
        Item: Record Item;
        BomBuffer: Record "BOM Buffer";
        ShowBy: Enum "BOM Structure Show By";
        location: Record Location;
        bombuffercopy: Record "BOM Buffer Copy";
        entryno: Integer;
        ItemCount: Integer;
        APIManagement: Codeunit APIManagement;
    begin
        BomBuffer.DeleteAll();
        bombuffercopy.Reset();
        bombuffercopy.DeleteAll();
        ItemCount := 0;
        Item.Reset();
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("No.", '<>%1', '');
        if SalesLine.FindSet() then
            Repeat
                if Item.Get(SalesLine."No.") then
                    if not (Item.Type = Item.Type::Inventory) then
                        exit;
                ItemCount += 1;
                location.Reset();
                location.FindSet();
                repeat
                    Item.Reset();
                    if SalesHeader."Shipment Date" <> 0D then
                        Item.SetRange("Date Filter", 0D, SalesHeader."Shipment Date")
                    else
                        Item.SetRange("Date Filter", 0D, Today);
                    Item.SetFilter("Location Filter", location.Code);
                    Item.SetFilter("No.", SalesLine."No.");
                    CalculateBOMTree.SetItemFilter(Item);
                    CalculateBOMTree.SetShowTotalAvailability(true);
                    case ShowBy of
                        ShowBy::Item:
                            begin
                                Item.FindFirst();
                                if not Item.HasBOM() then
                                    exit;
                                CalculateBOMTree.GenerateTreeForItems(Item, BomBuffer, 1);

                            end;
                    end;
                    bombuffercopy.Reset();
                    if bombuffercopy.FindLast() then
                        entryno := bombuffercopy."Entry No." + 1
                    else
                        entryno := 1;
                    if BomBuffer.FindSet() then
                        repeat
                            entryno += 1;
                            bombuffercopy.Init();
                            bombuffercopy.TransferFields(BomBuffer);
                            bombuffercopy."Entry No." := entryno;
                            bombuffercopy."Location Code" := location.Code;
                            bombuffercopy."Sales Item" := SalesLine."No.";
                            bombuffercopy.Insert();
                        until BomBuffer.Next() = 0;
                until location.Next() = 0;
            until SalesLine.Next() = 0;
        FillItemBomAvailable(bombuffercopy, SalesHeader, ItemCount);
        APIManagement.PostRecordforLocAssignment(SalesHeader);
    end;


    local procedure FillItemBomAvailable(bombuffercopy: Record "BOM Buffer Copy"; SalesHeader: Record "Sales Header"; TotalRecord: Integer)
    var
        IsHandled: Boolean;
        bomavailable: Record "Item Bom Available";
        SalesLine: Record "Sales Line";
        LocFilter: Text[300];
        LocList: List of [Text];
        Value: Text;
        TempText: Text;
        bombuffercopy2: Record "BOM Buffer Copy";
        location: Record Location;
        available: Boolean;
    begin
        LocFilter := '';

        OnBeforeFillItemBomAvailable(bombuffercopy, SalesHeader, IsHandled);
        if IsHandled then
            exit;
        bomavailable.Reset();
        bomavailable.DeleteAll();
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetFilter("No.", '<>%1', '');
        if SalesLine.FindSet() then
            Repeat
                bombuffercopy.Reset();
                bombuffercopy.SetRange(Indentation, 0);
                bombuffercopy.SetRange("No.", SalesLine."No.");
                bombuffercopy.SetFilter("Available Quantity", '>=%1', SalesLine.Quantity);
                if bombuffercopy.FindSet() then
                    repeat
                        if LocFilter <> '' then begin

                            foreach Value in LocFilter.Split('|') do begin
                                LocList.Add(Value);
                            end;
                        end;
                        // Check if NewValue already exists
                        if not LocList.Contains(bombuffercopy."Location Code") then begin
                            if LocFilter = '' then
                                LocFilter := bombuffercopy."Location Code"
                            else
                                LocFilter += '|' + bombuffercopy."Location Code";
                        end;
                    until bombuffercopy.Next() = 0;
                if LocFilter <> '' then begin
                    location.Reset();
                    location.SetFilter(Code, LocFilter);
                    if location.FindSet() then
                        repeat
                            available := false;
                            bombuffercopy2.Reset();
                            bombuffercopy2.SetFilter(Indentation, '>%1', 0);
                            bombuffercopy2.SetRange("Location Code", location.Code);
                            bombuffercopy2.SetRange("Sales Item", SalesLine."No.");
                            //bombuffercopy2.SetFilter("Available Quantity", '>=%1', SalesLine.Quantity);
                            if bombuffercopy2.FindSet() then begin
                                repeat
                                    if bombuffercopy2."Available Quantity" < (SalesLine.Quantity * bombuffercopy2."Qty. per Parent") then begin
                                        available := false;
                                        break;
                                    end else
                                        available := true;

                                until bombuffercopy2.Next() = 0;
                            end else
                                available := true;
                            //if available then begin
                            if not bomavailable.Get(SalesLine."No.", location.code) then begin
                                bomavailable.Init();
                                bomavailable."Item No." := SalesLine."No.";
                                bomavailable."Location Code" := location.code;
                                bomavailable.Available := available;
                                bomavailable."Order No." := SalesLine."Document No.";
                                bomavailable."Order Line No." := SalesLine."Line No.";
                                bomavailable."Required Quantity" := SalesLine.Quantity;
                                bomavailable.Weight := SalesLine."Gross Weight" * SalesLine.Quantity;
                                bomavailable."Actual Count" := TotalRecord;
                                bomavailable.Insert();
                                // end else begin
                                //     if not bomavailable.Available then
                                //         bomavailable.Available := true;
                                //     bomavailable.Modify();
                            end;
                        //end;
                        until location.Next() = 0;
                end;
            until SalesLine.Next() = 0
    end;

    procedure SethideDialog(HideDialog: Boolean)
    begin
        gHidedialog := HideDialog;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Calculate BOM Tree", OnBeforeGenerateTreeForItems, '', false, false)]
    local procedure HideDialogOnBeforeGenerateTreeForItems(var HideDialog: Boolean)
    begin
        SethideDialog(true);
        HideDialog := gHidedialog;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFillItemBomAvailable(bombuffercopy: Record "BOM Buffer Copy"; SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
    end;

    // [IntegrationEvent(false, false)]
    // local procedure OnAfterFillItemBomAvailable(bombuffercopy: Record "BOM Buffer Copy"; SalesHeader: Record "Sales Header")
    // begin
    // end;

    var
        gHidedialog: Boolean;
}