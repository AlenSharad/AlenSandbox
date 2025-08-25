pageextension 50119 "Sales Order List Page Ext" extends "Sales Order List"
{

    layout
    {
        modify("Your Reference")
        {
            Visible = true;
        }
        addlast(Control1)
        {
            field("Order Type Code"; Rec."Order Type Code")
            {
                ApplicationArea = All;
                Caption = 'Order Type Code';
                TableRelation = "Order Type".Code;
                Editable = false;
                ToolTip = 'ALN - Specifies the type of order for this sales order.';
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
                ToolTip = 'ALN - Specifies the date when the order was sent to the 3PL provider.';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
                Editable = false;
                ToolTip = 'ALN - Indicates whether the order has been sent to the 3PL provider.';

            }
            field("All Items Fully Commited"; Rec."All Items Fully Commited")
            {
                ApplicationArea = All;
                Caption = 'All Items Fully Commited';
                Editable = false;
                ToolTip = 'ALN - Indicates if all items in the order are fully committed.';
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Editable = false;
                ToolTip = 'ALN - Specifies the Date Time of creation of the order.';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Caption = 'Order Source';
                TableRelation = "Order Source".Code;
                Editable = false;
                ToolTip = 'ALN - Specifies the source of the order.';
            }
            field("Store Front Payment Status"; Rec."Store Front Payment Status")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Status';
                Editable = false;
                ToolTip = 'ALN - Shows the payment status from the storefront.';
            }
            field("Store Front Payment Gateway"; Rec."Store Front Payment Gateway")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Gateway';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment gateway used by the storefront.';
            }
            field("Store Front Payment Event Type"; Rec."Store Front Payment Event Type")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Event Type';
                Editable = false;
                ToolTip = 'ALN - Shows the type of payment event from the storefront.';
            }
            field("Store Front Payment Authcode"; Rec."Store Front Payment Authcode")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Authcode';
                Editable = false;
                ToolTip = 'ALN - Displays the payment authorization code from the storefront.';
            }
            field("Order Total Check"; Rec."Order Total Check")
            {
                ApplicationArea = All;
                Caption = 'Order Total Check';
                Editable = false;
                ToolTip = 'ALN - Displays the calculated total for the order for validation.';
            }
            field("Order Total Variance"; Rec."Order Total Variance")
            {
                ApplicationArea = All;
                Caption = 'Order Total Variance';
                Editable = false;
                ToolTip = 'ALN - Shows the variance between expected and actual order totals.';
            }
            field("Error Description"; Rec."Error Description")
            {
                ApplicationArea = All;
                Caption = 'Error Description';
                Editable = false;
                ToolTip = 'ALN - Provides details about any errors associated with the order.';
            }
        }
    }
}