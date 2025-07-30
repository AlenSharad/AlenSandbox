
page 50126 "API - Package Content"
{
    DelayedInsert = true;
    APIVersion = 'v2.0';
    EntityCaption = 'Package Content';
    EntitySetCaption = 'Package Contents';
    PageType = API;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    ODataKeyFields = SystemId;
    EntityName = 'packageContent';
    EntitySetName = 'packageContents';
    SourceTable = "Package Content";
    APIPublisher = 'HappiestMinds';
    APIGroup = 'AlenAPIS';
    Extensible = true;
    Editable = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(sourceOrder; Rec."Shipment No.")
                {
                    Caption = 'Shipment No.';
                }

                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(sequence; Rec."Line No.")
                {
                    Caption = 'Sequence';
                }

                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(trackingNo; Rec.TrackingNumber)
                {
                    Caption = 'Tracking Number';
                }
                field(ucc; Rec.UCC)
                {
                    Caption = 'UCC';
                }
                field(packageType; Rec."Package Type")
                {
                    Caption = 'Package Type';
                }

                field(shippedDate; Rec."Shipped Date")
                {
                    Caption = 'Shipped Date';
                }
                field(dealerItemNumber; Rec."Dealer Item Number")
                {
                    Caption = 'Dealer Item Number';
                }
                field(masterTrackingNo; Rec."Master Tracking No.")
                {
                    Caption = 'Master Tracking No.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

    end;

    var
        SetupNotCompletedErr: Label 'Data required by the API was not set up. To set up the data, invoke the action from the API Setup page.';
}