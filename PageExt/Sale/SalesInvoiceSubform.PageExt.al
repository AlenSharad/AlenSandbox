pageextension 50128 SalesInvoiceSubformExt extends "Sales Invoice Subform"
{
    layout
    {
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
            field("Amazon Item ID"; Rec."Amazon Item ID")
            {
                ApplicationArea = all;
                Caption = 'Amazon Item ID';
            }
            field(UPC_Code; Rec.UPC_Code)
            {
                ApplicationArea = all;
                Caption = 'Marketplace UPC Code';
            }
            field("PO Line"; Rec."PO Line")
            {
                ApplicationArea = all;
                Caption = 'PO Line';
            }
        }
    }

}