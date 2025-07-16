
page 50103 "API - ShiptoAddress"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Contact';
    EntitySetCaption = 'Contacts';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'alenshiptoAddress';
    EntitySetName = 'alenshiptoAddress';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Ship-to Address";
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
                field(number; Rec.Code)
                {
                    Caption = 'No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Code));
                    end;
                }
                field(gln; Rec.GLN)
                {
                    Caption = 'GLN';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(GLN));
                    end;
                }
                field(displayName; Rec.Name)
                {
                    Caption = 'Display Name';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if Rec.Name = '' then
                            Error(BlankContactNameErr);
                        RegisterFieldSet(Rec.FieldNo(Name));
                    end;
                }

                field(addressLine1; Rec.Address)
                {
                    Caption = 'Address Line 1';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Address"));
                    end;
                }
                field(addressLine2; Rec."Address 2")
                {
                    Caption = 'Address Line 2';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Address 2"));
                    end;
                }
                field(city; Rec.City)
                {
                    Caption = 'City';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("City"));
                    end;
                }
                field(state; Rec.County)
                {
                    Caption = 'State';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("County"));
                    end;
                }
                field(country; Rec."Country/Region Code")
                {
                    Caption = 'Country/Region Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Country/Region Code"));
                    end;
                }
                field(postalCode; Rec."Post Code")
                {
                    Caption = 'Post Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Post Code"));
                    end;
                }
                field(phoneNumber; Rec."Phone No.")
                {
                    Caption = 'Phone No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Phone No."));
                    end;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Location Code"));
                    end;
                }
                field(email; Rec."E-Mail")
                {
                    Caption = 'Email';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("E-Mail"));
                    end;
                }

                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Tax Liable"));
                    end;
                }
                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Tax Area Code"));
                    end;
                }
                field(addressType; Rec.AddressType)
                {
                    Caption = 'Address Type';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(AddressType));
                    end;
                }
                field(resdential; Rec.IsResidential)
                {
                    Caption = 'Residential Address';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(IsResidential));
                    end;
                }
                field(label; Rec.Label)
                {
                    Caption = 'Label';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Label));
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

    trigger OnAfterGetRecord()
    begin
        //SetCalculatedFields();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        STA: Record "Ship-to Address";
        STARecordRef: RecordRef;
    begin
        if Rec.Name = '' then
            Error(NotProvidedContactNameErr);

        STA.SetRange(Code, Rec.Code);
        if not STA.IsEmpty() then
            Rec.Insert();

        Rec.Insert(true);

        STARecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(STARecordRef, TempFieldSet, CurrentDateTime());
        STARecordRef.SetTable(Rec);

        Rec.Modify(true);
        //SetCalculatedFields();
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        STA: Record "Ship-to Address";
    begin
        STA.GetBySystemId(Rec.SystemId);

        if Rec.Code = STA.Code then
            Rec.Modify(true)
        else begin
            STA.TransferFields(Rec, false);
            STA.Rename(Rec.Code);
            Rec.TransferFields(STA);
        end;

        //SetCalculatedFields();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ClearCalculatedFields();
    end;

    var
        TempFieldSet: Record 2000000041 temporary;
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        TaxRegistrationNumber: Text[50];
        NotProvidedContactNameErr: Label 'A "displayName" must be provided.', Comment = 'displayName is a field name and should not be translated.';
        BlankContactNameErr: Label 'The blank "displayName" is not allowed.', Comment = 'displayName is a field name and should not be translated.';
        BECountryCodeLbl: Label 'BE', Locked = true;


    local procedure ClearCalculatedFields()
    begin
        Clear(Rec.SystemId);
        Clear(TaxRegistrationNumber);
        TempFieldSet.DeleteAll();
    end;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::"Ship-to Address", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::"Ship-to Address";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;

    procedure IsEnterpriseNumber(var EnterpriseNoFieldRef: FieldRef): Boolean
    var
        ContactRecordRef: RecordRef;
    begin
        ContactRecordRef.GetTable(Rec);
        if ContactRecordRef.FieldExist(11310) then begin
            EnterpriseNoFieldRef := ContactRecordRef.Field(11310);
            exit((EnterpriseNoFieldRef.Type = FieldType::Text) and (EnterpriseNoFieldRef.Name = 'Enterprise No.'));
        end else
            exit(false);
    end;
}

