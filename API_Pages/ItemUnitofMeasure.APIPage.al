page 50130 "API - Item Unit of Measure"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Item Unit of Measure';
    EntitySetCaption = 'Item Unit of Measures';
    DelayedInsert = true;
    EntityName = 'itemUnitOfMeasure';
    EntitySetName = 'itemUnitOfMeasures';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Item Unit of Measure";
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
                field(ItemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Item No."));
                    end;
                }
                field(Code; Rec.Code)
                {
                    Caption = 'Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Code));
                    end;
                }

                field(QtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
                {
                    Caption = 'Qty. per Unit of Measure';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Qty. per Unit of Measure"));
                    end;
                }
                field(Length; Rec.Length)
                {
                    Caption = 'Length';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Length));
                    end;
                }
                field(Width; Rec.Width)
                {
                    Caption = 'Width';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Width));
                    end;
                }
                field(Height; Rec.Height)
                {
                    Caption = 'Height';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Height));
                    end;
                }
                field(Weight; Rec.Weight)
                {
                    Caption = 'Weight';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Weight));
                    end;
                }
                field(Volume; Rec.Cubage)
                {
                    Caption = 'Cubage';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Cubage));
                    end;
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
        ItemUOMRecordRef: RecordRef;
    begin
        Rec.Insert(true);

        ItemUOMRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(ItemUOMRecordRef, TempFieldSet, CurrentDateTime());
        ItemUOMRecordRef.SetTable(Rec);

        exit(false);
    end;

    var
        TempFieldSet: Record 2000000041 temporary;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(DATABASE::"Item Unit of Measure", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := DATABASE::"Item Reference";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;
}