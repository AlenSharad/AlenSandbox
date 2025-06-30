namespace Microsoft.API.V2;
using Microsoft.Integration.Graph;
using Microsoft.Inventory.Item.Catalog;

page 50108 "API - Item References"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Item References';
    EntitySetCaption = 'Item References';
    DelayedInsert = true;
    EntityName = 'itemReferences';
    EntitySetName = 'itemReferences';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Item Reference";
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
                field(referenceType; Rec."Reference Type")
                {
                    Caption = 'Reference Type';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Reference Type"));
                    end;
                }
                field(refTypeNo; Rec."Reference Type No.")
                {
                    Caption = 'Reference Type No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Reference Type No."));
                    end;
                }
                field(refNo; Rec."Reference No.")
                {
                    Caption = 'Reference No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Reference No."));
                    end;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Reference Description';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Description));
                    end;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Variant Code"));
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
                field(startDate; Rec."Starting Date")
                {
                    Caption = 'Starting Date';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Starting Date"));
                    end;
                }
                field(endDate; Rec."Ending Date")
                {
                    Caption = 'Ending Date';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Ending Date"));
                    end;
                }
                field(itemID; Rec."Item ID")
                {
                    Caption = 'Item ID';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Item ID"));
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        ItemRefRecordRef: RecordRef;
    begin
        Rec.Insert(true);

        ItemRefRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(ItemRefRecordRef, TempFieldSet, CurrentDateTime());
        ItemRefRecordRef.SetTable(Rec);

        exit(false);
    end;

    var
        TempFieldSet: Record 2000000041 temporary;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(DATABASE::"Item Reference", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := DATABASE::"Item Reference";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;
}



