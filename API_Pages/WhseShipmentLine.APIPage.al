
page 50124 "API - Warehouse Shipment Lines"
{
    DelayedInsert = true;
    APIVersion = 'v2.0';
    EntityCaption = 'Warehouse Shipment Line';
    EntitySetCaption = 'Warehouse Shipment Lines';
    PageType = API;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    ODataKeyFields = SystemId;
    EntityName = 'itemFulfillmentLine';
    EntitySetName = 'itemFulfillmentLines';
    SourceTable = "Warehouse Shipment Line";
    APIPublisher = 'HappiestMinds';
    APIGroup = 'AlenAPIS';
    Extensible = true;

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
                }
                field(sourceNo; Rec."Sales Order No.")
                {
                    Caption = 'Source No';
                    trigger OnValidate()
                    var
                        salesHeader: Record "Sales Header";
                    begin
                        salesHeader.Reset();
                        salesHeader.Get(salesHeader."Document Type"::Order, Rec."Sales Order No.");
                        //if salesHeader.FindFirst() then begin
                        Rec."Source Document" := Rec."Source Document"::"Sales Order";
                        Rec."Source No." := Rec."Sales Order No.";
                        //end;
                    end;
                }
                field(sourceLineNo; Rec."Sales Order Line No.")
                {
                    Caption = 'Source Line No';
                    trigger OnValidate()
                    var
                        salesLine: Record "Sales Line";
                    begin
                        salesLine.Get(salesLine."Document Type"::Order, Rec."Sales Order No.", Rec."Sales Order Line No.");
                        Rec."Source Line No." := Rec."Sales Order Line No.";

                    end;
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
                field(qtytoShip; Rec."Qty. to Ship")
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
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(shopifyVariantId; Rec."Shopify Variant Id")
                {
                    Caption = 'Shopify Variant Id';
                }
                field(dealerItemNo; Rec."Dealer Item No.")
                {
                    Caption = 'Dealer Item No.';
                }
                field(discountDetails; Rec."Discount Details")
                {
                    Caption = 'Discount Details';
                }
                field(amamzonItemId; Rec."Amazon Item ID")
                {
                    Caption = 'Amazon Item ID';
                }
                field(upcCode; Rec.UPC_Code)
                {
                    Caption = 'Marketplace UPC Code';
                }
                field(poLine; Rec."PO Line")
                {
                    Caption = 'PO Line';

                }
                field(customerSubscriptionNo; Rec."Customer Subscription No.")
                {
                    Caption = 'Customer Subscription No.';
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
        Rec."Source Document" := Rec."Source Document"::"Sales Order";
        Rec."Source No." := Rec."Sales Order No.";
        Rec."Source Line No." := Rec."Sales Order Line No.";
    end;

    var
        SetupNotCompletedErr: Label 'Data required by the API was not set up. To set up the data, invoke the action from the API Setup page.';
}