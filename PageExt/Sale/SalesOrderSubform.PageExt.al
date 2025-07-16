pageextension 50126 "Sales Order Subform Extension" extends "Sales Order Subform"
{
    layout
    {
        modify("Line Discount Amount")
        {
            Visible = true;
        }
        movebefore("Line Discount %"; "Line Discount Amount")
        modify("Unit Price")
        {
            Caption = 'Sale Unit Price';
        }
        addafter("Line Amount")
        {
            field(StoreFront_LineAmount; Rec.StoreFront_LineAmount)
            {
                Caption = 'Store Front Line Amount';
                ApplicationArea = all;

            }
        }
        addafter("Unit Price")
        {
            field("BC Unit Price"; Rec."BC Unit Price")
            {
                Caption = 'Base Unit Price';
                ApplicationArea = all;
                Editable = false;
            }
        }
        addafter("Line Amount")
        {
            field("Line Tax Amount"; Rec."Line Tax Amount")
            {
                ApplicationArea = all;
                Caption = 'Line Tax Amount';
            }
        }
        // Add changes to page layout here
        addlast(Control1)
        {

            field("Customer Subscription No."; Rec."Customer Subscription No.")
            {
                ApplicationArea = All;
                Caption = 'Customer Subscription No.';
            }
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