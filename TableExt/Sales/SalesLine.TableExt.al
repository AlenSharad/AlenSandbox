tableextension 50124 "Sales Line Extension" extends "Sales Line"
{
    fields
    {
        field(50100; "Shopify Variant Id"; Text[50])
        {
            Caption = 'Shopify Variant Id';
            DataClassification = ToBeClassified;
        }
        field(50101; "Dealer Item No."; Text[50])
        {
            Caption = 'Dealer Item No.';
            DataClassification = ToBeClassified;
        }
        field(50102; "Discount Details"; Text[50])
        {
            Caption = 'Discount Details';
            DataClassification = ToBeClassified;
        }
        field(50103; "PO Line"; Text[50])
        {
            Caption = 'PO Line';
            DataClassification = ToBeClassified;
        }
        field(50104; "UPC_Code"; Text[50])
        {
            Caption = 'Marketplace UPC Code';
            DataClassification = ToBeClassified;
        }
        field(50105; "Amazon Item ID"; Text[50])
        {
            Caption = 'Amazon Item ID';
            DataClassification = ToBeClassified;
        }
        field(50106; "StoreFront_LineAmount"; Decimal)
        {
            Caption = 'Storefront Line Amount';
            DataClassification = ToBeClassified;
        }
        field(50107; "BC Unit Price"; Decimal)
        {
            Caption = 'BC Unit Price';
            DataClassification = ToBeClassified;
        }
        field(50108; "Customer Subscription No."; Text[50])
        {
            Caption = 'Customer Subscription No.';
            DataClassification = CustomerContent;
        }
        field(50111; "Line Tax Amount"; Decimal)
        {
            Caption = 'Line Tax Amount';
            DataClassification = CustomerContent;
        }

    }
}