pageextension 50140 "Ship Agent Service PageExt" extends "Shipping Agent Services"
{
    layout
    {
        addlast(Control1)
        {
            field("Skip Auto Release"; Rec."Skip Auto Release")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies whether to skip automatic release for this shipping agent service.';
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