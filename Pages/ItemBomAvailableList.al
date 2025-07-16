page 50121 "Item Bom Available List"
{
    PageType = List;
    SourceTable = "Item Bom Available";
    ApplicationArea = All;
    Caption = 'Item BOM Available List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field(Available; Rec.Available)
                {
                    ApplicationArea = All;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                }
                field("Order Line No."; Rec."Order Line No.")
                {
                    ApplicationArea = All;
                }
                field("Required Quantity"; Rec."Required Quantity")
                {
                    ApplicationArea = All;
                }
                field("Availability Count"; Rec."Availability Count")
                {
                    ApplicationArea = all;
                }
                field("Actual Count"; Rec."Actual Count")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}