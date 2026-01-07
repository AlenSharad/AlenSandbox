codeunit 50102 LocationAssignment
{
    trigger OnRun()
    begin

    end;

    procedure FillItemAvailabilityLocationwise(var SalesHeader: Record "Sales Header"; ShowTotalAvailability: Boolean)
    var
        CalculateBOMTree: Codeunit "Calculate BOM Tree";
        SalesLine: Record "Sales Line";
        Item: Record Item;
        BomBuffer: Record "BOM Buffer";
        ShowBy: Enum "BOM Structure Show By";
        apilog: Record "API Log";
        location: Record Location;
        bombuffercopy: Record "BOM Buffer Copy";
        entryno: Integer;
        ItemCount: Integer;
        APIManagement: Codeunit APIManagement;
        Customer: Record Customer;
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";
        GrossRequirement, PlannedOrderRcpt, ScheduledRcpt,
                                      PlannedOrderReleases, ProjAvailableBalance, ExpectedInventory, DummyQtyAvailable, AvailableInventory : Decimal;
        ProjectedQty, ReservedQuantity : Decimal;
    begin
        ProjectedQty := 0;
        ReservedQuantity := 0;
        if (SalesHeader.Status = SalesHeader.Status::Released) or (SalesHeader."Document Type" <> SalesHeader."Document Type"::Order)
        or (SalesHeader."Location Assigned")
        //or (SalesHeader."Location Code" = 'HVAC') 
        then
            exit;
        Customer.Get(SalesHeader."Sell-to Customer No.");
        if Customer."Customer Sets Location" then
            exit;

        // SalesLine.Reset();
        // SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        // SalesLine.SetRange("Document No.", SalesHeader."No.");
        // SalesLine.SetRange(Type, SalesLine.Type::Item);
        // SalesLine.SetRange("Drop Shipment", true);
        // if Not SalesLine.IsEmpty() then
        //     exit;

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
                    //if Item."Item Category Code" <> 'DISCOUNT' then begin
                    if Item.Type = Item.Type::Inventory then begin
                        if not Item.HasBOM() then begin
                            ItemCount += 1;
                            location.Reset();
                            location.SetRange("Include in Location Assignment", true);
                            location.FindSet();
                            repeat
                                Item.Reset();
                                if SalesHeader."Posting Date" <> 0D then
                                    Item.SetRange("Date Filter", 0D, SalesHeader."Posting Date")
                                else
                                    Item.SetRange("Date Filter", 0D, Today);
                                Item.SetFilter("Location Filter", location.Code);
                                Item.SetFilter("No.", SalesLine."No.");
                                ItemAvailFormsMgt.CalcAvailQuantities(
                                          Item, true,
                                          GrossRequirement, PlannedOrderRcpt, ScheduledRcpt,
                                          PlannedOrderReleases, ProjAvailableBalance, ExpectedInventory, DummyQtyAvailable, AvailableInventory);

                                bombuffercopy.Reset();
                                if bombuffercopy.FindLast() then
                                    entryno := bombuffercopy."Entry No." + 1
                                else
                                    entryno := 1;

                                bombuffercopy.Reset();
                                bombuffercopy.SetRange("Location Code", location.Code);
                                bombuffercopy.SetRange("Sales Item", SalesLine."No.");
                                if NOT bombuffercopy.FindFirst() then begin
                                    ProjectedQty := getQuantityfromSalesLine(SalesLine."No.", SalesHeader, location.Code);
                                    ReservedQuantity := getReservedQty(SalesLine."No.", SalesHeader, location.Code);
                                    //Message('%4 Quantity on Hand %1 and Quantity Used %2 , Remaining %3', FORMAT(AvailableInventory), FORMAT(ProjectedQty), FORMAT((AvailableInventory - ProjectedQty)), location.Code);

                                    entryno += 1;
                                    bombuffercopy.Init();
                                    bombuffercopy."No." := SalesLine."No.";
                                    bombuffercopy."Entry No." := entryno;
                                    bombuffercopy."Location Code" := location.Code;
                                    bombuffercopy."Sales Item" := SalesLine."No.";
                                    bombuffercopy."Available Quantity" := (AvailableInventory + ReservedQuantity) - ProjectedQty;
                                    //bombuffercopy."Available Quantity" := AvailableInventory;
                                    bombuffercopy."Gross Requirement" := SalesLine.Quantity;
                                    bombuffercopy.Insert();
                                    //Message('%4 Quantity on Hand %1 and Quantity Used %2 , Remaining %3', FORMAT(AvailableInventory + ReservedQuantity), FORMAT(ProjectedQty), FORMAT(((AvailableInventory + ReservedQuantity) - ProjectedQty)), location.Code);
                                end;
                            until location.Next() = 0;
                        end else begin
                            // exit;
                            ItemCount += 1;
                            location.Reset();
                            location.SetRange("Include in Location Assignment", true);
                            location.FindSet();
                            repeat
                                Item.Reset();
                                if SalesHeader."Posting Date" <> 0D then
                                    Item.SetRange("Date Filter", 0D, SalesHeader."Posting Date")
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
                                            //CalculateBOMTree.GenerateTreeForManyItems(Item, BomBuffer, 1);
                                        end;
                                end;
                                bombuffercopy.Reset();
                                if bombuffercopy.FindLast() then
                                    entryno := bombuffercopy."Entry No." + 1
                                else
                                    entryno := 1;
                                BomBuffer.SetRange(Indentation, 0);
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
                        end;
                        //end;
                    end;
            until SalesLine.Next() = 0;
        FillItemBomAvailable(bombuffercopy, SalesHeader, ItemCount);
        if ApplicableforAPI(SalesHeader) then
            APIManagement.PostRecordforLocAssignment(SalesHeader);
    end;


    local procedure FillItemBomAvailable(bombuffercopy: Record "BOM Buffer Copy"; var SalesHeader: Record "Sales Header"; TotalRecord: Integer)
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
        Item: Record Item;
    begin
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
                //if Item.Get(SalesLine."No.") then
                //if Item."Item Category Code" <> 'DISCOUNT' then begin
                if Item.Get(SalesLine."No.") then
                    if Item.Type = Item.Type::Inventory then begin
                        LocFilter := '';
                        bombuffercopy.Reset();
                        bombuffercopy.SetRange(Indentation, 0);
                        bombuffercopy.SetRange("No.", SalesLine."No.");
                        //bombuffercopy.SetFilter("Available Quantity", '>=%1', SalesLine.Quantity);
                        if bombuffercopy.FindSet() then
                            repeat
                                if (bombuffercopy."Available Quantity" + bombuffercopy."Able to Make Parent") >= (SalesLine.Quantity) then begin
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
                                end;
                            until bombuffercopy.Next() = 0;
                        if LocFilter <> '' then begin
                            location.Reset();
                            location.SetFilter(Code, LocFilter);
                            if location.FindSet() then
                                repeat
                                    /*
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
                                    */
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
                                    end else begin
                                        bomavailable."Actual Count" -= 1;
                                        bomavailable.Modify();
                                    end;

                                until location.Next() = 0;
                        end;
                        //end;
                    end;
            until SalesLine.Next() = 0
    end;

    local procedure ApplicableforAPI(var SalesHeader: Record "Sales Header"): Boolean
    var
        //salesheader: Record "Sales Header";
        itemBomAvailable: Record "Item Bom Available";
        LsalesLine: Record "Sales Line";
        LocFilter: Text[300];
        LocList: List of [Text];
        Value: Text;
        location: Record Location;
    begin
        itemBomAvailable.Reset();
        itemBomAvailable.SetAutoCalcFields("Availability Count");
        itemBomAvailable.SetRange(Available, true);
        itemBomAvailable.SetRange("Order No.", SalesHeader."No.");
        if itemBomAvailable.FindSet() then
            repeat
                if itemBomAvailable."Availability Count" = itemBomAvailable."Actual Count" then begin
                    if LocFilter <> '' then begin

                        foreach Value in LocFilter.Split('|') do begin
                            LocList.Add(Value);
                        end;
                    end;
                    // Check if NewValue already exists
                    if not LocList.Contains(itemBomAvailable."Location Code") then begin
                        if LocFilter = '' then
                            LocFilter := itemBomAvailable."Location Code"
                        else
                            LocFilter += '|' + itemBomAvailable."Location Code";
                    end;
                end;
            until itemBomAvailable.Next() = 0;
        if LocFilter <> '' then begin
            location.Reset();
            location.SetFilter(Code, LocFilter);
            if location.FindSet() then
                if location.Count > 0 then begin
                    // SalesHeader."Location Code" := location.Code;
                    // SalesHeader.Modify(true);
                    // LsalesLine.Reset();
                    // LsalesLine.SetRange("Document Type", SalesHeader."Document Type");
                    // LsalesLine.SetRange("Document No.", SalesHeader."No.");
                    // if LsalesLine.FindSet() then
                    //     repeat
                    //         if LsalesLine."Location Code" = '' then begin
                    //             LsalesLine."Location Code" := location.Code;
                    //             LsalesLine.Modify(true);
                    //         end;
                    //     until LsalesLine.Next() = 0;
                    exit(true);
                end else
                    exit(false);
        end else begin
            SalesHeader."Location Code" := 'BACK ORDER';
            SalesHeader."Location Assigned" := true;
            SalesHeader.Modify(true);
            LsalesLine.Reset();
            LsalesLine.SetRange("Document Type", SalesHeader."Document Type");
            LsalesLine.SetRange("Document No.", SalesHeader."No.");
            if LsalesLine.FindSet() then
                repeat
                    //if LsalesLine."Location Code" = '' then begin
                    LsalesLine."Location Code" := 'BACK ORDER';
                    LsalesLine.Modify(true);
                //end;
                until LsalesLine.Next() = 0;
            exit(false);
        end;

    end;

    local procedure getQuantityfromSalesLine(ItemNo: Code[20]; SalesHdr: Record "Sales Header"; LocCode: Code[20]): Decimal
    var
        RecSalesLine: Record "Sales Line";
        AssemblyLine: Record "Assembly Line";
        QtytoRemove: Decimal;
    begin
        QtytoRemove := 0;
        RecSalesLine.Reset();
        RecSalesLine.SetRange("Document Type", SalesHdr."Document Type");
        RecSalesLine.SetFilter("Document No.", '<>%1', SalesHdr."No.");
        RecSalesLine.SetFilter("Posting Date", '<=%1', SalesHdr."Posting Date");
        RecSalesLine.SetRange("No.", ItemNo);
        RecSalesLine.SetRange("Location Code", LocCode);
        if RecSalesLine.FindSet() then
            repeat
                QtytoRemove += RecSalesLine."Outstanding Quantity";
            until RecSalesLine.Next() = 0;

        AssemblyLine.Reset();
        AssemblyLine.SetFilter("Due Date", '<=%1', SalesHdr."Posting Date");
        AssemblyLine.SetRange("No.", ItemNo);
        AssemblyLine.SetRange("Location Code", LocCode);
        if AssemblyLine.FindSet() then
            repeat
                QtytoRemove += AssemblyLine.Quantity;
            until AssemblyLine.Next() = 0;
        exit(QtytoRemove);
    end;

    local procedure getReservedQty(ItemNo: Code[20]; SalesHdr: Record "Sales Header"; LocCode: Code[20]): Decimal
    var
        ReservationEntry: Record "Reservation Entry";
        ReservedQty: Decimal;
    begin
        ReservedQty := 0;
        ReservationEntry.Reset();
        ReservationEntry.SetRange("Source Type", 37);
        ReservationEntry.SetRange("Source Subtype", 1);
        ReservationEntry.SetFilter("Source ID", '<>%1', SalesHdr."No.");
        ReservationEntry.SetFilter("Shipment Date", '<=%1', SalesHdr."Posting Date");
        ReservationEntry.SetRange("Item No.", ItemNo);
        ReservationEntry.SetRange("Location Code", LocCode);
        ReservationEntry.SetRange("Reservation Status", ReservationEntry."Reservation Status"::Reservation);
        if ReservationEntry.FindSet() then
            repeat
                ReservedQty += ABS(ReservationEntry.Quantity);
            until ReservationEntry.Next() = 0;

        exit(ReservedQty);
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
    //--------------------------- SMS API (Get Shipment Label)-------------------

    procedure GETShipmentLabelAPI(WhseShipment: Record "Warehouse Shipment Header")
    var
        APIManagement: Codeunit APIManagement;
    begin
        if (WhseShipment.Processed) then //or (WhseShipment."Package Tracking No." <> '') or (WhseShipment."Location Code" <> 'SMS') then
            exit;
        APIManagement.ShipLabelAPICall(WhseShipment);

    end;

    var
        gHidedialog: Boolean;
        page: Page 1173;
}