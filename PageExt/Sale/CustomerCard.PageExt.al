pageextension 50101 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {

            field(Status; Rec.Status)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Status field.', Comment = '%';
            }
            field("Third Party Billing Address"; Rec."Third Party Billing Address")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the 3rd Party Billing Address field.', Comment = '%';
            }
            field("Third Party Billing Account"; Rec."Third Party Billing Account")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the 3rd Party Billing ACcount field.', Comment = '%';
            }
            field("Third Party Zip Code"; Rec."Third Party Zip Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the 3rd Party Zip Code field.', Comment = '%';
            }
            field("Third Party Carrier"; Rec."Third Party Carrier")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the 3rd Party Carrier field.', Comment = '%';
            }
            field("PBCS Category"; Rec."PBCS Category")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the PBCS Category field.', Comment = '%';
            }
            field("Customer Sets Location"; Rec."Customer Sets Location")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Customer Sets Location field.', Comment = '%';
            }
            field(subscription_customer; Rec.subscription_customer)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Subscription Customer field.', Comment = '%';
            }
            field(warranty_customer; Rec.warranty_customer)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Warranty Customer field.', Comment = '%';
            }
            // field(b2b_customer; Rec.b2b_customer)
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the B2B Customer field.', Comment = '%';
            // }
            field(ShopifyCustomerNo; Rec."Shopify Customer No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shopify Customer No. field.', Comment = '%';
            }
            field(ZendeskCustomerNo; Rec."Zendesk Customer No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Zendesk Customer No. field.', Comment = '%';
            }
        }
    }

}