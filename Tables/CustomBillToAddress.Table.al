table 50105 "Custom Bill To Address"
{
    Caption = 'Custom Bill To Address';

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(3; "BillToOptions"; Enum "Sales Bill-to Options")
        {
            Caption = 'Bill To Options';
            DataClassification = ToBeClassified;
        }
        field(4; "BilltoAdd1"; Text[100])
        {
            Caption = 'Bill-to Address 1';
            DataClassification = ToBeClassified;
        }
        field(5; "BilltoAdd2"; Text[100])
        {
            Caption = 'Bill-to Address 2';
            DataClassification = ToBeClassified;
        }
        field(6; "billtoPostCode"; Code[20])
        {
            Caption = 'Bill-to Post Code';
            DataClassification = ToBeClassified;
        }
        field(7; "billtoCity"; Text[50])
        {
            Caption = 'Bill-to City';
            DataClassification = ToBeClassified;
        }
        field(8; "billtoCountryRegionCode"; Code[10])
        {
            Caption = 'Bill-to Country/Region Code';
            DataClassification = ToBeClassified;
        }
        field(9; "billtoCounty"; Text[50])
        {
            Caption = 'Bill-to County';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }
}