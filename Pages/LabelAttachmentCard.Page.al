page 50118 "Label Attachment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Label Attachments";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    Caption = 'Code';
                    ToolTip = 'ALN - Specifies the code of the document to which the attachment is linked.';
                }
                field(DocumentType; Rec.DocumentType)
                {
                    ApplicationArea = All;
                    Caption = 'Document Type';
                    ToolTip = 'ALN - Specifies the type of document to which the attachment is linked.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'ALN - Specifies the description of the attachment.';
                }
                field(FileName; Rec.FileName)
                {
                    ApplicationArea = All;
                    Caption = 'File Name';
                    ToolTip = 'ALN - Specifies the name of the file that contains the attachment.';
                }
                field(FileExtension; Rec.FileExtension)
                {
                    ApplicationArea = All;
                    Caption = 'File Extension';
                    ToolTip = 'ALN - Specifies the file extension of the attachment.';
                }
                field("Base 64 Value"; Bit64TextValue)
                {
                    ApplicationArea = All;
                    Caption = 'Base 64 Value';
                    ToolTip = 'ALN - Specifies the Base64 value of the attachment.';
                    MultiLine = true;
                }
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    ToolTip = 'ALN - Specifies the attachment.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Convert to Blob")
            {
                ApplicationArea = All;
                Caption = 'Convert to Blob';
                ToolTip = 'ALN - Converts the Base64 value to a Blob attachment.';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                trigger OnAction()
                begin
                    Rec.ImportAttachment(Bit64TextValue);
                end;
            }
            action("Export Attachment")
            {
                ApplicationArea = All;
                Caption = 'Download Attachment';
                ToolTip = 'ALN - Converts the Blob attachment to a Base64 value.';
                Promoted = true;
                PromotedCategory = Process;
                Image = Export;
                trigger OnAction()
                begin
                    Rec.ExportAttachment();
                end;
            }
        }
    }

    var
        Bit64TextValue: Text;
}