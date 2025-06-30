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
    }
}