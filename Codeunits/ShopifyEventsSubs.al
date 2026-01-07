codeunit 50100 ShopifyEventSubs
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Shpfy Customer Events", OnBeforeUpdateCustomer, '', false, false)]
    local procedure UpdateShpyCustIDOnBeforeUpdateCustomer(Shop: Record "Shpfy Shop"; var Customer: Record Customer; var ShopifyCustomer: Record "Shpfy Customer"; var Handled: Boolean)
    begin
        Customer."Shopify Customer No." := Format(ShopifyCustomer.Id);
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", OnBeforeWhseShptHeaderInsert, '', false, false)]
    local procedure FlowSalesHeaderFieldsOnBeforeWhseShptHeaderInsert(SalesHeader: Record "Sales Header"; var WarehouseShipmentHeader: Record "Warehouse Shipment Header"; TransferLine: Record "Transfer Line")
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
        WarehouseShipmentHeader."Package Tracking No." := SalesHeader."Package Tracking No.";
        WarehouseShipmentHeader."Requested Delivery Date" := SalesHeader."Requested Delivery Date";
        WarehouseShipmentHeader."Ship to Name" := SalesHeader."Ship-to Name";
        WarehouseShipmentHeader."Shipping Address" := SalesHeader."Ship-to Address";
        WarehouseShipmentHeader."Shipping Address 2" := SalesHeader."Ship-to Address 2";
        WarehouseShipmentHeader."Shipping City" := SalesHeader."Ship-to City";
        WarehouseShipmentHeader."Shipping County" := SalesHeader."Ship-to County";
        WarehouseShipmentHeader."Shipping Post Code" := SalesHeader."Ship-to Post Code";
        WarehouseShipmentHeader."Shipping Country/Region Code" := SalesHeader."Ship-to Country/Region Code";
        WarehouseShipmentHeader."Shipping Phone No." := SalesHeader."Ship-to Phone No.";
        WarehouseShipmentHeader.BillofLading := SalesHeader.BillofLading;
        WarehouseShipmentHeader.CarrierPRONumber := SalesHeader.CarrierPRONumber;
        WarehouseShipmentHeader."SO Date" := SalesHeader."Posting Date";
        WarehouseShipmentHeader."Customer No." := SalesHeader."Sell-to Customer No.";
        WarehouseShipmentHeader."Customer Name" := SalesHeader."Sell-to Customer Name";
        WarehouseShipmentHeader."Customer Posting Group" := SalesHeader."Customer Posting Group";
        if TransferLine."Document No." <> '' then
            WarehouseShipmentHeader."Source No." := TransferLine."Document No.";
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
        WarehouseShipmentLine.Weight := SalesLine."Gross Weight";
        WarehouseShipmentLine.Cubage := SalesLine."Total Cubage FT";
        WarehouseShipmentLine.Modify();
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Transfer Warehouse Mgt.", OnAfterCreateRcptLineFromTransLine, '', false, false)]
    local procedure UpdateSourceNoinHeaderOnAfterCreateRcptLineFromTransLine(TransferLine: Record "Transfer Line"; WarehouseReceiptHeader: Record "Warehouse Receipt Header")
    begin
        WarehouseReceiptHeader."Source No." := TransferLine."Document No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", OnBeforePostedWhseShptHeaderInsert, '', false, false)]
    local procedure UpdateFieldsinPostedShipmentOnBeforePostedWhseShptHeaderInsert(var PostedWhseShipmentHeader: Record "Posted Whse. Shipment Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        PostedWhseShipmentHeader."Order Type Code" := WarehouseShipmentHeader."Order Type Code";
        //PostedWhseShipmentHeader."Shopify Variant Id" := WarehouseShipmentHeader."Shopify Variant Id";
        PostedWhseShipmentHeader."Sent to 3PL Date" := WarehouseShipmentHeader."Sent to 3PL Date";
        PostedWhseShipmentHeader."Sent to 3PL" := WarehouseShipmentHeader."Sent to 3PL";
        PostedWhseShipmentHeader."All Items Fully Commited" := WarehouseShipmentHeader."All Items Fully Commited";
        PostedWhseShipmentHeader."Order Source" := WarehouseShipmentHeader."Order Source";
        PostedWhseShipmentHeader."Store Front Payment Status" := WarehouseShipmentHeader."Store Front Payment Status";
        PostedWhseShipmentHeader."Store Front Payment Gateway" := WarehouseShipmentHeader."Store Front Payment Gateway";
        PostedWhseShipmentHeader."Store Front Payment Event Type" := WarehouseShipmentHeader."Store Front Payment Event Type";
        PostedWhseShipmentHeader."Store Front Payment Authcode" := WarehouseShipmentHeader."Store Front Payment Authcode";
        PostedWhseShipmentHeader."Order Total Check" := WarehouseShipmentHeader."Order Total Check";
        PostedWhseShipmentHeader."Order Total Variance" := WarehouseShipmentHeader."Order Total Variance";
        PostedWhseShipmentHeader."memo" := WarehouseShipmentHeader.memo;
        PostedWhseShipmentHeader."Vendor_Number" := WarehouseShipmentHeader.Vendor_Number;
        PostedWhseShipmentHeader."shippingAddress_attention" := WarehouseShipmentHeader.shippingAddress_attention;
        PostedWhseShipmentHeader."Store_number" := WarehouseShipmentHeader.Store_number;
        PostedWhseShipmentHeader."Dealer_Department_Number" := WarehouseShipmentHeader.Dealer_Department_Description;
        PostedWhseShipmentHeader."Dealer_Department_Description" := WarehouseShipmentHeader.Dealer_Department_Description;
        PostedWhseShipmentHeader."Standard_Carrier_Alpha_Code" := WarehouseShipmentHeader.Standard_Carrier_Alpha_Code;
        PostedWhseShipmentHeader."FOB_Qualifier" := WarehouseShipmentHeader.FOB_Qualifier;
        PostedWhseShipmentHeader."Transportation_Method_Code" := WarehouseShipmentHeader.Transportation_Method_Code;
        PostedWhseShipmentHeader."Transaction_ID" := WarehouseShipmentHeader.Transaction_ID;
        PostedWhseShipmentHeader."discountItem_intID" := WarehouseShipmentHeader.discountItem_intID;
        PostedWhseShipmentHeader."Customer_Account_Number" := WarehouseShipmentHeader.Customer_Account_Number;
        PostedWhseShipmentHeader."Special_Instructions" := WarehouseShipmentHeader.Special_Instructions;
        PostedWhseShipmentHeader."Customer_Order_Number" := WarehouseShipmentHeader.Customer_Order_Number;
        PostedWhseShipmentHeader."Release_No" := WarehouseShipmentHeader.Release_No;
        PostedWhseShipmentHeader."Ship_To_Code_Qualifier" := WarehouseShipmentHeader.Ship_To_Code_Qualifier;
        PostedWhseShipmentHeader."Requested_Ship_Date" := WarehouseShipmentHeader.Requested_Ship_Date;
        PostedWhseShipmentHeader."Current_Scheduled_Delivery" := WarehouseShipmentHeader.Current_Scheduled_Delivery;
        PostedWhseShipmentHeader."Requested_PickUp_Date" := WarehouseShipmentHeader."Requested_PickUp_Date";
        PostedWhseShipmentHeader."Packaging_Type" := WarehouseShipmentHeader."Packaging_Type";
        PostedWhseShipmentHeader."Total_Packages" := WarehouseShipmentHeader."Total_Packages";
        PostedWhseShipmentHeader."PKG_PLT_Qty" := WarehouseShipmentHeader."PKG_PLT_Qty";
        PostedWhseShipmentHeader."Marketplace_Shipment_ID" := WarehouseShipmentHeader."Marketplace_Shipment_ID";
        PostedWhseShipmentHeader."824_Received" := WarehouseShipmentHeader."824_Received";
        PostedWhseShipmentHeader."824_Notes" := WarehouseShipmentHeader."824_Notes";
        PostedWhseShipmentHeader."Routing_Request_Sent" := WarehouseShipmentHeader."Routing_Request_Sent";
        PostedWhseShipmentHeader."Processed" := WarehouseShipmentHeader."Processed";
        PostedWhseShipmentHeader."Supplier_Contact_Name" := WarehouseShipmentHeader."Supplier_Contact_Name";
        PostedWhseShipmentHeader."Supplier_Contact_No" := WarehouseShipmentHeader."Supplier_Contact_No";
        PostedWhseShipmentHeader."Supplier_Contact_Email" := WarehouseShipmentHeader."Supplier_Contact_Email";
        PostedWhseShipmentHeader."Ship From" := WarehouseShipmentHeader."Ship From";
        PostedWhseShipmentHeader."3rd Party Billing Account" := WarehouseShipmentHeader."3rd Party Billing Account";
        PostedWhseShipmentHeader."3rd Party Zip" := WarehouseShipmentHeader."3rd Party Zip";
        PostedWhseShipmentHeader."3rd Party Carrier" := WarehouseShipmentHeader."3rd Party Carrier";
        PostedWhseShipmentHeader."Storefront Name" := WarehouseShipmentHeader."Storefront Name";
        PostedWhseShipmentHeader.isShipresidential := WarehouseShipmentHeader.isShipresidential;
        PostedWhseShipmentHeader."Bill-to Phone No." := WarehouseShipmentHeader."Bill-to Phone No.";
        PostedWhseShipmentHeader."Order Discount Details" := WarehouseShipmentHeader."Order Discount Details";
        PostedWhseShipmentHeader."Order Total Tax" := WarehouseShipmentHeader."Order Total Tax";
        PostedWhseShipmentHeader."Source No." := WarehouseShipmentHeader."Source No.";
        PostedWhseShipmentHeader."Your Reference" := WarehouseShipmentHeader."Your Reference";
        PostedWhseShipmentHeader."Package Tracking No." := WarehouseShipmentHeader."Package Tracking No.";
        PostedWhseShipmentHeader."Requested Delivery Date" := WarehouseShipmentHeader."Requested Delivery Date";
        PostedWhseShipmentHeader."Ship to Name" := WarehouseShipmentHeader."Ship to Name";
        PostedWhseShipmentHeader."Shipping Address" := WarehouseShipmentHeader."Shipping Address";
        PostedWhseShipmentHeader."Shipping Address 2" := WarehouseShipmentHeader."Shipping Address 2";
        PostedWhseShipmentHeader."Shipping City" := WarehouseShipmentHeader."Shipping City";
        PostedWhseShipmentHeader."Shipping County" := WarehouseShipmentHeader."Shipping County";
        PostedWhseShipmentHeader."Shipping Post Code" := WarehouseShipmentHeader."Shipping Post Code";
        PostedWhseShipmentHeader."Shipping Country/Region Code" := WarehouseShipmentHeader."Shipping Country/Region Code";
        PostedWhseShipmentHeader."Shipping Phone No." := WarehouseShipmentHeader."Shipping Phone No.";
        PostedWhseShipmentHeader."SO Date" := WarehouseShipmentHeader."SO Date";
        PostedWhseShipmentHeader.BillofLading := WarehouseShipmentHeader.BillofLading;
        PostedWhseShipmentHeader.CarrierPRONumber := WarehouseShipmentHeader.CarrierPRONumber;
        PostedWhseShipmentHeader."Customer No." := WarehouseShipmentHeader."Customer No.";
        PostedWhseShipmentHeader."Customer Name" := WarehouseShipmentHeader."Customer Name";
        PostedWhseShipmentHeader."Customer Posting Group" := WarehouseShipmentHeader."Customer Posting Group";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", OnCreatePostedShptLineOnBeforePostedWhseShptLineInsert, '', false, false)]
    local procedure UpdateRecordOnCreatePostedShptLineOnBeforePostedWhseShptLineInsert(var PostedWhseShptLine: Record "Posted Whse. Shipment Line"; WhseShptLine: Record "Warehouse Shipment Line")
    begin
        PostedWhseShptLine."Customer Subscription No." := WhseShptLine."Customer Subscription No.";
        PostedWhseShptLine."Shopify Variant Id" := WhseShptLine."Shopify Variant Id";
        PostedWhseShptLine."Dealer Item No." := WhseShptLine."Dealer Item No.";
        PostedWhseShptLine."Discount Details" := WhseShptLine."Discount Details";
        PostedWhseShptLine."Amazon Item ID" := WhseShptLine."Amazon Item ID";
        PostedWhseShptLine.UPC_Code := WhseShptLine.UPC_Code;
        PostedWhseShptLine."PO Line" := WhseShptLine."PO Line";
        PostedWhseShptLine.Weight := WhseShptLine."Weight";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Label Attachments", OnAfterInsertEvent, '', false, false)]
    local procedure CreateDocAttachment(var Rec: Record "Label Attachments"; RunTrigger: Boolean)
    begin
        copydocumentattachment(Rec);
        RemovefromLabelattachment(DT2Date(Rec."Attached Date"));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Inv. Header - Edit", OnOnRunOnBeforeTestFieldNo, '', false, false)]
    local procedure UpdateInvoiceSentFlagOnOnRunOnBeforeTestFieldNo(SalesInvoiceHeaderRec: Record "Sales Invoice Header"; var SalesInvoiceHeader: Record "Sales Invoice Header")
    begin
        SalesInvoiceHeader."Invoice Sent" := SalesInvoiceHeaderRec."Invoice Sent";
    end;

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Inv. - Update", OnAfterRecordChanged, '', false, false)]
    local procedure IsChangedUpdateOnAfterRecordChanged(var SalesInvoiceHeader: Record "Sales Invoice Header"; xSalesInvoiceHeader: Record "Sales Invoice Header"; var IsChanged: Boolean)
    begin
        if SalesInvoiceHeader."Invoice Sent" <> xSalesInvoiceHeader."Invoice Sent" then
            IsChanged := true;
    end;

    procedure copydocumentattachment(var Reclblattach: Record "Label Attachments")
    var
        DocAttachment: Record "Document Attachment";
        InStr: InStream;
        FileName: Text;
        RecRef: RecordRef;
        whseshipment: Record "Warehouse Shipment Header";
        custRec: Record Customer;
        vendRec: Record Vendor;
    begin
        case Reclblattach.DocumentType of
            Reclblattach.DocumentType::"Warehouse Shipment":
                RecRef.GetTable(whseshipment);
            Reclblattach.DocumentType::Customer:
                RecRef.GetTable(custRec);
            Reclblattach.DocumentType::Vendor:
                RecRef.GetTable(vendRec);
        end;
        Reclblattach.CalcFields(Attachment);
        if Reclblattach.Attachment.HasValue then begin

            DocAttachment.Reset();
            DocAttachment.SetRange("No.", Reclblattach.Code);
            DocAttachment.SetRange("File Name", Reclblattach.FileName);
            if not DocAttachment.FindFirst() then begin

                Reclblattach.Attachment.CreateInStream(InStr);
                DocAttachment.Init();
                DocAttachment."Table ID" := RecRef.Number;
                DocAttachment."No." := Reclblattach.Code;
                DocAttachment."File Name" := Reclblattach.FileName;
                DocAttachment."Attached Date" := Reclblattach."Attached Date";
                DocAttachment."Attached By" := Reclblattach."Attached By";
                DocAttachment."File Extension" := Reclblattach.FileExtension;
                DocAttachment."Document Type" := Reclblattach.DocumentType;
                Clear(DocAttachment."Document Reference ID");
                DocAttachment."Document Reference ID".ImportStream(InStr, FileName);
                DocAttachment.Insert(true);

            end;
        end;

    end;


    procedure RemovefromLabelattachment(tillDate: Date)
    var
        DocAttachment: Record "Document Attachment";
        labelAttachment: Record "Label Attachments";
        DateVar: Date;
        DTVar: DateTime;
    begin
        DateVar := CalcDate('CD-1D', tillDate);
        DTVar := CreateDateTime(DateVar, 0T);
        labelAttachment.Reset();
        labelAttachment.SetRange("Attached Date", 0DT, DTVar);
        if labelAttachment.FindSet() then
            repeat
                DocAttachment.Reset();
                DocAttachment.SetRange("No.", labelAttachment.Code);
                DocAttachment.SetRange("File Name", labelAttachment.FileName);
                if DocAttachment.FindFirst() then
                    labelAttachment.Delete();
            until labelAttachment.Next() = 0;

    end;

}