page 50134 "API -Create Whse Ship Transfer"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Create Warehouse Shipment';
    EntitySetCaption = 'Create Warehouse Shipments';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'warehouseShipmentTO';
    EntitySetName = 'warehouseShipmentTOs';
    ODataKeyFields = "No.";
    PageType = API;
    SourceTable = "Transfer Header";
    SourceTableTemporary = true;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = false;
    APIPublisher = 'HappiestMinds';
    APIGroup = 'AlenAPIS';
    Extensible = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(transferOrderid; Rec."No.")
                {
                    Caption = 'No.';
                    Editable = true;
                    trigger OnValidate()
                    var
                        transferHeader: Record "Transfer Header";
                    begin

                        transferHeader.Reset();
                        transferHeader.SetRange("No.", Rec."No.");
                        if not transferHeader.FindFirst() then
                            Error('Not Valid sales order id.');
                    end;
                }
                field(shipmentId; shipmentId)
                {
                    Caption = 'Shipment Id';
                    Editable = false;
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
        TransferHeader: Record "Transfer Header";
        SID: Guid;
        WhseShipment: Record "Warehouse Shipment Header";
    begin

        if BelowxRec then
            exit(true);

        if Format(Rec."No.") <> '' then begin
            TransferHeader.Reset();
            TransferHeader.SetRange("No.", Rec."No.");
            if TransferHeader.FindFirst() then begin
                WhseShipment.Reset();
                WhseShipment.SetRange("Source No.", TransferHeader."No.");
                if WhseShipment.FindFirst() then begin
                    shipmentId := WhseShipment.SystemId;
                    message := 'Shipment already exist.';
                    Error('Shipment already exist.');
                    exit(false);
                end;
                createWarehouseShipment(TransferHeader);
            end;
        end else begin
            message := 'Request must have sales order id.';
            Error('Request must have sales order id.');
        end;

        exit(true);
    end;


    procedure createWarehouseShipment(TransferHeader: Record "Transfer Header")
    var
        WarehouseRequest: Record "Warehouse Request";
        ShipmentCreated: Boolean;
        GetSourceDocOB: codeunit "Get Source Doc. Outbound";
        WhseShipment: Record "Warehouse Shipment Header";
    begin

        if TransferHeader.Status <> TransferHeader.Status::Released then
            ShipmentCreated := false;

        // GetSourceDocOB.CreateFromOutbndTransferOrder(TransferHeader);
        ShipmentCreated := GetSourceDocOB.CreateFromOutbndTransferOrderHideDialog(TransferHeader);
        if ShipmentCreated then begin
            WhseShipment.Reset();
            WhseShipment.SetRange("Source No.", TransferHeader."No.");
            if WhseShipment.FindFirst() then begin
                shipmentId := WhseShipment.SystemId;
                message := 'Warehouse Shipment Created Successfully';
            end;
        end else begin
            message := GetLastErrorText;
            Error(GetLastErrorText);
        end;
    end;

    var
        shipmentId: Guid;
        message: Text[250];
}