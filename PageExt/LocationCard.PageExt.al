// Page Extension for Location Card
pageextension 50132 "Location Card Extension" extends "Location Card"
{
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
