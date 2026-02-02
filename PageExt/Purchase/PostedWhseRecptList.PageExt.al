pageextension 50141 "Posted Whse Receipts Extension" extends "Posted Whse. Receipt List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Source No."; Rec."Source No.")
            {
                Caption = 'Source No.';
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the source number associated with this posted warehouse receipt.';
            }
        }
    }
}