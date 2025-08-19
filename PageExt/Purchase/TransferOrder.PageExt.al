pageextension 50136 "Transfer Order Extension" extends "Transfer Order"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Container No."; Rec."Container No.")
            {
                Caption = 'Container No.';

            }
            field("Shipment ID"; Rec."Shipment ID")
            {
                Caption = 'Shipment ID';
            }
            field("Sent to 3PL Date"; Rec."Sent to 3PL Date")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL Date';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
            }
        }

    }
}