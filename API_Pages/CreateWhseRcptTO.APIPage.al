page 50135 "API -Create Whse Rcpt Transfer"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Create Warehouse Receipt';
    EntitySetCaption = 'Create Warehouse Receipts';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'warehouseReceiptTO';
    EntitySetName = 'warehouseReceiptTOs';
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
                field(receiptId; receiptId)
                {
                    Caption = 'Receipt Id';
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
        WhseReceipt: Record "Warehouse Receipt Line";
    begin

        if BelowxRec then
            exit(true);

        if Format(Rec."No.") <> '' then begin
            TransferHeader.Reset();
            TransferHeader.SetRange("No.", Rec."No.");
            if TransferHeader.FindFirst() then begin
                WhseReceipt.Reset();
                WhseReceipt.SetRange("Source No.", TransferHeader."No.");
                if WhseReceipt.FindFirst() then begin
                    receiptId := WhseReceipt.SystemId;
                    message := 'Receipt already exist.';
                    exit(false);
                end;
                createWarehouseReceipt(TransferHeader);
            end;
        end else begin
            message := 'Request must have sales order id.';
        end;

        exit(true);
    end;


    procedure createWarehouseReceipt(TransferHeader: Record "Transfer Header")
    var
        WarehouseRequest: Record "Warehouse Request";
        ReceiptCreated: Boolean;
        GetSourceDocInbound: Codeunit "Get Source Doc. Inbound";
        WhseReceipt: Record "Warehouse Receipt Line";
    begin

        if TransferHeader.Status <> TransferHeader.Status::Released then
            ReceiptCreated := false;

        // GetSourceDocOB.CreateFromOutbndTransferOrder(TransferHeader);
        ReceiptCreated := GetSourceDocInbound.CreateFromInbndTransferOrderHideDialog(TransferHeader);
        if ReceiptCreated then begin
            WhseReceipt.Reset();
            WhseReceipt.SetRange("Source No.", TransferHeader."No.");
            if WhseReceipt.FindFirst() then begin
                receiptId := WhseReceipt.SystemId;
                message := 'Warehouse Receipt Created Successfully';
            end;
        end else
            message := GetLastErrorText;
    end;

    var
        receiptId: Guid;
        message: Text[250];
}