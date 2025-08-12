table 50112 "API Log"
{
    Caption = 'API Log';
    DrillDownPageId = "API Logs";
    LookupPageId = "API Logs";
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; URL; Text[500])
        {
            Caption = 'URL';
            DataClassification = SystemMetadata;
        }
        field(3; "API Name"; Text[100])
        {
            Caption = 'API Name';
            DataClassification = SystemMetadata;
        }
        field(4; "Request"; Blob)
        {
            Caption = 'Request';
            DataClassification = ToBeClassified;
        }
        field(5; "Response"; Blob)
        {
            Caption = 'Response';
            DataClassification = ToBeClassified;
        }
        field(6; "Status Code"; Integer)
        {
            Caption = 'Status Code';
            DataClassification = SystemMetadata;
        }
        field(7; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
            DataClassification = SystemMetadata;
        }
        field(8; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = SystemMetadata;
        }
        field(9; Method; Enum "Http Request Type")
        {
            Caption = 'Method';
            DataClassification = SystemMetadata;
        }
        field(10; LoggedOn; DateTime)
        {
            Caption = 'Logged On';
            DataClassification = SystemMetadata;
        }
        field(11; Success; Boolean)
        {
            Caption = 'Success';
            DataClassification = SystemMetadata;
        }

        field(12; DocumentNo; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = SystemMetadata;
        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    procedure DownloadRequest()
    var
        Instr: InStream;
        FileName: Text;
    begin
        if not Rec."Request".HasValue() then
            Error('requestblank');
        Rec.SetAutoCalcFields(Request);
        Rec.Request.CreateInStream(Instr);
        FileName := 'Request_' + Format(Rec."Entry No.") + FORMAT(Rec.Method) + '.json';
        DownloadFromStream(Instr, 'Request_', '', 'Json Files (*.json)|*.json', FileName);
        // Rec."Request".DownloadToFile('C:\Temp\Request_' + Format(Rec."Entry No.") + '.txt');
    end;

    procedure DownloadResponse()
    var
        Instr: InStream;
        FileName: Text;
    begin
        if not Rec.Response.HasValue() then
            exit;
        Rec.SetAutoCalcFields(Response);
        Rec.Response.CreateInStream(Instr);
        FileName := 'Response_' + Format(Rec."Entry No.") + FORMAT(Rec.Method) + '.json';
        DownloadFromStream(Instr, 'Response_', '', 'Json Files (*.json)|*.json', FileName);
        // Rec."Request".DownloadToFile('C:\Temp\Request_' + Format(Rec."Entry No.") + '.txt');
    end;
}