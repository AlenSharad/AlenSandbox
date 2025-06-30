pageextension 50112 "Posted Purch. Rcpt. Page Ext" extends "Posted Purchase Receipt"
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