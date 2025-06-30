tableextension 50100 CustomerExtension extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(50000; Status; Enum CustomerStstus)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Third Party Billing Address"; Text[100])
        {
            Caption = '3rd Party Billing Address';
            DataClassification = ToBeClassified;
        }
        field(50002; "Third Party Billing Account"; Text[30])
        {
            Caption = '3rd Party Billing ACcount';
            DataClassification = ToBeClassified;
        }
        field(50003; "Third Party Carrier"; Text[50])
        {
            Caption = '3rd Party Carrier';
            DataClassification = ToBeClassified;
        }
        field(50004; "Third Party Zip Code"; Text[30])
        {
            Caption = '3rd Party Zip Code';
            TableRelation = "Post Code";
            DataClassification = ToBeClassified;
        }
        field(50005; "PBCS Category"; Enum CustomerPBCS)
        {
            Caption = 'PBCS Category';
            DataClassification = ToBeClassified;
        }
        field(50006; "Customer Sets Location"; Boolean)
        {
            Caption = 'Customer Sets Location';
            DataClassification = ToBeClassified;
        }
        field(50007; "subscription_customer"; Boolean)
        {
            Caption = 'Subscription Customer';
            DataClassification = ToBeClassified;
        }
        field(50008; "warranty_customer"; Boolean)
        {
            Caption = 'Warranty Customer';
            DataClassification = ToBeClassified;
        }
        // field(50009; "b2b_customer"; Boolean)
        // {
        //     Caption = 'B2B Customer';
        //     DataClassification = ToBeClassified;
        // }
        field(50010; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
        }
        field(50011; "Shopify Customer No."; Code[20])
        {
            Caption = 'Shopify Customer No.';
            DataClassification = ToBeClassified;
        }
        field(50012; "Zendesk Customer No."; Code[20])
        {
            Caption = 'Zendesk Customer No.';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}