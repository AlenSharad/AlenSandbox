
page 50107 "API - Item Vendor"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Item Vendor';
    EntitySetCaption = 'Item Vendor';
    DelayedInsert = true;
    EntityName = 'itemVendor';
    EntitySetName = 'itemVendor';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Item Vendor";
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
                field("code"; Rec."Vendor No.")
                {
                    Caption = 'Vendor Number';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Vendor No."));
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
                field(leadTime; Rec."Lead Time Calculation")
                {
                    Caption = 'Lead Time Calculation';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Lead Time Calculation"));
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
        ItemVendorRecordRef: RecordRef;
    begin
        Rec.Insert(true);

        ItemVendorRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(ItemVendorRecordRef, TempFieldSet, CurrentDateTime());
        ItemVendorRecordRef.SetTable(Rec);

        exit(false);
    end;

    var
        TempFieldSet: Record 2000000041 temporary;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(DATABASE::"Item Vendor", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := DATABASE::"Item Vendor";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;
}



