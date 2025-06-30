tableextension 50109 "Sales Order Entity Buffer Ext" extends "Sales Order Entity Buffer"
{
    fields
    {
        field(11; "Your Reference"; Text[35])
        {
            Caption = 'Your Reference';
        }
        field(28; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location where("Use As In-Transit" = const(false));
        }
        field(114; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";
            ValidateTableRelation = false;
        }
        field(104; "Payment Method Code"; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
        }
        field(105; "Shipping Agent Code"; Code[10])
        {
            AccessByPermission = TableData "Shipping Agent Services" = R;
            Caption = 'Shipping Agent Code';
            TableRelation = "Shipping Agent";
        }
        field(115; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';
        }

        field(5794; "Shipping Agent Service Code"; Code[10])
        {
            Caption = 'Shipping Agent Service Code';
            TableRelation = "Shipping Agent Services".Code where("Shipping Agent Code" = field("Shipping Agent Code"));
        }
        field(50100; "Order Type Code"; Code[20])
        {
            Caption = 'Order Type Code';
            DataClassification = ToBeClassified;
            TableRelation = "Order Type".Code;
        }
        field(50101; "Shopify Variant Id"; Text[50])
        {
            Caption = 'Shopify Variant Id';
            DataClassification = ToBeClassified;
        }
        field(50102; "Sent to 3PL Date"; DateTime)
        {
            Caption = 'Sent to 3PL Date';
            DataClassification = ToBeClassified;
        }

        field(50103; "Sent to 3PL"; Boolean)
        {
            Caption = 'Sent to 3PL';
            DataClassification = ToBeClassified;
        }
        field(50104; "All Items Fully Commited"; Boolean)
        {
            Caption = 'All Items Fully Commited';
            DataClassification = ToBeClassified;
        }
        field(50105; "Order Source"; Code[20])
        {
            Caption = 'Order Source Code';
            DataClassification = ToBeClassified;
            TableRelation = "Order Source".Code;
        }
        field(50106; "Store Front Payment Status"; Text[50])
        {
            Caption = 'Store Front Payment Status';
            DataClassification = ToBeClassified;
        }
        field(50107; "Store Front Payment Gateway"; Code[20])
        {
            Caption = 'Store Front Payment Gateway';
            DataClassification = ToBeClassified;
        }
        field(50108; "Store Front Payment Event Type"; Text[50])
        {
            Caption = 'Store Front Payment Event Type';
            DataClassification = ToBeClassified;
        }
        field(50109; "Store Front Payment Authcode"; Text[50])
        {
            Caption = 'Store Front Payment Authcode';
            DataClassification = ToBeClassified;
        }
        field(50501; BillToOptions; Enum "Sales Bill-to Options")
        {
            Caption = 'Bill To Options';
            DataClassification = CustomerContent;
        }


    }

}