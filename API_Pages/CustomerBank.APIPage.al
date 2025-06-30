namespace Microsoft.Sales.Customer;

using Microsoft.Foundation.Address;
using Microsoft.Integration.Graph;

page 50104 "API - CustomerBank"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Customer Bank';
    EntitySetCaption = 'Customer Banks';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'alencustomerBank';
    EntitySetName = 'alencustomerBank';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Customer Bank Account";
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
                field(cardname; Rec.Code)
                {
                    Caption = 'Card Name';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Code));
                    end;
                }
                field(cardno; Rec."Bank Account No.")
                {
                    Caption = 'Card No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bank Account No."));
                    end;
                }
                field(cardholder; Rec.Name)
                {
                    Caption = 'Card Holder Name';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if Rec.Name = '' then
                            Error(BlankContactNameErr);
                        RegisterFieldSet(Rec.FieldNo(Name));
                    end;
                }

                field(cardtype; Rec."Card Type")
                {
                    Caption = 'Credit Card Type';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Card Type"));
                    end;
                }
                field(cardstate; Rec."Card State")
                {
                    Caption = 'Card State';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Card State"));
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
        CustBank: Record "Customer Bank Account";
        CustBankRecordRef: RecordRef;
    begin
        if Rec.Name = '' then
            Error(NotProvidedContactNameErr);

        CustBank.SetRange(Code, Rec.Code);
        if not CustBank.IsEmpty() then
            Rec.Insert();

        Rec.Insert(true);

        CustBankRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(CustBankRecordRef, TempFieldSet, CurrentDateTime());
        CustBankRecordRef.SetTable(Rec);

        Rec.Modify(true);
        //SetCalculatedFields();
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        CustBank: Record "Customer Bank Account";
    begin
        CustBank.GetBySystemId(Rec.SystemId);

        if Rec.Code = CustBank.Code then
            Rec.Modify(true)
        else begin
            CustBank.TransferFields(Rec, false);
            CustBank.Rename(Rec.Code);
            Rec.TransferFields(CustBank);
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
        NotProvidedContactNameErr: Label 'A "cardholderName" must be provided.', Comment = 'cardholderName is a field name and should not be translated.';
        BlankContactNameErr: Label 'The blank "cardholderName" is not allowed.', Comment = 'cardholderName is a field name and should not be translated.';
        BECountryCodeLbl: Label 'BE', Locked = true;


    local procedure ClearCalculatedFields()
    begin
        Clear(Rec.SystemId);
        Clear(TaxRegistrationNumber);
        TempFieldSet.DeleteAll();
    end;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::"Customer Bank Account", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::"Customer Bank Account";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;


}

