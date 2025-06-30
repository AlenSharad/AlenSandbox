tableextension 50111 "Posted Whse Shpt Header Ext" extends "Posted Whse. Shipment Header"
{
    fields
    {
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
            Editable = false;
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
    }
}