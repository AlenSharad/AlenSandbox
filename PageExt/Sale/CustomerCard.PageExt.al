pageextension 50101 CustomerCardExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addbefore("Name 2")
        {
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = All;
                Caption = 'Last Name';
                ToolTip = 'ALN - Specifies the last name of the customer.';
            }
            field("ALN Legacy Customer ID"; Rec."ALN Legacy Customer ID")
            {
                ApplicationArea = All;
                Caption = 'ALN Legacy Customer ID';
                ToolTip = 'ALN - Specifies the legacy customer ID.';
            }
        }
        addlast(General)
        {

            field(Status; Rec.Status)
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Status field.';
            }
            field("Third Party Billing Address"; Rec."Third Party Billing Address")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the 3rd Party Billing Address field.';
            }
            field("Third Party Billing Account"; Rec."Third Party Billing Account")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the 3rd Party Billing ACcount field.';
            }
            field("Third Party Zip Code"; Rec."Third Party Zip Code")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the 3rd Party Zip Code field.';
            }
            field("Third Party Carrier"; Rec."Third Party Carrier")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the 3rd Party Carrier field.';
            }
            field("PBCS Category"; Rec."PBCS Category")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the PBCS Category field.';
            }
            field("Customer Sets Location"; Rec."Customer Sets Location")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Customer Sets Location field.';
            }
            field(subscription_customer; Rec.subscription_customer)
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Subscription Customer field.';
            }
            field(warranty_customer; Rec.warranty_customer)
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Warranty Customer field.';
            }
            // field(b2b_customer; Rec.b2b_customer)
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'ALN - Specifies the value of the B2B Customer field.';
            // }
            field(ShopifyCustomerNo; Rec."Shopify Customer No.")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Shopify Customer No. field.';
            }
            field(ZendeskCustomerNo; Rec."Zendesk Customer No.")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Zendesk Customer No. field.';
            }
            field("Customer Since Date"; Rec."Customer Since Date")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Customer Since Date field.';
            }
            field("Accepts Marketing"; Rec."Accepts Marketing")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Accepts Marketing field.';
            }
        }
        addafter("Tax Exemption No.")
        {

            field("Tax Exemption Expiry Date"; Rec."Tax Exemption Expiry Date")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Tax Exemption Expiry Date field.';
            }
            field("Tax Exempt Certificate"; Rec."Tax Exempt Certificate")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Tax Exempt Certificate field.';
            }
        }
        // modify("Tax Exemption No.")
        // {
        //     ApplicationArea = All;

        // }
    }

}