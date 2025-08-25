pageextension 50129 "Whse Shipment Subform Ext" extends "Whse. Shipment Subform"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {

            field("Customer Subscription No."; Rec."Customer Subscription No.")
            {
                ApplicationArea = All;
                Caption = 'Customer Subscription No.';
                ToolTip = 'ALN - Specifies the customer subscription number associated with the warehouse shipment.';
            }
            field("Shopify Variant Id"; Rec."Shopify Variant Id")
            {
                ApplicationArea = All;
                Caption = 'Shopify Variant Id';
                ToolTip = 'ALN - Specifies the Shopify variant ID associated with the warehouse shipment.';
            }
            field("Dealer Item No."; Rec."Dealer Item No.")
            {
                ApplicationArea = All;
                Caption = 'Dealer Item No.';
                ToolTip = 'ALN - Specifies the dealer item number associated with the warehouse shipment.';
            }
            field("Discount Details"; Rec."Discount Details")
            {
                ApplicationArea = All;
                Caption = 'Discount Details';
                ToolTip = 'ALN - Specifies the details of any discounts applied to the warehouse shipment.';
            }

            field("Amazon Item ID"; Rec."Amazon Item ID")
            {
                ApplicationArea = all;
                Caption = 'Amazon Item ID';
                ToolTip = 'ALN - Specifies the Amazon item ID associated with the warehouse shipment.';
            }
            field(UPC_Code; Rec.UPC_Code)
            {
                ApplicationArea = all;
                Caption = 'Marketplace UPC Code';
                ToolTip = 'ALN - Specifies the UPC code for the marketplace item associated with the warehouse shipment.';
            }
            field("PO Line"; Rec."PO Line")
            {
                ApplicationArea = all;
                Caption = 'PO Line';
                ToolTip = 'ALN - Specifies the purchase order line associated with the warehouse shipment.';
            }
        }
        addafter(Description)
        {
            field("Item Type"; Rec."Item Type")
            {
                Caption = 'Item Type';
                ApplicationArea = all;
                ToolTip = 'ALN - Specifies the type of item associated with the warehouse shipment.';
            }
        }
    }
}