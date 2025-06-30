pageextension 50121 "Purchase Orders Page Ext" extends "Purchase Order List"
{
    layout
    {

        addlast(Control1)
        {
            field("Manager Notes"; Rec."Manager Notes")
            {
                ApplicationArea = All;
                Caption = 'Manager Notes';
            }

            field("Actual Location Address"; Rec."Actual Location Address")
            {
                ApplicationArea = All;
                Caption = 'Actual Location Address';
            }
        }
    }
}