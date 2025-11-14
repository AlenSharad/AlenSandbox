page 50125 "API - Create Whse Shipment"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Create Warehouse Shipment';
    EntitySetCaption = 'Create Warehouse Shipments';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'createWarehouseShipment';
    EntitySetName = 'createWarehouseShipments';
    ODataKeyFields = "External Document No.";
    PageType = API;
    SourceTable = "Sales Order Entity Buffer";
    SourceTableTemporary = true;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = false;
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
    Extensible = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(salesOrderid; Rec."External Document No.")
                {
                    Caption = 'Id';
                    Editable = true;
                    trigger OnValidate()
                    var
                        salesHeader: Record "Sales Header";
                    begin
                        salesHeader.Reset();
                        salesHeader.SetRange("Document Type", salesHeader."Document Type"::Order);
                        salesHeader.SetRange("No.", Rec."External Document No.");
                        if not salesHeader.FindFirst() then
                            Error('Not Valid sales order id.');
                    end;
                }
                field(trackingNo; trackingNo)
                {
                    Caption = 'Tracking No.';
                    Editable = true;
                }
                field(externalShipmentId; externalShipmentId)
                {
                    Caption = 'Shipment Id';
                    Editable = true;
                }
                field(shipmentDate; shipmentDate)
                {
                    Caption = 'Shipment Date';
                    Editable = true;
                }
                field(shipmentId; shipmentId)
                {
                    Caption = 'Shipment Id';
                    Editable = false;
                }
                field(carrierPRONumber; carrierPRONumber)
                {
                    Caption = 'Carrier PRO Number';
                    Editable = true;
                }
                field(billOfLading; billOfLading)
                {
                    Caption = 'billOfLading';
                    Editable = true;
                }
                field(pkgType; pkgType)
                {
                    Caption = 'Package Type';
                    Editable = true;
                }
                field(pkgPLTQty; pkgPLTQty)
                {
                    Caption = 'Package Pallet Quantity';
                    Editable = true;
                }
                field(totalPkg; totalPkg)
                {
                    Caption = 'Total Package';
                    Editable = true;
                }
                field(message; message)
                {
                    Caption = 'Response Message';

                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        salesHeader: Record "Sales Header";
        SID: Guid;
        WhseShipment: Record "Warehouse Shipment Header";
    begin

        if BelowxRec then
            exit(true);

        if Format(Rec."External Document No.") <> '' then begin
            salesHeader.Reset();
            salesHeader.SetRange("Document Type", salesHeader."Document Type"::Order);
            salesHeader.SetRange("No.", Rec."External Document No.");
            if salesHeader.FindFirst() then begin
                salesHeader."Package Tracking No." := trackingNo;
                salesHeader.Marketplace_Shipment_ID := externalShipmentId;
                salesHeader.CarrierPRONumber := carrierPRONumber;
                salesHeader.BillofLading := billOfLading;
                salesHeader.Packaging_Type := pkgType;
                salesHeader.PKG_PLT_Qty := pkgPLTQty;
                salesHeader.Total_Packages := totalPkg;
                salesHeader.Modify();
                WhseShipment.Reset();
                WhseShipment.SetRange("Source No.", salesHeader."No.");
                if WhseShipment.FindFirst() then begin
                    shipmentId := WhseShipment.SystemId;
                    message := 'Shipment already exist.';
                    Error('Shipment already exist.');
                    exit(false);
                end;
                createWarehouseShipment(salesHeader);
            end;
        end else begin
            message := 'Request must have sales order id.';
            Error('Request must have sales order id.');
        end;

        exit(true);
    end;


    procedure createWarehouseShipment(var SalesHeader: Record "Sales Header")
    var
        WarehouseRequest: Record "Warehouse Request";
        ShipmentCreated: Boolean;
        GetSourceDocOB: codeunit "Get Source Doc. Outbound";
        WhseShipment: Record "Warehouse Shipment Header";
        WarehouseShipmentLine: Record "Warehouse Shipment Line";
    begin

        if not SalesHeader.IsApprovedForPosting() then
            ShipmentCreated := false;

        GetSourceDocOB.FindWarehouseRequestForSalesOrder(WarehouseRequest, SalesHeader);
        ShipmentCreated := GetSourceDocOB.CreateWhseShipmentHeaderFromWhseRequest(WarehouseRequest);
        if ShipmentCreated then begin
            WhseShipment.Reset();
            WhseShipment.SetRange("Source No.", SalesHeader."No.");
            if WhseShipment.FindFirst() then begin
                shipmentId := WhseShipment.SystemId;
                message := 'Warehouse Shipment Created Successfully';
                WhseShipment."Shipment Date" := shipmentDate;
                WhseShipment.Marketplace_Shipment_ID := externalShipmentId;
                WhseShipment.CarrierPRONumber := carrierPRONumber;
                WhseShipment.BillofLading := billOfLading;
                WhseShipment.Packaging_Type := pkgType;
                WhseShipment.PKG_PLT_Qty := pkgPLTQty;
                WhseShipment.Total_Packages := totalPkg;
                WarehouseShipmentLine.reset();
                WarehouseShipmentLine.SetRange("No.", WhseShipment."No.");
                if not WarehouseShipmentLine.IsEmpty() then
                    WarehouseShipmentLine.ModifyAll("Shipment Date", WhseShipment."Shipment Date");
                WhseShipment.Modify();
            end;
        end else begin
            message := GetLastErrorText;
            Error(GetLastErrorText);
        end;
    end;

    var
        shipmentId: Guid;
        trackingNo: Text[500];
        shipmentDate: Date;
        message: Text[250];
        externalShipmentId: Text[50];
        carrierPRONumber: Text[50];
        billOfLading: Text[50];
        pkgType: Text[50];
        pkgPLTQty: Decimal;
        totalPkg: Decimal;
}