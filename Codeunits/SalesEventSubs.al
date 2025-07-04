
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
    local procedure MyProcedure(var Rec: Record "Sales Header"; var xRec: Record "Sales Header")
    begin
        custombillto.Reset();
        custombillto.SetRange("Document Type", custombillto."Document Type"::Order);
        custombillto.SetRange("Document No.", Rec."No.");
        if custombillto.FindFirst() then begin
            Error('2');
            Rec."Bill-to Address" := custombillto.BilltoAdd1;
            Rec."Bill-to Address 2" := custombillto.BilltoAdd2;
            Rec."Bill-to Post Code" := custombillto.billtoPostCode;
            Rec."Bill-to Country/Region Code" := custombillto.billtoCountryRegionCode;
            Rec."Bill-to County" := custombillto.billtoCounty;
            Rec."Bill-to City" := custombillto.billtoCity;
            //Rec.modify;
        end;
        custombillto.DeleteAll();
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
    begin
        CalculateandUpdateTotalVarance(Rec);
    end;

    local Procedure CalculateandUpdateTotalVarance(var SL: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CurrLineTotal: Decimal;
        CurrLineBaseTotal: Decimal;
        OtherTotal: Decimal;
        OtherBaseTotal: Decimal;
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
        SalesHeader."Order Total Variance" := (CurrLineBaseTotal + OtherBaseTotal) - (CurrLineTotal + OtherTotal);
        SalesHeader.Modify();
    end;
}
