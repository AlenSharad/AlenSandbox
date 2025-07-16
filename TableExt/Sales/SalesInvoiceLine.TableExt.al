tableextension 50125 "Sales Invoice Line Extension" extends "Sales Invoice Line"
{
    fields
    {
        field(50100; "Shopify Variant Id"; Text[50])
        {
            Caption = 'Shopify Variant Id';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50101; "Dealer Item No."; Text[50])
        {
            Caption = 'Dealer Item No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50102; "Discount Details"; Text[50])
        {
            Caption = 'Discount Details';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50103; "PO Line"; Text[50])
        {
            Caption = 'PO Line';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50104; "UPC_Code"; Text[50])
        {
            Caption = 'Marketplace UPC Code';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50105; "Amazon Item ID"; Text[50])
        {
            Caption = 'Amazon Item ID';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50106; "StoreFront_LineAmount"; Decimal)
        {
            Caption = 'Storefront Line Amount';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50107; "BC Unit Price"; Decimal)
        {
            Caption = 'BC Unit Price';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50108; "Customer Subscription No."; Text[50])
        {
            Caption = 'Customer Subscription No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50111; "Line Tax Amount"; Decimal)
        {
            Editable = false;
            Caption = 'Line Tax Amount';
            DataClassification = CustomerContent;
        }
    }
}