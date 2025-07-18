namespace Microsoft.API.V2;

using Microsoft.Sales.Customer;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Finance.Currency;
using Microsoft.Foundation.PaymentTerms;
using Microsoft.Foundation.Shipping;
using Microsoft.Bank.BankAccount;
using Microsoft.Integration.Graph;
using Microsoft.Integration.Entity;

page 50100 "API - Customers"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Customer';
    EntitySetCaption = 'Customers';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'alencustomer';
    EntitySetName = 'alencustomers';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = Customer;
    Extensible = true;
    APIPublisher = 'HappiestMinds';
    APIGroup = 'AlenAPIS';

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
                }
                field(extId; Rec."Name 2")
                {
                    Caption = 'External Id';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin

                        RegisterFieldSet(Rec.FieldNo("Name 2"));
                    end;
                }
                field(displayName; Rec.Name)
                {
                    Caption = 'Display Name';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if Rec.Name = '' then
                            Error(BlankCustomerNameErr);
                        RegisterFieldSet(Rec.FieldNo(Name));
                    end;
                }
                field(type; Rec."Contact Type")
                {
                    Caption = 'Type';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Contact Type"));
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
                field(email; Rec."E-Mail")

                {
                    Caption = 'Email';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("E-Mail"));
                    end;
                }
                field(custpostGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Category';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Customer Posting Group"));
                    end;
                }
                field(department; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Department';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Global Dimension 1 Code"));
                    end;
                }
                field(salespersonCode; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Salesperson Code"));
                    end;
                }
                field(balanceDue; Rec."Balance Due")
                {
                    Caption = 'Balance Due';
                    Editable = false;
                }
                field(creditLimit; Rec."Credit Limit (LCY)")
                {
                    Caption = 'Credit Limit';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Credit Limit (LCY)"));
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
                field(taxAreaId; Rec."Tax Area ID")
                {
                    Caption = 'Tax Area Id';

                    trigger OnValidate()
                    var
                        GeneralLedgerSetup: Record "General Ledger Setup";
                    begin
                        RegisterFieldSet(Rec.FieldNo("Tax Area ID"));

                        if not GeneralLedgerSetup.UseVat() then
                            RegisterFieldSet(Rec.FieldNo("Tax Area Code"))
                        else
                            RegisterFieldSet(Rec.FieldNo("VAT Bus. Posting Group"));
                    end;
                }
                field(taxAreaDisplayName; TaxAreaDisplayNameGlobal)
                {
                    Caption = 'Tax Area Display Name';
                    Editable = false;
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
                field(currencyId; Rec."Currency Id")
                {
                    Caption = 'Currency Id';

                    trigger OnValidate()
                    begin
                        if Rec."Currency Id" = BlankGUID then
                            Rec."Currency Code" := ''
                        else begin
                            if not Currency.GetBySystemId(Rec."Currency Id") then
                                Error(CurrencyIdDoesNotMatchACurrencyErr);

                            Rec."Currency Code" := Currency.Code;
                        end;

                        RegisterFieldSet(Rec.FieldNo("Currency Id"));
                        RegisterFieldSet(Rec.FieldNo("Currency Code"));
                    end;
                }
                field(currencyCode; CurrencyCodeTxt)
                {
                    Caption = 'Currency Code';

                    trigger OnValidate()
                    begin
                        Rec."Currency Code" :=
                          GraphMgtGeneralTools.TranslateCurrencyCodeToNAVCurrencyCode(
                            LCYCurrencyCode, COPYSTR(CurrencyCodeTxt, 1, MAXSTRLEN(LCYCurrencyCode)));

                        if Currency.Code <> '' then begin
                            if Currency.Code <> Rec."Currency Code" then
                                Error(CurrencyValuesDontMatchErr);
                            exit;
                        end;

                        if Rec."Currency Code" = '' then
                            Rec."Currency Id" := BlankGUID
                        else begin
                            if not Currency.Get(Rec."Currency Code") then
                                Error(CurrencyCodeDoesNotMatchACurrencyErr);

                            Rec."Currency Id" := Currency.SystemId;
                        end;

                        RegisterFieldSet(Rec.FieldNo("Currency Id"));
                        RegisterFieldSet(Rec.FieldNo("Currency Code"));
                    end;
                }
                field(paymentTermsId; Rec."Payment Terms Id")
                {
                    Caption = 'Payment Terms Id';

                    trigger OnValidate()
                    begin
                        if Rec."Payment Terms Id" = BlankGUID then
                            Rec."Payment Terms Code" := ''
                        else begin
                            if not PaymentTerms.GetBySystemId(Rec."Payment Terms Id") then
                                Error(PaymentTermsIdDoesNotMatchAPaymentTermsErr);

                            Rec."Payment Terms Code" := PaymentTerms.Code;
                        end;

                        RegisterFieldSet(Rec.FieldNo("Payment Terms Id"));
                        RegisterFieldSet(Rec.FieldNo("Payment Terms Code"));
                    end;
                }
                field(shipmentMethodId; Rec."Shipment Method Id")
                {
                    Caption = 'Shipment Method Id';

                    trigger OnValidate()
                    begin
                        if Rec."Shipment Method Id" = BlankGUID then
                            Rec."Shipment Method Code" := ''
                        else begin
                            if not ShipmentMethod.GetBySystemId(Rec."Shipment Method Id") then
                                Error(ShipmentMethodIdDoesNotMatchAShipmentMethodErr);

                            Rec."Shipment Method Code" := ShipmentMethod.Code;
                        end;

                        RegisterFieldSet(Rec.FieldNo("Shipment Method Id"));
                        RegisterFieldSet(Rec.FieldNo("Shipment Method Code"));
                    end;
                }
                field(paymentMethodId; Rec."Payment Method Id")
                {
                    Caption = 'Payment Method Id';

                    trigger OnValidate()
                    begin
                        if Rec."Payment Method Id" = BlankGUID then
                            Rec."Payment Method Code" := ''
                        else begin
                            if not PaymentMethod.GetBySystemId(Rec."Payment Method Id") then
                                Error(PaymentMethodIdDoesNotMatchAPaymentMethodErr);

                            Rec."Payment Method Code" := PaymentMethod.Code;
                        end;

                        RegisterFieldSet(Rec.FieldNo("Payment Method Id"));
                        RegisterFieldSet(Rec.FieldNo("Payment Method Code"));
                    end;
                }
                field(receivableaccount; Rec."Gen. Bus. Posting Group")
                {
                    Caption = 'Receivable Account';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Gen. Bus. Posting Group"));
                    end;
                }
                field(pricelevel; Rec."Customer Price Group")
                {
                    Caption = 'Customer Price Group';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Customer Price Group"));
                    end;
                }
                field(terms; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Payment Terms Code"));
                    end;
                }
                field(taxable; Rec."Tax Liable")
                {
                    Caption = 'Taxable';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Tax Liable"));
                    end;
                }
                field(taxitem; Rec."Tax Area Code")
                {
                    Caption = 'Tax Item';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Tax Area Code"));
                    end;
                }
                field(taxIdendification; Rec."Tax Identification Type")
                {
                    Caption = 'Tax Identification Type';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Tax Identification Type"));
                    end;
                }
                field(discountlevel; Rec."Customer Disc. Group")
                {
                    Caption = 'Customer Discount Group';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Customer Disc. Group"));
                    end;
                }
                field(blocked; Rec.Blocked)
                {
                    Caption = 'Blocked';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Blocked));
                    end;
                }
                field(shipAgent; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shipping Agent Code"));
                    end;
                }
                field(shipAgentService; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shipping Agent Service Code"));
                    end;
                }

                field(status; Rec.Status)
                {
                    Caption = 'Status';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Status));
                    end;
                }
                field(thirdpartybilladdress; Rec."Third Party Billing Address")
                {
                    Caption = 'Third Party Billing Address';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Third Party Billing Address"));
                    end;
                }
                field(thirdpartybillaccount; Rec."Third Party Billing Account")
                {
                    Caption = 'Third Party Billing Account';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Third Party Billing Account"));
                    end;
                }
                field(thirdpartycarrier; Rec."Third Party Carrier")
                {
                    Caption = 'Third Party Carrier';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Third Party Carrier"));
                    end;
                }
                field(thirdpartyzipcode; Rec."Third Party Zip Code")
                {
                    Caption = 'Third Party Zip Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Third Party Zip Code"));
                    end;
                }
                field(pbcscategory; Rec."PBCS Category")
                {
                    Caption = 'PBCS Category';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("PBCS Category"));
                    end;
                }
                field(customersetslocation; Rec."Customer Sets Location")
                {
                    Caption = 'Customer Sets Location';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Customer Sets Location"));
                    end;
                }
                field(subscriptioncustomer; Rec."subscription_customer")
                {
                    Caption = 'Subscription Customer';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("subscription_customer"));
                    end;
                }
                field(warrantycustomer; Rec."warranty_customer")
                {
                    Caption = 'Warranty Customer';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("warranty_customer"));
                    end;
                }
                // field(b2bcustomer; Rec."b2b_customer")
                // {
                //     Caption = 'B2B Customer';

                //     trigger OnValidate()
                //     begin
                //         RegisterFieldSet(Rec.FieldNo("b2b_customer"));
                //     end;
                // }
                field(shopifyCustomer; Rec."Shopify Customer No.")
                {
                    Caption = 'Shopify Customer';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shopify Customer No."));
                    end;
                }
                field(zendeskCustomer; Rec."Zendesk Customer No.")
                {
                    Caption = 'Zendesk Customer No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Zendesk Customer No."));
                    end;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                }
                part(customerFinancialDetails; "APIV2 - Cust Financial Details")
                {
                    Caption = 'Customer Financial Details';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'customerFinancialDetail';
                    EntitySetName = 'customerFinancialDetails';
                    SubPageLink = SystemId = field(SystemId);
                }
                part(picture; "APIV2 - Pictures")
                {
                    Caption = 'Picture';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'picture';
                    EntitySetName = 'pictures';
                    SubPageLink = Id = field(SystemId), "Parent Type" = const(Customer);
                }
                part(defaultDimensions; "APIV2 - Default Dimensions")
                {
                    Caption = 'Default Dimensions';
                    EntityName = 'defaultDimension';
                    EntitySetName = 'defaultDimensions';
                    SubPageLink = ParentId = field(SystemId), "Parent Type" = const(Customer);
                }
                part(agedAccountsReceivable; "APIV2 - Aged AR")
                {
                    Caption = 'Aged Accounts Receivable';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'agedAccountsReceivable';
                    EntitySetName = 'agedAccountsReceivables';
                    SubPageLink = AccountId = field(SystemId);
                }
                // part(contactsInformation; "API - Contacts Information")
                // {
                //     Caption = 'Contacts Information';
                //     EntityName = 'alencontactInformation';
                //     EntitySetName = 'alencontactsInformation';
                //     SubPageLink = "Related Id" = field(SystemId), "Related Type" = const(Customer);
                // }
                part(contacts; "API - Contacts")
                {
                    Caption = 'Contacts';
                    //Multiplicity = ZeroOrOne;
                    EntityName = 'alencontact';
                    EntitySetName = 'alencontacts';
                    SubPageLink = "Customer No." = field("No.");
                }
                part(documentAttachments; "APIV2 - Document Attachments")
                {
                    Caption = 'Document Attachments';
                    EntityName = 'documentAttachment';
                    EntitySetName = 'documentAttachments';
                    SubPageLink = "Document Id" = field(SystemId), "Document Type" = const(Customer);
                }
                part(creditcardInformation; "API - CustomerBank")
                {
                    Caption = 'Credit Card Information';
                    EntityName = 'alencustomerBank';
                    EntitySetName = 'alencustomerBank';
                    SubPageLink = "Customer No." = field("No.");
                }
                part(shiptoaddressInformation; "API - ShiptoAddress")
                {
                    Caption = 'Shipping-Billing Address';
                    EntityName = 'alenshiptoAddress';
                    EntitySetName = 'alenshiptoAddress';
                    SubPageLink = "Customer No." = field("No.");
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        SetCalculatedFields();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Customer: Record Customer;
        CustomerRecordRef: RecordRef;
    begin
        if Rec.Name = '' then
            Error(NotProvidedCustomerNameErr);

        Customer.SetRange("No.", Rec."No.");
        if not Customer.IsEmpty() then
            Rec.Insert();

        Rec.Insert(true);

        CustomerRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(CustomerRecordRef, TempFieldSet, CurrentDateTime());
        CustomerRecordRef.SetTable(Rec);

        Rec.Modify(true);
        SetCalculatedFields();
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        Customer: Record Customer;
    begin
        Customer.GetBySystemId(Rec.SystemId);

        if Rec."No." = Customer."No." then
            Rec.Modify(true)
        else begin
            Customer.TransferFields(Rec, false);
            Customer.Rename(Rec."No.");
            Rec.TransferFields(Customer);
        end;

        SetCalculatedFields();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ClearCalculatedFields();
    end;

    var
        Currency: Record Currency;
        PaymentTerms: Record "Payment Terms";
        ShipmentMethod: Record "Shipment Method";
        PaymentMethod: Record "Payment Method";
        TempFieldSet: Record 2000000041 temporary;
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        LCYCurrencyCode: Code[10];
        TaxRegistrationNumber: Text[50];
        CurrencyCodeTxt: Text;
        TaxAreaDisplayNameGlobal: Text;
        CurrencyValuesDontMatchErr: Label 'The currency values do not match to a specific Currency.';
        CurrencyIdDoesNotMatchACurrencyErr: Label 'The "currencyId" does not match to a Currency.', Comment = 'currencyId is a field name and should not be translated.';
        CurrencyCodeDoesNotMatchACurrencyErr: Label 'The "currencyCode" does not match to a Currency.', Comment = 'currencyCode is a field name and should not be translated.';
        PaymentTermsIdDoesNotMatchAPaymentTermsErr: Label 'The "paymentTermsId" does not match to a Payment Terms.', Comment = 'paymentTermsId is a field name and should not be translated.';
        ShipmentMethodIdDoesNotMatchAShipmentMethodErr: Label 'The "shipmentMethodId" does not match to a Shipment Method.', Comment = 'shipmentMethodId is a field name and should not be translated.';
        PaymentMethodIdDoesNotMatchAPaymentMethodErr: Label 'The "paymentMethodId" does not match to a Payment Method.', Comment = 'paymentMethodId is a field name and should not be translated.';
        BlankGUID: Guid;
        NotProvidedCustomerNameErr: Label 'A "displayName" must be provided.', Comment = 'displayName is a field name and should not be translated.';
        BlankCustomerNameErr: Label 'The blank "displayName" is not allowed.', Comment = 'displayName is a field name and should not be translated.';
        BECountryCodeLbl: Label 'BE', Locked = true;

    local procedure SetCalculatedFields()
    var
        TaxAreaBuffer: Record "Tax Area Buffer";
        EnterpriseNoFieldRef: FieldRef;
    begin
        CurrencyCodeTxt := GraphMgtGeneralTools.TranslateNAVCurrencyCodeToCurrencyCode(LCYCurrencyCode, Rec."Currency Code");
        TaxAreaDisplayNameGlobal := TaxAreaBuffer.GetTaxAreaDisplayName(Rec."Tax Area ID");

        if IsEnterpriseNumber(EnterpriseNoFieldRef) then begin
            if (Rec."Country/Region Code" <> BECountryCodeLbl) and (Rec."Country/Region Code" <> '') then
                TaxRegistrationNumber := Rec."VAT Registration No."
            else
                TaxRegistrationNumber := EnterpriseNoFieldRef.Value();
        end else
            TaxRegistrationNumber := Rec."VAT Registration No.";
    end;

    local procedure ClearCalculatedFields()
    begin
        Clear(Rec.SystemId);
        Clear(TaxAreaDisplayNameGlobal);
        Clear(TaxRegistrationNumber);
        TempFieldSet.DeleteAll();
    end;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::Customer, FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::Customer;
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;

    procedure IsEnterpriseNumber(var EnterpriseNoFieldRef: FieldRef): Boolean
    var
        CustomerRecordRef: RecordRef;
    begin
        CustomerRecordRef.GetTable(Rec);
        if CustomerRecordRef.FieldExist(11310) then begin
            EnterpriseNoFieldRef := CustomerRecordRef.Field(11310);
            exit((EnterpriseNoFieldRef.Type = FieldType::Text) and (EnterpriseNoFieldRef.Name = 'Enterprise No.'));
        end else
            exit(false);
    end;
}

