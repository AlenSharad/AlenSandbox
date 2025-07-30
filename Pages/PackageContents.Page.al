page 50113 "Package Contents"
{
    PageType = List;
    SourceTable = "Package Content";
    ApplicationArea = All;
    Caption = 'Package Contents';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Shipment No."; Rec."Shipment No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Item No."; Rec."Item No.") { ApplicationArea = All; }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Quantity; Rec.Quantity) { ApplicationArea = All; }
                field(TrackingNumber; Rec.TrackingNumber) { ApplicationArea = All; }
                field(UCC; Rec.UCC) { ApplicationArea = All; }
                field("Package Type"; Rec."Package Type") { ApplicationArea = All; }
                field("Shipped Date"; Rec."Shipped Date") { ApplicationArea = All; }
                field("Dealer Item Number"; Rec."Dealer Item Number") { ApplicationArea = All; }
                field("Master Tracking No."; Rec."Master Tracking No.") { ApplicationArea = All; }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Created At"; Rec."Created At")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}