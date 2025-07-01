codeunit 50100 ShopifyEventSubs
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Customer Events", OnBeforeUpdateCustomer, '', false, false)]
    local procedure UpdateShpyCustIDOnBeforeUpdateCustomer(Shop: Record "Shpfy Shop"; var Customer: Record Customer; var ShopifyCustomer: Record "Shpfy Customer"; var Handled: Boolean)
    begin
        Customer."Shopify Customer No." := Format(ShopifyCustomer.Id);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", OnBeforeWhseShptHeaderInsert, '', false, false)]
    local procedure FlowSalesHeaderFieldsOnBeforeWhseShptHeaderInsert(SalesHeader: Record "Sales Header"; var WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        WarehouseShipmentHeader."Order Type Code" := SalesHeader."Order Type Code";
        WarehouseShipmentHeader."Shopify Variant Id" := SalesHeader."Shopify Variant Id";
        WarehouseShipmentHeader."Sent to 3PL Date" := SalesHeader."Sent to 3PL Date";
        WarehouseShipmentHeader."Sent to 3PL" := SalesHeader."Sent to 3PL";
        WarehouseShipmentHeader."All Items Fully Commited" := SalesHeader."All Items Fully Commited";
        WarehouseShipmentHeader."Order Source" := SalesHeader."Order Source";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Tax Calculate", OnDistTaxOverSalesLinesOnTempSalesTaxLineLoopOnAfterSetTempSalesTaxLineAmount, '', false, false)]
    local procedure OnDistTaxOverSalesLinesOnTempSalesTaxLineLoopOnAfterSetTempSalesTaxLineAmount(SalesHeader: Record "Sales Header"; SalesLine: Record "Sales Line"; var TempSalesTaxLine: Record "Sales Tax Amount Line" temporary; var Amount: Decimal)
    var
        TaxAmount: Decimal;
    begin

        if TempSalesTaxLine."Tax Difference" <> 0 then
            TaxAmount := Amount * TempSalesTaxLine."Tax Amount" / TempSalesTaxLine."Tax Base Amount"
        else
            TaxAmount := Amount * TempSalesTaxLine."Tax %" / 100;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Reference", OnAfterInsertEvent, '', false, false)]
    local procedure UpdateItemIDOnAfterInsertEventItemRef(var Rec: Record "Item Reference")
    var
        item: Record Item;
    begin
        if item.Get(Rec."Item No.") then begin
            Rec."Item ID" := item.SystemId;
            Rec.Modify(true);
        end;
    end;


}