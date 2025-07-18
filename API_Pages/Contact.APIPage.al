namespace Microsoft.API.V2;
using Microsoft.CRM.Contact;
using Microsoft.Sales.Customer;
using Microsoft.CRM.BusinessRelation;
using Microsoft.Integration.Graph;
using Microsoft.CRM.Setup;


page 50101 "API - Contacts"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Contact';
    EntitySetCaption = 'Contacts';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'alencontact';
    EntitySetName = 'alencontacts';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Contact Buffer";
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
                field(number; Rec."No.")
                {
                    Caption = 'No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("No."));
                    end;
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Type));
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
                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job Title';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Job Title"));
                    end;
                }
                field(companyNumber; Rec."Company No.")
                {
                    Caption = 'Company Number';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Company No."));
                    end;
                }
                field(companyName; Rec."Company Name")
                {
                    Caption = 'Company Name';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Company Name"));
                    end;
                }
                field(contactBusinessRelation; Rec."Contact Business Relation")
                {
                    Caption = 'Business Relation';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Contact Business Relation"));
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
                field(mobilePhoneNumber; Rec."Mobile Phone No.")
                {
                    Caption = 'Mobile Phone No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Mobile Phone No."));
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

                field(searchName; Rec."Search Name")
                {
                    Caption = 'Search Name';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Search Name"));
                    end;
                }
                field(privacyBlocked; Rec."Privacy Blocked")
                {
                    Caption = 'Privacy Blocked';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Privacy Blocked"));
                    end;
                }
                field(taxRegistrationNumber; TaxRegistrationNumber)
                {
                    Caption = 'Tax Registration No.';

                    trigger OnValidate()
                    var
                        EnterpriseNoFieldRef: FieldRef;
                    begin
                        if IsEnterpriseNumber(EnterpriseNoFieldRef) then begin
                            if (Rec."Country/Region Code" <> BECountryCodeLbl) and (Rec."Country/Region Code" <> '') then begin
                                Rec.Validate("VAT Registration No.", TaxRegistrationNumber);
                                RegisterFieldSet(Rec.FieldNo("VAT Registration No."));
                            end else begin
                                EnterpriseNoFieldRef.Validate(TaxRegistrationNumber);
                                EnterpriseNoFieldRef.Record().SetTable(Rec);
                                RegisterFieldSet(Rec.FieldNo("VAT Registration No."));
                            end;
                        end else begin
                            Rec.Validate("VAT Registration No.", TaxRegistrationNumber);
                            RegisterFieldSet(Rec.FieldNo("VAT Registration No."));
                        end;
                    end;
                }
                field(lastInteractionDate; Rec."Date of Last Interaction")
                {
                    Caption = 'Date of Last Interaction';
                    Editable = false;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                }
                part(picture; "APIV2 - Pictures")
                {
                    Caption = 'Picture';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'picture';
                    EntitySetName = 'pictures';
                    SubPageLink = Id = field(SystemId), "Parent Type" = const(Contact);
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
    end;

    trigger OnFindRecord(Which: Text): Boolean
    var
        RelatedIdFilter: Text;
        RelatedTypeFilter: Text;
        FilterView: Text;
    begin
        RelatedIdFilter := Rec.GetFilter("Customer No.");
        //RelatedTypeFilter := Rec.GetFilter("Related Type");
        if RelatedIdFilter = '' then begin
            Rec.FilterGroup(4);
            RelatedIdFilter := Rec.GetFilter("Customer No.");

            //RelatedTypeFilter := Rec.GetFilter("Related Type");
            Rec.FilterGroup(0);
            if (RelatedIdFilter = '') then
                Error(FiltersNotSpecifiedErrorLbl);
        end;
        if RecordsLoaded then
            exit(true);
        FilterView := Rec.GetView();

        Rec.LoadDataFromFilters(RelatedIdFilter, 'CUSTOMER');
        Rec.SetView(FilterView);
        if not Rec.FindFirst() then
            exit(false);
        RecordsLoaded := true;
        exit(true);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Contact: Record Contact;
        Contact2: Record Contact;
        ContactRecordRef: RecordRef;
        BusRelation: Record "Business Relation";
        ContBusRel: Record "Contact Business Relation";
        jobtitletxt: Text[30];
        MarketingSetup: Record "Marketing Setup";
        Cust: Record Customer;
    begin
        if Rec.Name = '' then
            Error(NotProvidedContactNameErr);
        MarketingSetup.Get();
        if MarketingSetup."Bus. Rel. Code for Customers" = '' then
            Error(BusRelError);

        Contact.Reset();
        Contact.SetRange("No.", Rec."No.");
        Contact.SetRange("Customer No.", Rec."Customer No.");
        if not Contact.findfirst then begin
            Contact2.Init();
            Contact2.TransferFields(Rec);

            Contact2.SetSkipDefault();
            Contact2.Validate(Contact2.Name);
            Contact2.Validate(Contact2."E-Mail");
            Contact2.Type := Cust."Contact Type";
            //Contact2."Contact Business Relation" := Contact2."Contact Business Relation"::;
            Contact2."Job Title" := Rec."Job Title";
            Contact2.Insert(true);
            Contact2."Job Title" := Rec."Job Title";
            Contact2.Modify();
            ContBusRel.SetCurrentKey("Link to Table", "No.");
            ContBusRel.SetRange("Link to Table", ContBusRel."Link to Table"::Customer);
            ContBusRel.SetRange("No.", Rec."Customer No.");
            ContBusRel.SetRange("Contact No.", Contact2."No.");
            if not ContBusRel.FindFirst() then begin
                //Error('Error link table=%1,No.=%2,Contact No.=%3', Format(ContBusRel."Link to Table"::Customer), Rec."Customer No.", Contact2."No.");
                ContBusRel.Init();
                ContBusRel."Contact No." := Contact2."No.";
                ContBusRel."Business Relation Code" := MarketingSetup."Bus. Rel. Code for Customers";
                ContBusRel."Link to Table" := ContBusRel."Link to Table"::Customer;
                ContBusRel."No." := Rec."Customer No.";
                ContBusRel.Insert(false);
            end;
            Contact2.UpdateBusinessRelation();
        end;
        Rec.Insert(true);

        ContactRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(ContactRecordRef, TempFieldSet, CurrentDateTime());
        ContactRecordRef.SetTable(Rec);

        Rec.Modify(true);
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        Contact: Record Contact;
    begin
        Contact.GetBySystemId(Rec.SystemId);

        if Rec."No." = Contact."No." then
            Rec.Modify(true)
        else begin
            Contact.TransferFields(Rec, false);
            Contact.Rename(Rec."No.");
            Rec.TransferFields(Contact);
        end;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
    end;

    var
        TempFieldSet: Record 2000000041 temporary;
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        TaxRegistrationNumber: Text[50];
        NotProvidedContactNameErr: Label 'A "displayName" must be provided.', Comment = 'displayName is a field name and should not be translated.';
        BusRelError: Label 'Business Relation code for customer must be available in Marketing Setup.';
        BlankContactNameErr: Label 'The blank "displayName" is not allowed.', Comment = 'displayName is a field name and should not be translated.';
        BECountryCodeLbl: Label 'BE', Locked = true;
        RecordsLoaded: Boolean;
        FiltersNotSpecifiedErrorLbl: Label 'id type not specified.';


    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::Contact, FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::Contact;
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

