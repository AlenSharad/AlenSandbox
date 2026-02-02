pageextension 50130 "Sales Return Order Subform Ext" extends "Sales Return Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Line Amount")
        {
            field("Line Tax Amount"; Rec."Line Tax Amount")
            {
                Caption = 'Line Tax Amount';
                ApplicationArea = all;
                ToolTip = 'ALN - Specifies the tax amount for the line item in the sales return.';

            }
        }
        addafter(Description)
        {
            field("Item Type"; Rec."Item Type")
            {
                Caption = 'Item Type';
                ApplicationArea = all;
                ToolTip = 'ALN - Specifies the item type for the line item in the sales return.';
            }
        }
    }
}