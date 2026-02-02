table 50113 "Label Attachments"
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; DocumentType; Enum "Attachment Document Type")
        {
            Caption = 'Document Type';
            DataClassification = CustomerContent;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(4; FileName; Text[100])
        {
            Caption = 'File Name';
            DataClassification = CustomerContent;
        }
        field(5; FileExtension; Text[100])
        {
            Caption = 'File Name';
            DataClassification = CustomerContent;
        }
        field(6; Attachment; Blob)
        {
            Caption = 'Attachment';
            DataClassification = CustomerContent;
        }
        field(7; "Attached Date"; DateTime)
        {
            Caption = 'Attached Date';
        }
        field(9; "Attached By"; Guid)
        {
            Caption = 'Attached By';
            Editable = false;
            TableRelation = User."User Security ID" where("License Type" = const("Full User"));
        }
        field(10; User; Code[50])
        {
            CalcFormula = lookup(User."User Name" where("User Security ID" = field("Attached By"),
                                                         "License Type" = const("Full User")));
            Caption = 'User';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;


        }

    }

    keys
    {
        key(PK; Code, DocumentType, "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure ImportAttachment(Base64Value: Text)
    var
        Base64Converter: Codeunit "Base64 Convert";
        TempOutstream: OutStream;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
    begin
        if Base64Value = '' then
            exit;
        RecRef.Open(Database::"Label Attachments");
        RecRef.GetTable(Rec);
        TempBlob.CreateOutStream(TempOutstream);
        Base64Converter.FromBase64(Base64Value, TempOutstream);
        TempBlob.ToRecordRef(RecRef, Rec.FieldNo(Attachment));
        RecRef.SetTable(Rec);
        RecRef.Close();
    end;

    procedure ExportAttachment()
    var
        IStream: InStream;
        ExportFileName: Text;
    begin
        ExportFileName := Rec.Code + '.' + Rec.FileExtension;
        Rec.CalcFields(Attachment);
        if not Rec.Attachment.HasValue then
            exit;
        Rec.Attachment.CreateInStream(IStream);
        DownloadFromStream(IStream, '', '', '', ExportFileName);
    end;

    procedure ConvertedTo64Value(): Text
    var
        Base64Converter: Codeunit "Base64 Convert";
        TempInstream: InStream;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
    begin
        RecRef.Open(Database::"Label Attachments");
        RecRef.GetTable(Rec);
        TempBlob.FromRecordRef(RecRef, Rec.FieldNo(Attachment));
        TempBlob.CreateInStream(TempInstream);
        RecRef.SetTable(Rec);
        RecRef.Close();
        exit(Base64Converter.ToBase64(TempInstream));
    end;
}