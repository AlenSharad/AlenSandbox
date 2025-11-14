pageextension 50146 "Transfer Order List Extension" extends "Transfer Orders"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Container No."; Rec."Container No.")
            {
                Caption = 'Container No.';
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the container number associated with this transfer order.';

            }
            field("Shipment ID"; Rec."Shipment ID")
            {
                Caption = 'Shipment ID';
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the shipment ID associated with this transfer order.';
            }
            field("Sent to 3PL Date"; Rec."Sent to 3PL Date")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL Date';
                ToolTip = 'ALN - The date when the transfer order was sent to the third-party logistics provider (3PL).';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
                ToolTip = 'ALN - Indicates whether the transfer order has been sent to the third-party logistics provider (3PL).';
            }
        }

    }
}