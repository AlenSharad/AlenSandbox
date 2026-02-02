// Page Extension for Location Card
pageextension 50132 "Location Card Extension" extends "Location Card"
{
    layout
    {
        addlast(General)
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
                Image = Change;
                ToolTip = 'ALN - Open the list of location references for this location.';
                RunObject = page "Location Reference List";
                RunPageLink = "Location Code" = field(Code);
            }
        }
    }
}
