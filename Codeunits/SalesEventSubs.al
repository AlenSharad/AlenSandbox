
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
        if Rec."Shortcut Dimension 2 Code" = '410' then
            Rec."Shipping Advice" := Rec."Shipping Advice"::Complete;
        salesEntityBuffer.Reset();
        if salesEntityBuffer.Get(Rec."No.") then begin
            if Rec."Shipping Advice" = Rec."Shipping Advice"::Complete then
                salesEntityBuffer."Shipping Advice" := salesEntityBuffer."Shipping Advice"::Complete;
            salesEntityBuffer.Modify();
        end;
    end;

    local procedure MyProcedure()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterUpdateUnitPrice, '', false, false)]
    local procedure UpdateBaseUnitPriceOnAfterUpdateUnitPrice(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; CalledByFieldNo: Integer; CurrFieldNo: Integer)
    begin
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
        if (Rec.Type = Rec.Type::Item) then begin
            if item.Get(Rec."No.") then
                Rec."Item Type" := item.Type;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Amount", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")

    begin
        Rec."Amount Including VAT" := Rec."Line Amount" + Rec."Line Tax Amount";
        CalculateandUpdateTotalVarance(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Tax Amount", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineTaxAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec.validate("Amount Including VAT", (Rec."Line Amount" + Rec."Line Tax Amount"));
        Rec.Amount := Rec."Line Amount";
        CalculateandUpdateTotalVarance(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Discount Amount", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineDiscAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        //if xRec."No." = Rec."No." then

        Rec."Amount Including VAT" := Rec."Line Amount" + Rec."Line Tax Amount";
        CalculateandUpdateTotalVarance(Rec);
    end;


    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Discount %", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineDiscPer(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."Amount Including VAT" := Rec."Line Amount" + Rec."Line Tax Amount";
        CalculateandUpdateTotalVarance(Rec);
    end;

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

        Clear(SalesHeader);
        CurrLineTotal := 0;
        OtherTotal := 0;
        SalesHeader.Get(SL."Document Type", SL."Document No.");
        //CurrLineTotal := SL."Amount Including VAT";
        CurrLineTotal := (((SL."BC Unit Price" * SL.Quantity) + SL."Line Tax Amount") - SL."Line Discount Amount");
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SL."Document Type");
        SalesLine.SetRange("Document No.", SL."Document No.");
        SalesLine.SetFilter("Line No.", '<>%1', SL."Line No.");
        //SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.FindSet() then
            repeat
                //    OtherTotal += SalesLine."Amount Including VAT";
                OtherTotal += (((SalesLine."BC Unit Price" * SalesLine.Quantity) + SalesLine."Line Tax Amount") - SalesLine."Line Discount Amount");
            until SalesLine.Next() = 0;

        if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then begin
            salesheader2.Reset();
            salesheader2.GET(SalesHeader."Document Type", SalesHeader."No.");
            SalesHeader2."Order Total Amount" := (CurrLineTotal + OtherTotal);
            SalesHeader2."Order Total Variance" := Abs(SalesHeader2."Order Total Amount" - (SalesHeader2."Order Total Check"));
            SalesHeader2.Modify();
        end;


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
        //Rec.CalcFields("Order Total Amount");

        if UPPERCASE(GetUserNameFromSecurityId(Rec.SystemCreatedBy)) = 'OAUTH' then
            Rec."Order Total Variance" := Abs(Rec."Order Total Check" - Rec."Order Total Amount");
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforePerformManualReleaseProcedure, '', false, false)]
    local procedure LocationAssignmentOnBeforePerformManualReleaseProcedure(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    var
        LocationAssignment: Codeunit LocationAssignment;
    begin
        if not SalesHeader."Location Assigned" then
            LocationAssignment.FillItemAvailabilityLocationwise(SalesHeader, true);
        //Commit();
        if SalesHeader."Location Code" = 'BACK ORDER' then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeCalcVATAmountLines, '', false, false)]
    local procedure SkipVatCalculationOnBeforeCalcVATAmountLines(SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
        if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then
            IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Tax Calculate", OnBeforeAddSalesLine, '', false, false)]
    local procedure SkipSalesTaxCalcOnBeforeAddSalesLine(var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then
            IsHandled := true
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Tax Calculate", OnBeforeDistTaxOverSalesLines, '', false, false)]
    local procedure SkipSalesTaxCalcOnBeforeDistTaxOverSalesLines(var SalesLine: Record "Sales Line"; var IsHandled: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        if UPPERCASE(GetUserNameFromSecurityId(SalesHeader.SystemCreatedBy)) = 'OAUTH' then
            IsHandled := true
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeUpdateUnitPrice, '', false, false)]
    local procedure UpdateLineTaxAmountOnBeforeUpdateUnitPrice(CalledByFieldNo: Integer; var Handled: Boolean; var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    var
        TaxBase, TaxAmount, TaxPercent : Decimal;
    begin
        if SalesLine."No." = xSalesLine."No." then begin
            if SalesLine."Line Tax Amount" <> xSalesLine."Line Tax Amount" then begin
                SalesLine.Validate("Line Tax Amount", xSalesLine."Line Tax Amount");
                //TaxPercent := (xSalesLine."Line Tax Amount" / xSalesLine."Line Amount") * 100;
                //Message('Tax Percent: %1', TaxPercent);
            end;
            if SalesLine."Line Discount Amount" <> xSalesLine."Line Discount Amount" then begin
                SalesLine.Validate("Line Discount Amount", xSalesLine."Line Discount Amount");
                //TaxPercent := (xSalesLine."Line Tax Amount" / xSalesLine."Line Amount") * 100;
                //Message('Tax Percent: %1', TaxPercent);
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnUpdateUnitPriceByFieldOnBeforeValidateUnitPrice, '', false, false)]
    local procedure UpdateLineTaxAmountOnAfterUpdateUnitPrice(CalledByFieldNo: Integer; var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line")
    var
        TaxBase, TaxAmount, TaxPercent : Decimal;
    begin
        if (SalesLine."Line Amount" <> 0) and (SalesLine.Type = SalesLine.Type::Item) and (SalesLine."No." = xSalesLine."No.") and (SalesLine.Quantity = xSalesLine.Quantity) then begin
            if SalesLine."Line Discount %" <> xSalesLine."Line Discount %" then begin
                SalesLine.Validate("Line Discount %", xSalesLine."Line Discount %");
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidateSellToCustomerNoOnAfterTestStatusOpen, '', false, false)]
    local procedure StopValidationOnValidateSellToCustomerNoOnAfterTestStatusOpen(var SalesHeader: Record "Sales Header"; xSalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
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
        if custombillto.Get(SellToSalesHeader."Document Type", SellToSalesHeader."No.") then begin
            if custombillto.BillToOptions = custombillto.BillToOptions::"Custom Address" then
                Result := false;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeValidateNo, '', false, false)]
    local procedure StopValidationOnBeforeValidateNo(var SalesLine: Record "Sales Line"; xSalesLine: Record "Sales Line"; var IsHandled: Boolean)

    begin
        if UPPERCASE(GetUserNameFromSecurityId(SalesLine.SystemCreatedBy)) = 'OAUTH' then begin
            if (SalesLine."No." = xSalesLine."No.") and
               (xSalesLine."No." <> '')
                    then
                IsHandled := true;
        end;
    end;

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
