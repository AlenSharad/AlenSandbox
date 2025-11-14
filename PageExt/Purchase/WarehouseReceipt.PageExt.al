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
            field("Error Description"; Rec."Error Description")
            {
                Caption = 'Error Description';
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the posting error description associated with this warehouse receipt.';
            }
        }
    }
}