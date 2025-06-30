pageextension 50126 "Sales Order Subform Extension" extends "Sales Order Subform"
{
    layout
    {
        modify("Line Discount Amount")
        {
            Visible = true;
        }
        movebefore("Line Discount %"; "Line Discount Amount")
        // Add changes to page layout here
        addlast(Control1)
        {

            field("Shopify Variant Id"; Rec."Shopify Variant Id")
            {
                ApplicationArea = All;
                Caption = 'Shopify Variant Id';
            }
            field("Dealer Item No."; Rec."Dealer Item No.")
            {
                ApplicationArea = All;
                Caption = 'Dealer Item No.';
            }
            field("Discount Details"; Rec."Discount Details")
            {
                ApplicationArea = All;
                Caption = 'Discount Details';
            }
        }
    }

}