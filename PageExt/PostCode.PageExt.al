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
                Caption = 'Default Location';
                ToolTip = 'ALN - Specifies the default location for this post code.';
            }
            field("Location 1"; Rec."Location 1")
            {
                ApplicationArea = All;
                Caption = 'Location 1';
                ToolTip = 'ALN - Specifies the first location associated with this post code.';
            }
            field("Location 2"; Rec."Location 2")
            {
                ApplicationArea = All;
                Caption = 'Location 2';
                ToolTip = 'ALN - Specifies the second location associated with this post code.';
            }
            field("Location 3"; Rec."Location 3")
            {
                ApplicationArea = All;
                Caption = 'Location 3';
                ToolTip = 'ALN - Specifies the third location associated with this post code.';
            }
            field("Location 4"; Rec."Location 4")
            {
                ApplicationArea = All;
                Caption = 'Location 4';
                ToolTip = 'ALN - Specifies the fourth location associated with this post code.';
            }
            field("Location 5"; Rec."Location 5")
            {
                ApplicationArea = All;
                Caption = 'Location 5';
                ToolTip = 'ALN - Specifies the fifth location associated with this post code.';
            }

        }
    }
}