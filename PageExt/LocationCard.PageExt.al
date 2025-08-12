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
                RunObject = page "Location Reference List";
                RunPageLink = "Location Code" = field(Code);
            }
        }
    }
}
