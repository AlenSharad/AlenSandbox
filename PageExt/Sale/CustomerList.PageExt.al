pageextension 50125 CustomerListExtension extends "Customer List"
{
    layout
    {
        addbefore("Name 2")
        {
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = All;
                Caption = 'First Name';
                ToolTip = 'ALN - Specifies the First Name of the customer.';
            }
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
        addafter("Phone No.")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'ALN - Specifies the e-mail address of the customer.';
                Caption = 'E-Mail';
            }

        }
        modify("Name 2")
        {
            Visible = true;
        }
        modify("Search Name")
        {
            Visible = true;
        }
        modify("Customer Posting Group")
        {
            Visible = true;
        }
        modify("Salesperson Code")
        {
            Visible = true;
        }
    }
}