pageextension 50147 "Posted Sales Inv Update Ext" extends "Posted Sales Inv. - Update"
{
    layout
    {
        // Add changes to page layout here
        addafter("Package Tracking No.")
        {
            field("Invoice Sent"; Rec."Invoice Sent")
            {
                ApplicationArea = All;
                Caption = 'EDI Invoice Sent';
                Editable = true;
                ToolTip = 'ALN - Indicates whether the EDI sales invoice has been sent to the customer.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}