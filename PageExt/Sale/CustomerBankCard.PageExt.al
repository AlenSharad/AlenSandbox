pageextension 50103 CustomerBankCardExtension extends "Customer Bank Account Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {

            field("Card Type"; Rec."Card Type")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Card Type field.', Comment = '%';
            }
            field("Card State"; Rec."Card State")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Card State field.', Comment = '%';
            }
        }
    }
}