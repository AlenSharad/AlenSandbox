tableextension 50120 "Sales Inv Line Agg Extension" extends "Sales Invoice Line Aggregate"
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
        field(50102; "Discount Details"; Text[100])
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
        field(50108; "Customer Subscription No."; Text[50])
        {
            Caption = 'Customer Subscription No.';
            DataClassification = CustomerContent;
        }
        field(50111; "Line Tax AmountN"; Decimal)
        {
            Caption = 'Line Tax Amount';
            DataClassification = CustomerContent;
        }
        field(50112; "Gross Weight"; Decimal)
        {
            Caption = 'Gross Weight';
            DecimalPlaces = 0 : 5;
        }
        field(50113; "Net Weight"; Decimal)
        {
            Caption = 'Net Weight';
            DecimalPlaces = 0 : 5;
        }
        field(50114; "Item Type"; Enum "Item Type")
        {
            Caption = 'Item Type';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50116; "Total Cubage FT"; Decimal)
        {
            Caption = 'Total Cubage FT';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(50250; "Ava Line Override Type"; Option)
        {
            Caption = 'Tax Override Type';
            OptionMembers = " ",TaxDate,Amount;
        }
        field(50251; "Ava Line Override Amount"; Decimal)
        {
            Caption = 'Tax Override Amount';
        }
        field(50252; "Ava Line Override Reason"; Text[250])
        {
            Caption = 'Tax Override Reason';
        }
    }
}