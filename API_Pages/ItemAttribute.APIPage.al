namespace Microsoft.API.V2;
using Microsoft.Integration.Graph;
using Microsoft.Inventory.Item.Attribute;
using Microsoft.Inventory.Item;
page 50106 "API - Item Attributes"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Item Attributes';
    EntitySetCaption = 'Item Attributes';
    DelayedInsert = true;
    EntityName = 'itemAttribute';
    EntitySetName = 'itemAttribute';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Item Attribute Value Selection";
    SourceTableTemporary = true;
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
                field("code"; Rec."Attribute ID")
                {
                    Caption = 'Code';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Attribute ID"));
                    end;
                }
                field(displayName; Rec."Attribute Name")
                {
                    Caption = 'Display Name';

                    trigger OnValidate()
                    var
                        ItemAttributeValue: Record "Item Attribute Value";
                        ItemAttribute: Record "Item Attribute";
                    begin
                        if xRec."Attribute Name" <> '' then begin
                            xRec.FindItemAttributeByName(ItemAttribute);
                            DeleteItemAttributeValueMapping(ItemAttribute.ID);
                        end;

                        if (Rec.Value <> '') and not Rec.FindAttributeValue(ItemAttributeValue) then
                            Rec.InsertItemAttributeValue(ItemAttributeValue, Rec);

                        InsertItemAttributeValueMapping(ItemAttributeValue);
                        RegisterFieldSet(Rec.FieldNo("Attribute Name"));
                    end;

                }
                field(Value; Rec.Value)
                {
                    Caption = 'Value';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Value));
                    end;
                }
                field(unitofMeasure; Rec."Unit of Measure")
                {
                    Caption = 'Unit of Measure';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Unit of Measure"));
                    end;
                }

                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                }
            }
        }
    }

    actions
    {
    }
    trigger OnFindRecord(Which: Text): Boolean
    var
        RelatedIdFilter: Text;
        RelatedTypeFilter: Text;
        FilterView: Text;
    begin
        RelatedIdFilter := Rec.GetFilter("Inherited-From Key Value");
        //LoadAttributes(RelatedIdFilter);
        if RecordsLoaded then
            exit(true);

        FilterView := Rec.GetView();
        LoadAttributes(RelatedIdFilter);
        Rec.SetView(FilterView);
        if not Rec.FindFirst() then
            exit(false);
        RecordsLoaded := true;
        exit(true);

    end;


    local procedure DeleteItemAttributeValueMapping(AttributeToDeleteID: Integer)
    var
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
        ItemAttribute: Record "Item Attribute";
        RelatedRecordCode: Code[20];
    begin
        RelatedRecordCode := Rec.GetFilter("Inherited-From Key Value");
        ItemAttributeValueMapping.SetRange("Table ID", Database::Item);
        ItemAttributeValueMapping.SetRange("No.", RelatedRecordCode);
        ItemAttributeValueMapping.SetRange("Item Attribute ID", AttributeToDeleteID);
        if ItemAttributeValueMapping.FindFirst() then begin
            ItemAttributeValueMapping.Delete();

        end;

        ItemAttribute.Get(AttributeToDeleteID);
        ItemAttribute.RemoveUnusedArbitraryValues();
    end;

    local procedure InsertItemAttributeValueMapping(ItemAttributeValue: Record "Item Attribute Value")
    var
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
        RelatedRecordCode: Code[20];
    begin
        RelatedRecordCode := Rec.GetFilter("Inherited-From Key Value");
        if not ItemAttributeValue.Get(ItemAttributeValue."Attribute ID", ItemAttributeValue.ID) or
           ItemAttributeValueMapping.Get(Database::Item, RelatedRecordCode, ItemAttributeValue."Attribute ID") then
            exit;

        ItemAttributeValueMapping.Reset();
        ItemAttributeValueMapping.Init();
        ItemAttributeValueMapping."Table ID" := Database::Item;
        ItemAttributeValueMapping."No." := RelatedRecordCode;
        ItemAttributeValueMapping."Item Attribute ID" := ItemAttributeValue."Attribute ID";
        ItemAttributeValueMapping."Item Attribute Value ID" := ItemAttributeValue.ID;

        ItemAttributeValueMapping.Insert();
    end;

    procedure LoadAttributes(ItemNo: Code[20])
    var
        ItemAttributeValueMapping: Record "Item Attribute Value Mapping";
        TempItemAttributeValue: Record "Item Attribute Value" temporary;
        ItemAttributeValue: Record "Item Attribute Value";
    begin

        ItemAttributeValueMapping.SetRange("Table ID", Database::Item);
        ItemAttributeValueMapping.SetRange("No.", ItemNo);
        if ItemAttributeValueMapping.FindSet() then
            repeat

                ItemAttributeValue.Get(ItemAttributeValueMapping."Item Attribute ID", ItemAttributeValueMapping."Item Attribute Value ID");
                TempItemAttributeValue.TransferFields(ItemAttributeValue);
                //OnLoadAttributesOnBeforeTempItemAttributeValueInsert(TempItemAttributeValue, ItemAttributeValueMapping, RelatedRecordCode);
                TempItemAttributeValue.Insert();
            until ItemAttributeValueMapping.Next() = 0;

        Rec.PopulateItemAttributeValueSelection(TempItemAttributeValue, Database::Item, ItemNo);
    end;

    trigger OnOpenPage()
    var

    begin

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        AttributeRecordRef: RecordRef;
    begin
        Rec.Insert(true);

        AttributeRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(AttributeRecordRef, TempFieldSet, CurrentDateTime());
        AttributeRecordRef.SetTable(Rec);

        exit(false);
    end;

    var
        TempFieldSet: Record 2000000041 temporary;
        RecordsLoaded: Boolean;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(DATABASE::"Item Attribute Value Selection", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := DATABASE::"Item Attribute Value Selection";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;
}



