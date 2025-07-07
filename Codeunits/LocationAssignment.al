codeunit 50102 LocationAssignment
{
    trigger OnRun()
    begin

    end;

    procedure RefreshPage(SalesLine: Record "Sales Line"; ShowTotalAvailability: Boolean)
    var
        CalculateBOMTree: Codeunit "Calculate BOM Tree";
        SalesHeader: Record "Sales Header";
        Item: Record Item;
        BomBuffer: Record "BOM Buffer";
        ShowBy: Enum "BOM Structure Show By";
    begin
        if SalesLine.IsEmpty() then
            exit;
        if (SalesLine."No." <> '') and (SalesLine.Type = SalesLine.Type::Item) then begin
            SalesHeader := SalesLine.GetSalesHeader();

            Item.SetRange("Date Filter", 0D, SalesHeader."Shipment Date");
            //Item.SetFilter("Location Filter", SalesLine."No.");
            Item.SetFilter("No.", SalesLine."No.");
            CalculateBOMTree.SetItemFilter(Item);
            CalculateBOMTree.SetShowTotalAvailability(ShowTotalAvailability);
            case ShowBy of
                ShowBy::Item:
                    begin
                        Item.FindFirst();
                        if not Item.HasBOM() then
                            exit;
                        CalculateBOMTree.GenerateTreeForItems(Item, BomBuffer, 1);
                    end;
            end;

        end;
    end;

    procedure RefreshPage2()
    var
        CalculateBOMTree: Codeunit "Calculate BOM Tree";
        SalesHeader: Record "Sales Header";
        Item: Record Item;
        BomBuffer: Record "BOM Buffer";
        ShowBy: Enum "BOM Structure Show By";
        location: Record Location;
        bombuffercopy: Record "BOM Buffer Copy";
    begin
        BomBuffer.DeleteAll();
        Clear(BomBuffer);
        location.Reset();
        location.FindSet();
        repeat
            Item.SetRange("Date Filter", 0D, Today);
            Item.SetFilter("Location Filter", location.Code);
            Item.SetFilter("No.", '100102R');
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
            if BomBuffer.FindSet() then
                repeat
                    bombuffercopy.Init();
                    bombuffercopy.TransferFields(BomBuffer);
                    bombuffercopy."Location Code" := location.Code;
                    bombuffercopy.Insert();
                until BomBuffer.Next() = 0;
        until location.Next() = 0;

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

    var
        gHidedialog: Boolean;
}