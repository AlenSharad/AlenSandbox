page 50117 "Label Attachment List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Label Attachments";
    CardPageId = "Label Attachment Card";
    Caption = 'Label Attachments';
    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    ToolTip = 'ALN - Specifies the attachment.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
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
}