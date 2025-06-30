table 50103 "Order Source"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Order Source List";
    Caption = 'Order Source';
    Access = Public;
    TableType = Normal;
    LookupPageId = "Order Source List";

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
}