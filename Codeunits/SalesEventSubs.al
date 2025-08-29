
codeunit 50101 SalesEventSubs
{
    Permissions = tabledata 50105 = rimd;
    trigger OnRun()
    begin
        // Code to execute when the codeunit is run
    end;



    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToAddressToBillToAddress, '', false, false)]
    local procedure ChangeBillto(var SalesHeader: Record "Sales Header")
    var
        custombillto: Record "Custom Bill To Address";
    begin
        //if billtooptions = billtooptions::"Custom Address" then begin
        custombillto.Reset();
        custombillto.SetRange("Document Type", custombillto."Document Type"::Order);
        if custombillto.FindFirst() then begin
            SalesHeader."Bill-to Address" := custombillto.BilltoAdd1;
            SalesHeader."Bill-to Address 2" := custombillto.BilltoAdd2;
            SalesHeader."Bill-to Post Code" := custombillto.billtoPostCode;
            SalesHeader."Bill-to Country/Region Code" := custombillto.billtoCountryRegionCode;
            SalesHeader."Bill-to County" := custombillto.billtoCounty;
            SalesHeader."Bill-to City" := custombillto.billtoCity;
            SalesHeader.modify;
        end;
        //custombillto.DeleteAll();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToAddressToShipToAddress, '', false, false)]
    local procedure ChangeShipto(var SalesHeader: Record "Sales Header")
    var
        customshipto: Record "Custom Ship To Address";
    begin
        //if billtooptions = billtooptions::"Custom Address" then begin
        customshipto.Reset();
        customshipto.SetRange("Document Type", customshipto."Document Type"::Order);
        if customshipto.FindFirst() then begin
            SalesHeader."ship-to Address" := customshipto.shiptoAdd1;
            SalesHeader."ship-to Address 2" := customshipto.shiptoAdd2;
            SalesHeader."ship-to Post Code" := customshipto.shiptoPostCode;
            SalesHeader."ship-to Country/Region Code" := customshipto.shiptoCountryRegionCode;
            SalesHeader."ship-to County" := customshipto.shiptoCounty;
            SalesHeader."ship-to City" := customshipto.shiptoCity;
            SalesHeader.modify;
        end;
        //customshipto.DeleteAll();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterModifyEvent', '', true, true)]
    local procedure ChangeBufferCustomFieldsOnAfterModifyEvent(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        salesEntityBuffer: Record "Sales Order Entity Buffer";
    begin
        // if Rec."Shortcut Dimension 2 Code" = '410' then
        //     Rec."Shipping Advice" := Rec."Shipping Advice"::Complete;

        salesEntityBuffer.Reset();
        if salesEntityBuffer.Get(Rec."No.") then begin
            if salesEntityBuffer."Location Code" <> Rec."Location Code" then
                salesEntityBuffer."Location Code" := Rec."Location Code";
            if salesEntityBuffer."Payment Method Code" <> Rec."Payment Method Code" then
                salesEntityBuffer."Payment Method Code" := Rec."Payment Method Code";
            if salesEntityBuffer."Shipping Agent Code" <> Rec."Shipping Agent Code" then
                salesEntityBuffer."Shipping Agent Code" := Rec."Shipping Agent Code";
            if salesEntityBuffer."Shipping Agent Service Code" <> Rec."Shipping Agent Service Code" then
                salesEntityBuffer."Shipping Agent Service Code" := Rec."Shipping Agent Service Code";
            if salesEntityBuffer."Your Reference" <> Rec."Your Reference" then
                salesEntityBuffer."Your Reference" := Rec."Your Reference";
            if salesEntityBuffer."Tax Area Code" <> Rec."Tax Area Code" then
                salesEntityBuffer."Tax Area Code" := Rec."Tax Area Code";
            if salesEntityBuffer."Tax Liable" <> Rec."Tax Liable" then
                salesEntityBuffer."Tax Liable" := Rec."Tax Liable";
            if salesEntityBuffer."Order Total Tax" <> Rec."Order Total Tax" then
                salesEntityBuffer."Order Total Tax" := Rec."Order Total Tax";
            // if Rec."Shipping Advice" = Rec."Shipping Advice"::Complete then
            //     salesEntityBuffer."Shipping Advice" := salesEntityBuffer."Shipping Advice"::Complete;
            if salesEntityBuffer."Shipment Date" <> Rec."Shipment Date" then
                salesEntityBuffer."Shipment Date" := Rec."Shipment Date";
            salesEntityBuffer.Modify();

        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Shortcut Dimension 2 Code", false, false)]
    local procedure ChangeBufferCustomFieldsOnAfterValidateEventShortcutDimension2Code(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        salesEntityBuffer: Record "Sales Order Entity Buffer";
    begin
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit;
        if Rec."Shortcut Dimension 2 Code" = '410' then
            Rec."Shipping Advice" := Rec."Shipping Advice"::Complete;
        salesEntityBuffer.Reset();
        if salesEntityBuffer.Get(Rec."No.") then begin
            if Rec."Shipping Advice" = Rec."Shipping Advice"::Complete then
                salesEntityBuffer."Shipping Advice" := salesEntityBuffer."Shipping Advice"::Complete;
            salesEntityBuffer.Modify();
        end;
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterUpdateUnitPrice, '', false, false)]
    local procedure UpdateBaseUnitPriceOnAfterUpdateUnitPrice(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; CalledByFieldNo: Integer; CurrFieldNo: Integer)
    begin
        if SalesLine."Document Type" <> SalesLine."Document Type"::Order then
            exit;
        if (CalledByFieldNo = SalesLine.FieldNo("No.")) and (SalesLine.Type = SalesLine.Type::Item) then begin
            SalesLine."BC Unit Price" := SalesLine."Unit Price";
            CalculateandUpdateTotalVarance(SalesLine);
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Unit Price", false, false)]
    local procedure CalculateandUpdateTotalVaranceOnAfterValidateEventUnitPrice(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        item: Record Item;
    begin
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit;
        if (Rec.Type = Rec.Type::Item) then begin
            if item.Get(Rec."No.") and (item.Type = item.Type::"Non-Inventory") then
                Rec."BC Unit Price" := Rec."Unit Price";
        end;
        CalculateandUpdateTotalVarance(Rec);

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "No.", false, false)]
    local procedure FlowItemTypeOnAfterValidateEventNo(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    var
        item: Record Item;
    begin
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit;
        if (Rec.Type = Rec.Type::Item) then begin
            if item.Get(Rec."No.") then
                Rec."Item Type" := item.Type;
        end;
    end;
    //20-08
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Amount", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")

    begin
        //Rec."Amount Including VAT" := Rec."Line Amount" + Rec."Line Tax Amount";
        CalculateandUpdateTotalVarance(Rec);
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Tax Amount", false, false)]
    // local procedure CalculateAmountInclTaxOnAfterValidateEventLineTaxAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    // begin
    //     Rec.validate("Amount Including VAT", (Rec."Line Amount" + Rec."Line Tax Amount"));
    //     Rec.Amount := Rec."Line Amount";
    //     CalculateandUpdateTotalVarance(Rec);
    // end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Discount Amount", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineDiscAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        CalculateandUpdateTotalVarance(Rec);
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Discount %", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineDiscPer(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        CalculateandUpdateTotalVarance(Rec);
    end;
    //20-08
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "External Document No.", false, false)]
    local procedure DuplicateExternalDocCheck(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        salesHeader: Record "Sales Header";
    begin
        if Rec."External Document No." <> '' then begin
            salesHeader.Reset();
            salesHeader.SetRange("External Document No.", Rec."External Document No.");
            salesHeader.SetRange("Document Type", Rec."Document Type");
            salesHeader.Setfilter("No.", '<>%1', Rec."No.");
            if salesHeader.FindFirst() then
                Error('External Document No. already exists for Order No. %1', salesHeader."No.");
        end;
    end;

    [EventSubscriber(ObjectType::Page, PAge::"Sales Order", OnBeforeValidateShipToOptions, '', false, false)]
    local procedure SetShipToAsCustomOnBeforeValidateShipToOptions(ShipToOptions: Option; SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        customshipto: Record "Custom Ship To Address";
    begin
        if customshipto.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            if customshipto.ShipToOptions = customshipto.ShipToOptions::"Custom Address" then
                ShipToOptions := customshipto.ShipToOptions.AsInteger();
            IsHandled := true;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Mgt.", OnAfterCalculateShipBillToOptions, '', false, false)]
    local procedure SetShipToAsCustomOnAfterCalculateShipBillToOptions(var ShipToOptions: Enum "Sales Ship-to Options"; SalesHeader: Record "Sales Header")
    var
        customshipto: Record "Custom Ship To Address";
    begin
        if customshipto.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            if customshipto.ShipToOptions = customshipto.ShipToOptions::"Custom Address" then
                ShipToOptions := customshipto.ShipToOptions;

        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterHasDifferentShipToAddress', '', true, true)]
    local procedure MyProcedure2(var SalesHeader: Record "Sales Header"; var Result: Boolean)
    var
        customshipto: Record "Custom Ship To Address";
    begin
        if customshipto.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            if customshipto.ShipToOptions = customshipto.ShipToOptions::"Custom Address" then
                Result := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterIsShipToAddressEqualToSellToAddress', '', true, true)]
    local procedure MyProcedure3(SellToSalesHeader: Record "Sales Header"; var Result: Boolean)
    var
        customshipto: Record "Custom Ship To Address";
    begin
        if customshipto.Get(SellToSalesHeader."Document Type", SellToSalesHeader."No.") then begin
            if customshipto.ShipToOptions = customshipto.ShipToOptions::"Custom Address" then
                Result := false;
        end;
    end;

    local Procedure CalculateandUpdateTotalVarance(var SL: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CurrLineTotal: Decimal;

        OtherTotal: Decimal;

        salesheader2: Record "Sales Header";
    begin
        if SL."Document Type" <> SL."Document Type"::Order then
            exit;
        Clear(SalesHeader);
        CurrLineTotal := 0;
        OtherTotal := 0;
        SalesHeader.Get(SL."Document Type", SL."Document No.");
        //CurrLineTotal := SL."Amount Including VAT";
        CurrLineTotal := (((SL."BC Unit Price" * SL.Quantity) + SL."Ava Tax Amount") - SL."Line Discount Amount");
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SL."Document Type");
        SalesLine.SetRange("Document No.", SL."Document No.");
        SalesLine.SetFilter("Line No.", '<>%1', SL."Line No.");
        //SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.FindSet() then
            repeat
                //      SalesLine.CalcLineAmount();
                //    OtherTotal += SalesLine."Amount Including VAT";
                OtherTotal += (((SalesLine."BC Unit Price" * SalesLine.Quantity) + SalesLine."Ava Tax Amount") - SalesLine."Line Discount Amount");
            //OtherTotal += SalesLine."Line Amount";
            until SalesLine.Next() = 0;

        if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then begin
            Salesheader2.Reset();
            Salesheader2.GET(SalesHeader."Document Type", SalesHeader."No.");
            salesheader2.CalcFields("Ava Tax Amount");
            SalesHeader2."Order Total Amount" := (CurrLineTotal + OtherTotal);
            SalesHeader2."Order Total Variance" := (SalesHeader2."Order Total Amount" - (SalesHeader2."Order Total Excl Tax"));
            SalesHeader2."Order Tax Variance" := Abs(SalesHeader2."Order Total Tax" - (SalesHeader2."Ava Tax Amount"));
            SalesHeader2.Modify();
        end;


    end;

    local procedure GetOrderTotalAfterTax(var SalesHeader: Record "Sales Header"): Decimal
    var
        SalesLine: Record "Sales Line";
        OtherTotal: Decimal;
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                OtherTotal += (((SalesLine."BC Unit Price" * SalesLine.Quantity) + SalesLine."Ava Tax Amount") - SalesLine."Line Discount Amount");
            //OtherTotal += SalesLine."Line Amount";
            until SalesLine.Next() = 0;

        if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then begin
            exit(OtherTotal);
        end;
        exit(0);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidateSellToCustomerNoOnBeforeUpdateSellToCont, '', false, false)]
    local procedure UpdateCustomFields(SellToCustomer: Record Customer; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."3rd Party Billing Account" := SellToCustomer."Third Party Billing Account";
        SalesHeader."3rd Party Carrier" := SellToCustomer."Third Party Carrier";
        SalesHeader."3rd Party Zip" := SellToCustomer."Third Party Zip Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Order Total Check", false, false)]
    local procedure UpdateOrderVariance(var Rec: Record "Sales Header")
    begin
        Rec.CalcFields("Ava Tax Amount");
        if Rec."Document Type" = Rec."Document Type"::Order then begin
            if UPPERCASE(GetUserNameFromSecurityId(Rec.SystemCreatedBy)) = 'OAUTH' then begin
                Rec."Order Total Variance" := (Rec."Order Total Check" - Rec."Order Total Amount");
                Rec."Order Tax Variance" := Abs(Rec."Order Total Tax" - (Rec."Ava Tax Amount"));
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterValidateEvent, "Order Total Excl Tax", false, false)]
    local procedure UpdateOrderVarianceOnValidateOrderTotalExclTax(var Rec: Record "Sales Header")
    begin
        Rec.CalcFields("Ava Tax Amount");
        if Rec."Document Type" = Rec."Document Type"::Order then begin
            if UPPERCASE(GetUserNameFromSecurityId(Rec.SystemCreatedBy)) = 'OAUTH' then begin
                Rec."Order Total Variance" := (Rec."Order Total Amount" - Rec."Order Total Excl Tax");
                Rec."Order Tax Variance" := Abs(Rec."Order Total Tax" - (Rec."Ava Tax Amount"));
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforePerformManualReleaseProcedure, '', false, false)]
    local procedure LocationAssignmentOnBeforePerformManualReleaseProcedure(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        LocationAssignment: Codeunit LocationAssignment;
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then begin
                SalesHeader.CalcFields("Amount Including VAT");

                SalesHeader."Order Total Variance" := (SalesHeader."Order Total Amount" - SalesHeader."Order Total Excl Tax");
                SalesHeader."Order Tax Variance" := Abs(SalesHeader."Order Total Tax" - (SalesHeader."Ava Tax Amount"));
            end;
            if not SalesHeader."Location Assigned" then begin
                LocationAssignment.FillItemAvailabilityLocationwise(SalesHeader, true);
                Commit(); // to avoid calling location assignment again in same transaction if error occurs
            end;
            if SalesHeader."Location Code" = 'BACK ORDER' then
                IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnAfterReleaseSalesDoc, '', false, false)]
    local procedure UpdateVarianceOnAfterReleaseSalesDoc(var SalesHeader: Record "Sales Header")
    var
        ReleaseSalesDoc: Codeunit "Release Sales Document";
        asmtolink: Record "Assemble-to-Order Link";
        asmHeader: Record "Assembly Header";
        ReleaseAssemblyDoc: Codeunit "Release Assembly Document";
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then begin
                SalesHeader.CalcFields("Amount Including VAT", "Ava Tax Amount");
                //SalesHeader."Order Total Amount" := (SalesHeader."Amount Including VAT");
                //SalesHeader."Order Total Variance" := Abs(SalesHeader."Amount Including VAT" - SalesHeader."Order Total Check");
                SalesHeader."Order Tax Variance" := Abs(SalesHeader."Order Total Tax" - (SalesHeader."Ava Tax Amount"));
                SalesHeader."Order Total Amount" := GetOrderTotalAfterTax(SalesHeader);
                SalesHeader."Order Total Variance" := (SalesHeader."Order Total Amount" - SalesHeader."Order Total Check");
                // if SalesHeader."Order Total Variance" > 0 then begin
                // ReleaseSalesDoc.Reopen(SalesHeader);
                // asmtolink.Reset();
                // asmtolink.SetRange("Document Type", asmtolink."Document Type"::Order);
                // asmtolink.SetRange("Document No.", SalesHeader."No.");
                // //asmtolink.SetRange("Document Line No.", RecSalesLine."Line No.");
                // if asmtolink.FindFirst() then begin
                //     asmHeader.Reset();
                //     asmHeader.Get(asmtolink."Assembly Document Type", asmtolink."Assembly Document No.");
                //     ReleaseAssemblyDoc.Reopen(asmHeader);
                //     asmHeader.Modify();
                // end;
                SalesHeader.Modify();
                // //end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnDeleteOnBeforeArchiveSalesDocument, '', false, false)]
    local procedure CheckStatusOnDelete(SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header")
    begin
        SalesHeader.TestStatusOpen();

    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Tax Calculate", OnBeforeAddSalesLine, '', false, false)]
    // local procedure SkipSalesTaxCalcOnBeforeAddSalesLine(var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    // var
    //     SalesHeader: Record "Sales Header";
    // begin
    //     SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
    //     if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then
    //         IsHandled := true
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Tax Calculate", OnBeforeDistTaxOverSalesLines, '', false, false)]
    // local procedure SkipSalesTaxCalcOnBeforeDistTaxOverSalesLines(var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    // var
    //     SalesHeader: Record "Sales Header";
    // begin
    //     SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
    //     if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then
    //         IsHandled := true
    // end;
    //20-08
    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeUpdateUnitPrice, '', false, false)]
    // local procedure UpdateLineTaxAmountOnBeforeUpdateUnitPrice(CalledByFieldNo: Integer; var Handled: Boolean; var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    // var
    //     TaxBase, TaxAmount, TaxPercent : Decimal;
    // begin
    //     if SalesLine."No." = xSalesLine."No." then begin
    //         if SalesLine."Line Tax Amount" <> xSalesLine."Line Tax Amount" then begin
    //             SalesLine.Validate("Line Tax Amount", xSalesLine."Line Tax Amount");
    //             //TaxPercent := (xSalesLine."Line Tax Amount" / xSalesLine."Line Amount") * 100;
    //             //Message('Tax Percent: %1', TaxPercent);
    //         end;
    //         if SalesLine."Line Discount Amount" <> xSalesLine."Line Discount Amount" then begin
    //             SalesLine.Validate("Line Discount Amount", xSalesLine."Line Discount Amount");
    //             //TaxPercent := (xSalesLine."Line Tax Amount" / xSalesLine."Line Amount") * 100;
    //             //Message('Tax Percent: %1', TaxPercent);
    //         end;
    //     end;

    // end;
    //20-08
    // [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnUpdateUnitPriceByFieldOnBeforeValidateUnitPrice, '', false, false)]
    // local procedure UpdateLineTaxAmountOnAfterUpdateUnitPrice(CalledByFieldNo: Integer; var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    // var
    //     TaxBase, TaxAmount, TaxPercent : Decimal;
    // begin
    //     if (SalesLine."Line Amount" <> 0) and (SalesLine.Type = SalesLine.Type::Item) and (SalesLine."No." = xSalesLine."No.") and (SalesLine.Quantity = xSalesLine.Quantity) then begin
    //         if SalesLine."Line Discount %" <> xSalesLine."Line Discount %" then begin
    //             SalesLine.Validate("Line Discount %", xSalesLine."Line Discount %");
    //         end;
    //     end;
    // end;
    //20-08
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidateSellToCustomerNoOnAfterTestStatusOpen, '', false, false)]
    local procedure StopValidationOnValidateSellToCustomerNoOnAfterTestStatusOpen(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;
        if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then begin
            if (SalesHeader."Sell-to Customer No." = xSalesHeader."Sell-to Customer No.") and
               (xSalesHeader."Sell-to Customer No." <> '')
                    then
                IsHandled := true;
        end;
    end;

    //  [EventSubscriber(ObjectType::Page, PAge::"Sales Order", OnBeforeValidateBillToOptions, '', false, false)]
    // local procedure SetBillToAsCustomOnBeforeValidateShipToOptions(ShipToOptions: Option; SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    // var
    //     customshipto: Record "Custom Ship To Address";
    // begin
    //     if customshipto.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
    //         if customshipto.ShipToOptions = customshipto.ShipToOptions::"Custom Address" then
    //             ShipToOptions := customshipto.ShipToOptions.AsInteger();
    //         IsHandled := true;

    //     end;
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Mgt.", OnAfterCalculateShipBillToOptions, '', false, false)]
    local procedure SetBillToAsCustomOnAfterCalculateShipBillToOptions(var BillToOptions: Enum "Sales Bill-to Options"; SalesHeader: Record "Sales Header")
    var
        custombillto: Record "Custom Bill To Address";
    begin

        if custombillto.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            if custombillto.BillToOptions = custombillto.BillToOptions::"Custom Address" then
                BillToOptions := custombillto.BillToOptions;

        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterHasDifferentBillToAddress, '', true, true)]
    local procedure ChangeBilltoOnAfterHasDifferentBillToAddress(var SalesHeader: Record "Sales Header"; var Result: Boolean)
    var
        custombillto: Record "Custom Bill To Address";
    begin
        if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
            exit;
        if custombillto.Get(SalesHeader."Document Type", SalesHeader."No.") then begin
            if custombillto.BillToOptions = custombillto.BillToOptions::"Custom Address" then
                Result := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterIsBillToAddressEqualToSellToAddress, '', true, true)]
    local procedure ChangeBillToOnAfterIsBillToAddressEqualToSellToAddress(SellToSalesHeader: Record "Sales Header"; var Result: Boolean)
    var
        custombillto: Record "Custom Bill To Address";
    begin
        if SellToSalesHeader."Document Type" <> SellToSalesHeader."Document Type"::Order then
            exit;
        if custombillto.Get(SellToSalesHeader."Document Type", SellToSalesHeader."No.") then begin
            if custombillto.BillToOptions = custombillto.BillToOptions::"Custom Address" then
                Result := false;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeValidateNo, '', false, false)]
    local procedure StopValidationOnBeforeValidateNo(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; var IsHandled: Boolean)

    begin
        if SalesLine."Document Type" = SalesLine."Document Type"::Order then begin
            if UPPERCASE(GetUserNameFromSecurityId(SalesLine.SystemCreatedBy)) = 'OAUTH' then begin
                if (SalesLine."No." = xSalesLine."No.") and
                   (xSalesLine."No." <> '')
                        then
                    IsHandled := true;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "No.", false, false)]
    local procedure CalcWeightOnAfterValidateNo(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin

        if (Rec."Document Type" = Rec."Document Type"::Order) and (Rec."No." <> xRec."No.") then
            if Rec.Quantity <> 0 then
                Rec."Gross Weight" := Rec.Quantity * Rec."Net Weight";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, Quantity, false, false)]
    local procedure CalcWeightOnAfterValidateQuantity(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin

        if (Rec."Document Type" = Rec."Document Type"::Order) then
            if Rec.Quantity <> 0 then
                Rec."Gross Weight" := Rec.Quantity * Rec."Net Weight";
    end;


    //OnBeforeCheckAsmToOrder

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeCheckAsmToOrder, '', false, false)]
    local procedure UpdateASMHeaderLocationOnBeforeCheckAsmToOrder(AsmHeader: Record "Assembly Header"; var SalesLine: Record "Sales Line")
    var
        AsmLine: Record "Assembly Line";
    begin
        AsmHeader."Location Code" := SalesLine."Location Code";
        AsmHeader.Modify();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Assemble-to-Order Link", OnSynchronizeAsmFromSalesLineOnAfterGetAsmHeader, '', false, false)]
    local procedure SkipWindowOnSynchronizeAsmFromSalesLineOnAfterGetAsmHeader(var AssemblyHeader: Record "Assembly Header"; var NewSalesLine: Record "Sales Line"; var ShowWindow: Boolean)

    begin
        ShowWindow := false;
    end;
    //OnSynchronizeAsmFromSalesLineOnAfterGetAsmHeader
    // [EventSubscriber(ObjectType::Table, Database::"Assemble-to-Order Link", OnSynchronizeAsmFromSalesLineOnAfterGetAsmHeader, '', false, false)]
    // local procedure skipWindowOnSynchronizeAsmFromSalesLineOnAfterGetAsmHeader(var AssemblyHeader: Record "Assembly Header"; var NewSalesLine: Record "Sales Line"; var ShowWindow: Boolean)
    // begin
    //     if UPPERCASE(GetUserNameFromSecurityId(NewSalesLine.SystemCreatedBy)) = 'OAUTH' then
    //         ShowWindow := false;
    // end;
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document Totals", OnAfterCalculateSalesSubPageTotals, '', false, false)]
    // local procedure MyProcedussre(var TotalSalesLine2: Record "Sales Line"; var TotalSalesHeader: Record "Sales Header"; var TotalSalesLine: Record "Sales Line"; var VATAmount: Decimal)

    // var
    // begin
    //     Error('SL1- %1 , SL2-%2 , SL3-%3', TotalSalesLine."Amount Including VAT", TotalSalesLine2."Amount Including VAT", VATAmount);
    // end;


    procedure GetUserNameFromSecurityId(UserSecurityID: Guid): Code[50]
    var
        User: Record User;
    begin
        if User.Get(UserSecurityID) then
            exit(User."User Name")
        else
            exit('');

    end;

}
