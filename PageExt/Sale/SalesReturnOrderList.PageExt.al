pageextension 50122 "Sale Return List Page Ext" extends "Sales Return Order List"
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
                ToolTip = 'ALN - Specifies the type of order for this sales return.';
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
                ToolTip = 'ALN - Specifies the date when the sales return was sent to the third-party logistics provider (3PL).';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
                Editable = false;
                ToolTip = 'ALN - Indicates whether the sales return has been sent to the third-party logistics provider (3PL).';
            }
            field("All Items Fully Commited"; Rec."All Items Fully Commited")
            {
                ApplicationArea = All;
                Caption = 'All Items Fully Commited';
                Editable = false;
                ToolTip = 'ALN - Indicates whether all items in the sales return have been fully committed.';
            }
            field(SystemCreatedAt; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Caption = 'Created At';
                Editable = false;
                ToolTip = 'ALN - Specifies the Date Time of creation of the sales return.';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Caption = 'Order Source';
                TableRelation = "Order Source".Code;
                Editable = false;
                ToolTip = 'ALN - Specifies the source of the order associated with the sales return.';
            }
            field("Store Front Payment Status"; Rec."Store Front Payment Status")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Status';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment status for the store front associated with the sales return.';

            }
            field("Store Front Payment Gateway"; Rec."Store Front Payment Gateway")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Gateway';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment gateway used for the store front associated with the sales return.';

            }
            field("Store Front Payment Event Type"; Rec."Store Front Payment Event Type")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Event Type';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment event type for the store front associated with the sales return.';
            }
            field("Store Front Payment Authcode"; Rec."Store Front Payment Authcode")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Authcode';
                Editable = false;
                ToolTip = 'ALN - Specifies the authorization code for the store front payment associated with the sales return.';
            }
        }
    }
}