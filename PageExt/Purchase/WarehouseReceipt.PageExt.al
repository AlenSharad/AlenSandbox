pageextension 50137 "Warehouse Receipt Extension" extends "Warehouse Receipt"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("Source No."; Rec."Source No.")
            {
                Caption = 'Source No.';
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the source number associated with this warehouse receipt.';
            }
        }
    }
}