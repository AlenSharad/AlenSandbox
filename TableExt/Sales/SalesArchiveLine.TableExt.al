tableextension 50127 "Sales Archive Line Extension" extends "Sales Line Archive"
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
    }
}