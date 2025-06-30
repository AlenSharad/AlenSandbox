table 50100 "Order Type"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Order Type List";
    Caption = 'Order Type';
    Access = Public;
    TableType = Normal;
    LookupPageId = "Order Type List";

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