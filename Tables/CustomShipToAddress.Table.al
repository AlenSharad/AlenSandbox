table 50110 "Custom Ship To Address"
{
    Caption = 'Custom Ship To Address';

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
        field(3; "ShipToOptions"; Enum "Sales Ship-to Options")
        {
            Caption = 'Ship To Options';
            DataClassification = ToBeClassified;
        }
        field(4; "ShiptoAdd1"; Text[100])
        {
            Caption = 'Ship-to Address 1';
            DataClassification = ToBeClassified;
        }
        field(5; "ShiptoAdd2"; Text[100])
        {
            Caption = 'Ship-to Address 2';
            DataClassification = ToBeClassified;
        }
        field(6; "ShiptoPostCode"; Code[20])
        {
            Caption = 'Ship-to Post Code';
            DataClassification = ToBeClassified;
        }
        field(7; "ShiptoCity"; Text[50])
        {
            Caption = 'Ship-to City';
            DataClassification = ToBeClassified;
        }
        field(8; "ShiptoCountryRegionCode"; Code[10])
        {
            Caption = 'Ship-to Country/Region Code';
            DataClassification = ToBeClassified;
        }
        field(9; "ShiptoCounty"; Text[50])
        {
            Caption = 'Ship-to County';
            DataClassification = ToBeClassified;
        }
        field(10; ShipToName; Text[50])
        {
            Caption = 'Ship To Name';
            DataClassification = ToBeClassified;
        }
        field(100; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Document Type", "Document No.", "External Document No.")
        {
            Clustered = true;
        }
    }
}