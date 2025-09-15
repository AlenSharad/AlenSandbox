pageextension 50120 "Posted Sales Invoices Page Ext" extends "Posted Sales Invoices"
{
    layout
    {
        addlast(Control1)
        {
            field("Order Type Code"; Rec."Order Type Code")
            {
                ApplicationArea = All;
                Caption = 'Order Type Code';
                TableRelation = "Order Type".Code;
                Editable = false;
                ToolTip = 'ALN - Specifies the order type code associated with the sales invoice.';
            }

            // field("Shopify Variant Id"; Rec."Shopify Variant Id")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Shopify Variant Id';
            // }
            field("Sent to 3PL Date"; Rec."Sent to 3PL Date")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL Date';
                Editable = false;
                ToolTip = 'ALN - Specifies the date when the sales invoice was sent to the third-party logistics provider (3PL).';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
                Editable = false;
                ToolTip = 'ALN - Indicates whether the sales invoice has been sent to the third-party logistics provider (3PL).';
            }
            field("All Items Fully Commited"; Rec."All Items Fully Commited")
            {
                ApplicationArea = All;
                Caption = 'All Items Fully Commited';
                Editable = false;
                ToolTip = 'ALN - Indicates whether all items in the sales invoice have been fully committed.';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Caption = 'Order Source';
                TableRelation = "Order Source".Code;
                Editable = false;
                ToolTip = 'ALN - Specifies the source of the order associated with the sales invoice.';
            }
            field("Store Front Payment Status"; Rec."Store Front Payment Status")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Status';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment status for the store front associated with the sales invoice.';
            }
            field("Store Front Payment Gateway"; Rec."Store Front Payment Gateway")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Gateway';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment gateway used for the store front associated with the sales invoice.';

            }
            field("Store Front Payment Event Type"; Rec."Store Front Payment Event Type")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Event Type';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment event type for the store front associated with the sales invoice.';
            }
            field("Store Front Payment Authcode"; Rec."Store Front Payment Authcode")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Authcode';
                Editable = false;
                ToolTip = 'ALN - Specifies the authorization code for the store front payment associated with the sales invoice.';
            }
            field("Invoice Sent"; Rec."Invoice Sent")
            {
                ApplicationArea = All;
                Caption = 'Invoice Sent';
                Editable = false;
                ToolTip = 'ALN - Specifies the confirmation for the invoice sent to customer.';
            }
        }
        modify("Order No.")
        {
            Visible = true;
        }
    }
}