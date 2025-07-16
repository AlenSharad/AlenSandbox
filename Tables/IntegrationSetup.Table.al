table 50109 "Integration Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "API URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "API Key"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Username"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Password"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Active"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Last Sync DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }

    }
    // ...existing code...
    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

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

}