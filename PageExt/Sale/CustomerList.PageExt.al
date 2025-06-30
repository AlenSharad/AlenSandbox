pageextension 50125 CustomerListExtension extends "Customer List"
{
    layout
    {
        addafter("Phone No.")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the e-mail address of the customer.';
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