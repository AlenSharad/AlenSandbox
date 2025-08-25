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
                ToolTip = 'ALN - Notes added by the manager regarding this purchase receipt.';
            }

            field("Actual Location Address"; Rec."Actual Location Address")
            {
                ApplicationArea = All;
                Caption = 'Actual Location Address';
                ToolTip = 'ALN - The address of the actual location where the goods were received.';
            }
        }
    }
}