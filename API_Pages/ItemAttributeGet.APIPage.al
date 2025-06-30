namespace Microsoft.API.V2;
using Microsoft.Integration.Graph;
using Microsoft.Inventory.Item.Attribute;
using Microsoft.Inventory.Item;
page 50110 "API - Get Item Attributes"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Item Attributes';
    EntitySetCaption = 'Item Attributes';
    DelayedInsert = true;
    EntityName = 'alenitemAttribute';
    EntitySetName = 'alenitemAttribute';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Item Attribute Value Buffer";
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
                field("itemno"; Rec."Inherited-From Key Value")
                {
                    Caption = 'Item No.';
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
        Item: Record Item;
    begin
        RelatedIdFilter := Rec.GetFilter("Inherited-From Key Value");
        //LoadAttributes(RelatedIdFilter);
        if Item.FindSet() then
            repeat
                RelatedIdFilter := Item."No.";

                if RecordsLoaded then
                    exit(true);

                //FilterView := Rec.GetView();
                LoadAttributes(RelatedIdFilter);
            //LoadAttributes('100000');

            //Rec.SetView(FilterView);

            until Item.Next() = 0;
        Rec.Reset();
        Rec.SetCurrentKey("Inherited-From Key Value", "Attribute ID");
        if not Rec.FindSet then
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
        if ItemNo <> '' then
            ItemAttributeValueMapping.SetRange("No.", ItemNo);
        if ItemAttributeValueMapping.FindSet() then
            repeat

                ItemAttributeValue.Get(ItemAttributeValueMapping."Item Attribute ID", ItemAttributeValueMapping."Item Attribute Value ID");
                //if Not TempItemAttributeValue.Get(ItemAttributeValue."Attribute ID", ItemAttributeValue.ID) then begin

                TempItemAttributeValue.TransferFields(ItemAttributeValue);
                //OnLoadAttributesOnBeforeTempItemAttributeValueInsert(TempItemAttributeValue, ItemAttributeValueMapping, RelatedRecordCode);
                TempItemAttributeValue.Insert();
            //end;
            until ItemAttributeValueMapping.Next() = 0;
        TempItemAttributeValue.Reset();
        if TempItemAttributeValue.FindSet() then
            repeat
                InsertRecordN(TempItemAttributeValue, Database::Item, ItemNo);
            until TempItemAttributeValue.Next() = 0;
        //Rec.PopulateItemAttributeValueSelection(TempItemAttributeValue, Database::Item, ItemNo);

    end;

    trigger OnOpenPage()
    var

    begin

    end;

    procedure InsertRecordN(var TempItemAttributeValue: Record "Item Attribute Value" temporary; DefinedOnTableID: Integer; DefinedOnKeyValue: Code[20])
    var
        ItemAttribute: Record "Item Attribute";
    begin
        ItemAttribute.Get(TempItemAttributeValue."Attribute ID");
        if Rec.Get(ItemAttribute.Name, DefinedOnKeyValue) then
            exit;
        Rec."Attribute ID" := TempItemAttributeValue."Attribute ID";
        ItemAttribute.Get(TempItemAttributeValue."Attribute ID");
        Rec."Attribute Name" := ItemAttribute.Name;
        Rec."Attribute Type" := ItemAttribute.Type;
        Rec.Value := TempItemAttributeValue.GetValueInCurrentLanguageWithoutUnitOfMeasure();
        Rec.Blocked := TempItemAttributeValue.Blocked;
        Rec."Unit of Measure" := ItemAttribute."Unit of Measure";
        Rec."Inherited-From Table ID" := DefinedOnTableID;
        Rec."Inherited-From Key Value" := DefinedOnKeyValue;
        Rec.Insert();
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
        if TempFieldSet.Get(DATABASE::"Item Attribute Value Buffer", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := DATABASE::"Item Attribute Value Buffer";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;
}



