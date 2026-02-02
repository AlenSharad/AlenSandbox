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
                ToolTip = 'ALN - Notes added by the manager regarding this purchase order archive.';
            }

            field("Actual Location Address"; Rec."Actual Location Address")
            {
                ApplicationArea = All;
                Caption = 'Actual Location Address';
                ToolTip = 'ALN - The address of the actual location where the goods were ordered in the purchase order archive.';
            }
        }
    }
}