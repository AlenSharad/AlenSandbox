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

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}