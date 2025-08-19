pageextension 50138 "Posted Whse. Receipt Extension" extends "Posted Whse. Receipt"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Source No."; Rec."Source No.")
            {
                Caption = 'Source No.';
            }
        }
    }
}