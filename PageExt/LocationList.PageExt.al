
// Page Extension for Location List
pageextension 50133 "Location List Extension" extends "Location List"
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