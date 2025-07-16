page 50122 "Integration Setups"
{
    PageType = List;
    SourceTable = "Integration Setup";
    ApplicationArea = All;
    Caption = 'Integration Setups';
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code) { ApplicationArea = All; }
                field("Description"; Rec."Description") { ApplicationArea = All; }
                field("API URL"; Rec."API URL") { ApplicationArea = All; }
                field("API Key"; Rec."API Key") { ApplicationArea = All; }
                field("Username"; Rec."Username") { ApplicationArea = All; }
                field("Password"; Rec."Password") { ApplicationArea = All; }
                field("Active"; Rec."Active") { ApplicationArea = All; }
                field("Last Sync DateTime"; Rec."Last Sync DateTime") { ApplicationArea = All; }
            }
        }
    }
}
