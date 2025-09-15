pageextension 50144 "Posted Sales Shipment List Ext" extends "Posted Sales Shipments"
{
    layout
    {
        addbefore("Posting Date")
        {
            field("Order No."; Rec."Order No.")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                Importance = Promoted;
                ToolTip = 'Specifies the number of the sales order that this invoice was posted from.';
            }
        }
    }
}