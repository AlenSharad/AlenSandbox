pageextension 50119 "Sales Order List Page Ext" extends "Sales Order List"
{

    layout
    {
        modify("Your Reference")
        {
            Visible = true;
        }
        modify("Shipping Agent Code")
        {
            Visible = true;
        }
        modify("Shipping Agent Service Code")
        {
            Visible = true;
        }
        addlast(Control1)
        {
            field(WorkDescription; WorkDescription)
            {
                ApplicationArea = All;
                Caption = 'Work Description';
                Editable = false;
                ToolTip = 'Provides a description of the work associated with the sales order.';
            }
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
            field("Shipment Exist"; Rec."Shipment Exist")
            {
                ApplicationArea = All;
                Caption = 'Shipment Exist';
                Editable = false;
                ToolTip = 'ALN - Indicates whether a shipment exists for the sales order.';
            }
            field("Created By"; GetUserNameFromSecurityId(Rec.SystemCreatedBy))
            {
                ApplicationArea = All;
                Caption = 'Created By';
                Importance = Standard;
                ToolTip = 'ALN - Shows the user who created this record.';
            }

            field("Modified By"; GetUserNameFromSecurityId(Rec.SystemModifiedBy))
            {
                ApplicationArea = All;
                Caption = 'Modified By';
                Importance = Standard;
                ToolTip = 'ALN - Shows the user who last modified this record.';
            }
            field("Modified At"; Rec.SystemModifiedAt)
            {
                ApplicationArea = All;
                Caption = 'Modified At';
                Importance = Standard;
                ToolTip = 'ALN - Shows the date and time when this record was last modified.';
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription();

    end;

    procedure GetUserNameFromSecurityId(UserSecurityID: Guid): Code[50]
    var
        User: Record User;
    begin
        if User.Get(UserSecurityID) then
            exit(User."User Name")
        else
            exit('');

    end;

    var
        WorkDescription: Text;
        pp: Page 5768;
}