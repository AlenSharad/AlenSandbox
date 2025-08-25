
page 50137 "API - Warehouse Receipt Lines"
{
    DelayedInsert = true;
    APIVersion = 'v2.0';
    EntityCaption = 'Warehouse Receipt Line';
    EntitySetCaption = 'Warehouse Receipt Lines';
    PageType = API;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    ODataKeyFields = SystemId;
    EntityName = 'warehouseReceiptLine';
    EntitySetName = 'warehouseReceiptLines';
    SourceTable = "Warehouse Receipt Line";
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
                field(sourceDocument; Rec."Source Document")
                {
                    Caption = 'Source Document';
                    Editable = false;
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No';

                }
                field(sourceLineNo; Rec."Source Line No.")
                {
                    Caption = 'Source Line No';

                }
                field(sequence; Rec."Line No.")
                {
                    Caption = 'Sequence';
                }

                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit Of Measure Code';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }

                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(qtytoShip; Rec."Qty. to Receive")
                {
                    Caption = 'Qty. to Ship';
                }
                field(cubage; Rec.Cubage)
                {
                    Caption = 'Cubage';
                }
                field(weight; Rec.Weight)
                {
                    Caption = 'Weight';
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(modifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'Modified At';
                }
                field(modifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'Modified By';
                }
                part(dimensionSetLines; "APIV2 - Dimension Set Lines")
                {
                    Caption = 'Dimension Set Lines';
                    EntityName = 'dimensionSetLine';
                    EntitySetName = 'dimensionSetLines';
                    SubPageLink = "Parent Id" = field(SystemId), "Parent Type" = const("Sales Shipment Line");
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        UpgradeTagDefinitions: Codeunit "Upgrade Tag Definitions";
    begin
        if not UpgradeTag.HasUpgradeTag(UpgradeTagDefinitions.GetNewSalesShipmentLineUpgradeTag()) then
            Error(SetupNotCompletedErr);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

    end;

    var
        SetupNotCompletedErr: Label 'Data required by the API was not set up. To set up the data, invoke the action from the API Setup page.';
}