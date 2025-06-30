// Page Extension: Post Code List
pageextension 50131 "Post Code PageExt" extends "Post Codes"
{
    layout
    {
        addlast(Control1)
        {
            field("Default Location"; Rec."Default Location")
            {
                ApplicationArea = All;
            }
            field("Location 1"; Rec."Location 1")
            {
                ApplicationArea = All;
            }
            field("Location 2"; Rec."Location 2")
            {
                ApplicationArea = All;
            }
            field("Location 3"; Rec."Location 3")
            {
                ApplicationArea = All;
            }
            field("Location 4"; Rec."Location 4")
            {
                ApplicationArea = All;
            }
            field("Location 5"; Rec."Location 5")
            {
                ApplicationArea = All;
            }

        }
    }
}