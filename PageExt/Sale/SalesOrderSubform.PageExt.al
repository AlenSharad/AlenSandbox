pageextension 50126 "Sales Order Subform Extension" extends "Sales Order Subform"
{
    layout
    {
        modify("Line Discount Amount")
        {
            Visible = true;
        }
        modify("Gross Weight")
        {
            Visible = true;
            Caption = 'Total Weight';
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
                Editable = false;
                ToolTip = 'ALN - Specifies the store front line amount of the Order.';
            }
        }
        addafter("Unit Price")
        {
            field("BC Unit Price"; Rec."BC Unit Price")
            {
                Caption = 'BC Price Level';
                ApplicationArea = all;
                Editable = false;
                ToolTip = 'ALN - Specifies the Base unit price of the order.';
            }
        }
        addafter("Line Amount")
        {
            field("Line Tax Amount"; Rec."Line Tax Amount")
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Line Tax Amount';
                ToolTip = 'ALN - Specifies the tax amount for the line item in the sales order.';
            }
            field("Ava Line Override Type"; Rec."Ava Line Override Type")
            {
                ApplicationArea = All;
                Caption = 'Ava Line Override Type';
                ToolTip = 'ALN - Specifies the Ava tax line override type for the sales order.';
            }
            field("Ava Line Override Amount"; Rec."Ava Line Override Amount")
            {
                ApplicationArea = All;
                Caption = 'Ava Line Override Amount';
                ToolTip = 'ALN - Specifies the Ava tax line override amount for the sales order.';
            }
            field("Ava Line Override Reason"; Rec."Ava Line Override Reason")
            {
                ApplicationArea = All;
                Caption = 'Ava Line Override Reason';
                ToolTip = 'ALN - Specifies the Ava tax line override reason for the sales order.';
            }
            field("VAT Calculation Type"; Rec."VAT Calculation Type")
            {
                ApplicationArea = All;
                Caption = 'VAT Calculation Type';
                ToolTip = 'ALN - Specifies the VAT calculation type for the sales order.';
            }
            field("VAT Clause Code"; Rec."VAT Clause Code")
            {
                ApplicationArea = All;
                Caption = 'VAT Clause Code';
                ToolTip = 'ALN - Specifies the VAT clause code for the sales order.';
            }
            field("VAT Base Amount"; Rec."VAT Base Amount")
            {
                ApplicationArea = All;
                Caption = 'VAT Base Amount';
                ToolTip = 'ALN - Specifies the VAT base amount for the sales order.';
            }
        }
        // Add changes to page layout here
        addlast(Control1)
        {

            field("Customer Subscription No."; Rec."Customer Subscription No.")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Customer Subscription No.';
                ToolTip = 'ALN - Specifies the customer subscription number associated with the sales order.';
            }
            field("Shopify Variant Id"; Rec."Shopify Variant Id")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Shopify Variant Id';
                ToolTip = 'ALN - Specifies the Shopify variant ID associated with the sales order.';
            }
            field("Dealer Item No."; Rec."Dealer Item No.")
            {
                ApplicationArea = All;
                Editable = true;
                Caption = 'Dealer Item No.';
                ToolTip = 'ALN - Specifies the dealer item number associated with the sales order.';
            }
            field("Discount Details"; Rec."Discount Details")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Discount Details';
                ToolTip = 'ALN - Specifies the details of any discounts applied to the sales order.';
            }

            field("Amazon Item ID"; Rec."Amazon Item ID")
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Amazon Item ID';
                ToolTip = 'ALN - Specifies the Amazon item ID associated with the sales order.';
            }
            field(UPC_Code; Rec.UPC_Code)
            {
                ApplicationArea = all;
                Editable = false;
                Caption = 'Marketplace UPC Code';
                ToolTip = 'ALN - Specifies the UPC code for the marketplace item associated with the sales order.';
            }
            field("PO Line"; Rec."PO Line")
            {
                ApplicationArea = all;
                Caption = 'PO Line';
                Editable = false;
                ToolTip = 'ALN - Specifies the purchase order line associated with the sales order.';
            }
            field("Total Cubage FT"; Rec."Total Cubage FT")
            {
                ApplicationArea = all;
                Caption = 'Total Cubage FT';
                Editable = true;
                ToolTip = 'ALN - Specifies the Total Cubage Feet associated with the item of sales order line.';
            }

        }
        addafter(Description)
        {
            field("Item Type"; Rec."Item Type")
            {
                Caption = 'Item Type';
                ApplicationArea = all;
                Editable = false;
                ToolTip = 'ALN - Specifies the type of item associated with the sales order.';
            }
        }
    }

}