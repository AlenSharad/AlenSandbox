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
        //WarehouseShipmentHeader."Shopify Variant Id" := SalesHeader."Shopify Variant Id";
        WarehouseShipmentHeader."Sent to 3PL Date" := SalesHeader."Sent to 3PL Date";
        WarehouseShipmentHeader."Sent to 3PL" := SalesHeader."Sent to 3PL";
        WarehouseShipmentHeader."All Items Fully Commited" := SalesHeader."All Items Fully Commited";
        WarehouseShipmentHeader."Order Source" := SalesHeader."Order Source";
        WarehouseShipmentHeader."Store Front Payment Status" := SalesHeader."Store Front Payment Status";
        WarehouseShipmentHeader."Store Front Payment Gateway" := SalesHeader."Store Front Payment Gateway";
        WarehouseShipmentHeader."Store Front Payment Event Type" := SalesHeader."Store Front Payment Event Type";
        WarehouseShipmentHeader."Store Front Payment Authcode" := SalesHeader."Store Front Payment Authcode";
        WarehouseShipmentHeader."Order Total Check" := SalesHeader."Order Total Check";
        WarehouseShipmentHeader."Order Total Variance" := SalesHeader."Order Total Variance";
        WarehouseShipmentHeader."memo" := SalesHeader.memo;
        WarehouseShipmentHeader."Vendor_Number" := SalesHeader.Vendor_Number;
        WarehouseShipmentHeader."shippingAddress_attention" := SalesHeader.shippingAddress_attention;
        WarehouseShipmentHeader."Store_number" := SalesHeader.Store_number;
        WarehouseShipmentHeader."Dealer_Department_Number" := SalesHeader.Dealer_Department_Description;
        WarehouseShipmentHeader."Dealer_Department_Description" := SalesHeader.Dealer_Department_Description;
        WarehouseShipmentHeader."Standard_Carrier_Alpha_Code" := SalesHeader.Standard_Carrier_Alpha_Code;
        WarehouseShipmentHeader."FOB_Qualifier" := SalesHeader.FOB_Qualifier;
        WarehouseShipmentHeader."Transportation_Method_Code" := SalesHeader.Transportation_Method_Code;
        WarehouseShipmentHeader."Transaction_ID" := SalesHeader.Transaction_ID;
        WarehouseShipmentHeader."discountItem_intID" := SalesHeader.discountItem_intID;
        WarehouseShipmentHeader."Customer_Account_Number" := SalesHeader.Customer_Account_Number;
        WarehouseShipmentHeader."Special_Instructions" := SalesHeader.Special_Instructions;
        WarehouseShipmentHeader."Customer_Order_Number" := SalesHeader.Customer_Order_Number;
        WarehouseShipmentHeader."Release_No" := SalesHeader.Release_No;
        WarehouseShipmentHeader."Ship_To_Code_Qualifier" := SalesHeader.Ship_To_Code_Qualifier;
        WarehouseShipmentHeader."Requested_Ship_Date" := SalesHeader.Requested_Ship_Date;
        WarehouseShipmentHeader."Current_Scheduled_Delivery" := SalesHeader.Current_Scheduled_Delivery;
        WarehouseShipmentHeader."Requested_PickUp_Date" := SalesHeader."Requested_PickUp_Date";
        WarehouseShipmentHeader."Packaging_Type" := SalesHeader."Packaging_Type";
        WarehouseShipmentHeader."Total_Packages" := SalesHeader."Total_Packages";
        WarehouseShipmentHeader."PKG_PLT_Qty" := SalesHeader."PKG_PLT_Qty";
        WarehouseShipmentHeader."Marketplace_Shipment_ID" := SalesHeader."Marketplace_Shipment_ID";
        WarehouseShipmentHeader."824_Received" := SalesHeader."824_Received";
        WarehouseShipmentHeader."824_Notes" := SalesHeader."824_Notes";
        WarehouseShipmentHeader."Routing_Request_Sent" := SalesHeader."Routing_Request_Sent";
        WarehouseShipmentHeader."Processed" := SalesHeader."Processed";
        WarehouseShipmentHeader."Supplier_Contact_Name" := SalesHeader."Supplier_Contact_Name";
        WarehouseShipmentHeader."Supplier_Contact_No" := SalesHeader."Supplier_Contact_No";
        WarehouseShipmentHeader."Supplier_Contact_Email" := SalesHeader."Supplier_Contact_Email";
        WarehouseShipmentHeader."Ship From" := SalesHeader."Ship From";
        WarehouseShipmentHeader."3rd Party Billing Account" := SalesHeader."3rd Party Billing Account";
        WarehouseShipmentHeader."3rd Party Zip" := SalesHeader."3rd Party Zip";
        WarehouseShipmentHeader."3rd Party Carrier" := SalesHeader."3rd Party Carrier";
        WarehouseShipmentHeader."Storefront Name" := SalesHeader."Storefront Name";
        WarehouseShipmentHeader.isShipresidential := SalesHeader.isShipresidential;
        WarehouseShipmentHeader."Bill-to Phone No." := SalesHeader."Bill-to Phone No.";
        WarehouseShipmentHeader."Order Discount Details" := SalesHeader."Order Discount Details";
        WarehouseShipmentHeader."Order Total Tax" := SalesHeader."Order Total Tax";
        WarehouseShipmentHeader."Source No." := SalesHeader."No.";
        WarehouseShipmentHeader."Your Reference" := SalesHeader."Your Reference";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Warehouse Mgt.", OnAfterCreateShptLineFromSalesLine, '', false, false)]
    local procedure UpdateWhseShptLineOnAfterCreateShptLineFromSalesLine(SalesLine: Record "Sales Line"; var WarehouseShipmentLine: Record "Warehouse Shipment Line")
    begin
        WarehouseShipmentLine."Customer Subscription No." := SalesLine."Customer Subscription No.";
        WarehouseShipmentLine."Shopify Variant Id" := SalesLine."Shopify Variant Id";
        WarehouseShipmentLine."Dealer Item No." := SalesLine."Dealer Item No.";
        WarehouseShipmentLine."Discount Details" := SalesLine."Discount Details";
        WarehouseShipmentLine."Amazon Item ID" := SalesLine."Amazon Item ID";
        WarehouseShipmentLine.UPC_Code := SalesLine.UPC_Code;
        WarehouseShipmentLine."PO Line" := SalesLine."PO Line";
        //WarehouseShipmentLine.Modify();
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