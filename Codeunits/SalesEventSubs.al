
codeunit 50101 SalesEventSubs
{
    Permissions = tabledata 50105 = rimd;
    trigger OnRun()
    begin
        // Code to execute when the codeunit is run
    end;

    var
        custombillto: Record "Custom Bill To Address";

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterCopySellToAddressToBillToAddress, '', false, false)]
    local procedure ChangeBillto(var SalesHeader: Record "Sales Header")
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
        custombillto.DeleteAll();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterModifyEvent', '', true, true)]
    local procedure ChangeBufferCustomFieldsOnAfterModifyEvent(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    var
        salesEntityBuffer: Record "Sales Order Entity Buffer";
    begin
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
            salesEntityBuffer.Modify();
        end;
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

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Amount", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")

    begin
        Rec."Amount Including VAT" := Rec."Line Amount" + Rec."Line Tax Amount";

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Tax Amount", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineTaxAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."Amount Including VAT" := Rec."Line Amount" + Rec."Line Tax Amount";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Discount Amount", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineDiscAmount(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."Amount Including VAT" := Rec."Line Amount" + Rec."Line Tax Amount";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Line Discount %", false, false)]
    local procedure CalculateAmountInclTaxOnAfterValidateEventLineDiscPer(var Rec: Record "Sales Line"; var xRec: Record "Sales Line")
    begin
        Rec."Amount Including VAT" := Rec."Line Amount" + Rec."Line Tax Amount";
    end;

    local Procedure CalculateandUpdateTotalVarance(var SL: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CurrLineTotal: Decimal;
        CurrLineBaseTotal: Decimal;
        OtherTotal: Decimal;
        OtherBaseTotal: Decimal;
        salesheader2: Record "Sales Header";
    begin
        Clear(SalesHeader);
        SalesHeader := SL.GetSalesHeader();
        CurrLineTotal := SL."Unit Price" * SL.Quantity;
        CurrLineBaseTotal := SL."BC Unit Price" * SL.Quantity;
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SL."Document Type");
        SalesLine.SetRange("Document No.", SL."Document No.");
        SalesLine.SetFilter("Line No.", '<>%1', SL."Line No.");
        SalesLine.SetRange(Type, SalesLine.Type::Item);
        if SalesLine.FindSet() then
            repeat
                OtherTotal := SalesLine."Unit Price" * SalesLine.Quantity;
                OtherBaseTotal := SalesLine."BC Unit Price" * SalesLine.Quantity;
            until SalesLine.Next() = 0;

        salesheader2.Reset();
        salesheader2.GET(SalesHeader."Document Type", SalesHeader."No.");
        SalesHeader2."Order Total Variance" := (CurrLineBaseTotal + OtherBaseTotal) - (CurrLineTotal + OtherTotal);
        SalesHeader2.Modify();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnValidateSellToCustomerNoOnBeforeUpdateSellToCont, '', false, false)]
    local procedure UpdateCustomFields(SellToCustomer: Record Customer; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader."3rd Party Billing Account" := SellToCustomer."Third Party Billing Account";
        SalesHeader."3rd Party Carrier" := SellToCustomer."Third Party Carrier";
        SalesHeader."3rd Party Zip" := SellToCustomer."Third Party Zip Code";
    end;

}
