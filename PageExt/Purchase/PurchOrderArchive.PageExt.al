pageextension 50111 "Purch Order Archive Page Ext" extends "Purchase Order Archive"
{
    layout
    {

        addlast(General)
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