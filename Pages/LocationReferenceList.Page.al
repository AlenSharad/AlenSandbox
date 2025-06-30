page 50115 "Location Reference List"
{
    PageType = List;
    SourceTable = "Location Reference";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Location Reference';
    DataCaptionFields = "Location Code";
    DelayedInsert = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Reference Type"; Rec."Reference Type")
                {
                    ApplicationArea = All;
                }
                field("Reference Type No."; Rec."Reference Type No.")
                {
                    ApplicationArea = All;
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}