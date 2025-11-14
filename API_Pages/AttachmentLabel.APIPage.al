
page 50144 "API - Label Attachment"
{
    DelayedInsert = true;
    APIVersion = 'v2.0';
    EntityCaption = 'Label Attachment';
    EntitySetCaption = 'Label Attachments';
    PageType = API;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    ODataKeyFields = SystemId;
    EntityName = 'labelAttachment';
    EntitySetName = 'labelAttachments';
    SourceTable = "Label Attachments";
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
    Extensible = true;
    Editable = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(code; Rec.Code)
                {
                    Caption = 'No.';
                }

                field(documentType; Rec.DocumentType)
                {
                    Caption = 'Document Type';

                }
                field(fileName; Rec.FileName)
                {
                    Caption = 'File Name';
                }
                field(fileExtension; Rec.FileExtension)
                {
                    Caption = 'File Extension';
                }

                field(attachment; Rec.Attachment)
                {
                    Caption = 'Attachment';
                }
                field(In64bitValue; In64bitValue)
                {
                    Caption = 'In 64 bit';
                    Editable = true;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Base64 value to be inserted.';

                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        if In64bitValue <> '' then
                            Rec.ImportAttachment(In64bitValue)
                        else
                            Error('In64bitValue cannot be empty');
                    end;
                }
                field(Out64bitValue; Out64bitValue)
                {
                    Caption = 'Out 64 bit';
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Base64 value to be retrieved.';

                }
            }
        }

    }
    trigger OnAfterGetRecord()

    begin
        Out64bitValue := Rec.ConvertedTo64Value();
    end;

    trigger OnOpenPage()
    begin
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        labelattachment: Record "Label Attachments";
        RecRef: RecordRef;
        whseshipment: Record "Warehouse Shipment Header";
        custRec: Record Customer;
        vendRec: Record Vendor;
    begin
        if Rec.Code = '' then
            Error('Shipment No. must have a value.');
        if Rec.fileName = '' then
            Error('File Name must have a value.');
        case Rec.DocumentType of
            Rec.DocumentType::"Warehouse Shipment":
                begin
                    if Not whseshipment.Get(Rec.Code) then
                        Error('Warehouse Shipment %1 does not exist.', Rec.Code);
                    RecRef.GetTable(whseshipment);
                end;
            Rec.DocumentType::Customer:
                begin
                    if Not custRec.Get(Rec.Code) then
                        Error('Customer %1 does not exist.', Rec.Code);
                    RecRef.GetTable(custRec);
                end;
            Rec.DocumentType::Vendor:
                begin
                    if Not vendRec.Get(Rec.Code) then
                        Error('Vendor %1 does not exist.', Rec.Code);
                    RecRef.GetTable(vendRec);
                end;
            else
                Error('Document Type %1 is not supported. It must be Customer, Vendor or Warehouse Shipment.', Format(Rec.DocumentType));
        end;
        labelattachment.Reset();
        labelattachment.SetRange(Code, Rec.Code);
        labelattachment.SetRange(FileName, Rec.FileName);
        if labelattachment.FindFirst() then
            Error('Attachment with file name %1 already exist.', Rec.FileName);
        Rec."Attached By" := UserSecurityId();
        Rec."Attached Date" := CurrentDateTime;

    end;



    var
        In64bitValue: Text;
        Out64bitValue: Text;
}