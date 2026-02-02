
// Page Extension for Location List
pageextension 50133 "Location List Extension" extends "Location List"
{
    layout
    {
        addlast(Control1)
        {
            field("Include in Location Assignment"; Rec."Include in Location Assignment")
            {
                Caption = 'Include in Inventory';
                ApplicationArea = all;
                ToolTip = 'ALN - Specifies whether this location should be included in inventory assignments.';
            }
        }
    }
    actions
    {
        addlast(Navigation)
        {
            action(OpenLocationReferenceList)
            {
                Caption = 'Location References';
                ApplicationArea = All;
                ToolTip = 'ALN - Open the list of location references for this location.';
                Image = Change;
                RunObject = page "Location Reference List";
                RunPageLink = "Location Code" = field(Code);
            }
        }
    }
}