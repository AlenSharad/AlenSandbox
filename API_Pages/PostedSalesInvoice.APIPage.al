
page 50140 "API - Sales Invoices"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Sales Invoice';
    EntitySetCaption = 'Sales Invoices';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'salesInvoice';
    EntitySetName = 'salesInvoices';
    ODataKeyFields = SystemId;
    Permissions = tabledata "Sales Invoice Header" = rm;
    PageType = API;
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
    Extensible = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    SourceTable = "Sales Invoice Header";

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
                    Editable = false;
                }
                field(externalDocumentNumber; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                    Editable = false;
                }
                field(invoiceDate; Rec."Document Date")
                {
                    Caption = 'Invoice Date';
                    Editable = false;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';

                    Editable = false;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    Editable = false;
                }

                field(promisedPayDate; Rec."Promised Pay Date")
                {
                    Caption = 'Promised Pay Date';
                    Editable = false;
                }
                field(customerPurchaseOrderReference; Rec."Your Reference")
                {
                    Caption = 'Customer Purchase Order Reference',;
                    Editable = false;
                }


                field(customerNumber; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';
                    Editable = false;
                }
                field(customerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Customer Name';
                    Editable = false;
                }
                field(billToName; Rec."Bill-to Name")
                {
                    Caption = 'Bill-To Name';
                    Editable = false;
                }
                field(billToCustomerNumber; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-To Customer No.';
                    Editable = false;
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                    Editable = false;
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';
                    Editable = false;
                }
                field(sellToAddressLine1; Rec."Sell-to Address")
                {
                    Caption = 'Sell-to Address Line 1';
                    Editable = false;
                }
                field(sellToAddressLine2; Rec."Sell-to Address 2")
                {
                    Caption = 'Sell-to Address Line 2';
                    Editable = false;
                }
                field(sellToCity; Rec."Sell-to City")
                {
                    Caption = 'Sell-to City';
                    Editable = false;
                }
                field(sellToCountry; Rec."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';
                    Editable = false;
                }
                field(sellToState; Rec."Sell-to County")
                {
                    Caption = 'Sell-to State';
                    Editable = false;
                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code';
                    Editable = false;
                }
                field(billToAddressLine1; Rec."Bill-To Address")
                {
                    Caption = 'Bill-to Address Line 1';
                    Editable = false;
                }
                field(billToAddressLine2; Rec."Bill-To Address 2")
                {
                    Caption = 'Bill-to Address Line 2';
                    Editable = false;
                }
                field(billToCity; Rec."Bill-To City")
                {
                    Caption = 'Bill-to City';
                    Editable = false;
                }
                field(billToCountry; Rec."Bill-To Country/Region Code")
                {
                    Caption = 'Bill-to Country/Region Code';
                    Editable = false;
                }
                field(billToState; Rec."Bill-To County")
                {
                    Caption = 'Bill-to State';
                    Editable = false;
                }
                field(billToPostCode; Rec."Bill-To Post Code")
                {
                    Caption = 'Bill-to Post Code';
                    Editable = false;
                }
                field(shipToAddressLine1; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address Line 1';
                    Editable = false;
                }
                field(shipToAddressLine2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address Line 2';
                    Editable = false;
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';
                    Editable = false;
                }
                field(shipToCountry; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';
                    Editable = false;
                }
                field(shipToState; Rec."Ship-to County")
                {
                    Caption = 'Ship-to State';
                    Editable = false;
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';
                    Editable = false;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';
                    Editable = false;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                    Editable = false;
                }
                field(currencyCode; CurrencyCodeTxt)
                {
                    Caption = 'Currency Code';
                    Editable = false;
                }

                field(orderNumber; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    Editable = false;
                }
                field(paymentTermsId; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Id';
                    Editable = false;

                }
                field(shipmentMethodId; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Id';
                    Editable = false;

                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';
                    Editable = false;
                }
                field(salesperson; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson';
                    Editable = false;
                }
                field(disputeStatusId; Rec."Dispute Status Id")
                {
                    Caption = 'Dispute Status Id';
                    Editable = false;

                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'shippingAgentServiceCode';
                    Editable = false;
                }
                field(orderDate; Rec."Document Date")
                {
                    Caption = 'Order Date';
                    Editable = false;
                }
                field(disputeStatus; Rec."Dispute Status")
                {
                    Caption = 'Dispute Status';
                    Editable = false;
                }
                field(pricesIncludeTax; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Include Tax';
                    Editable = false;
                }

                field(remainingAmount; RemainingAmountVar)
                {
                    Caption = 'Remaining Amount';
                    Editable = false;
                }
                part(dimensionSetLines; "APIV2 - Dimension Set Lines")
                {
                    Caption = 'Dimension Set Lines';
                    EntityName = 'dimensionSetLine';
                    EntitySetName = 'dimensionSetLines';
                    SubPageLink = "Parent Type" = const("Sales Invoice");
                }
                part(salesInvoiceLines; "API - Sales Invoice Lines")
                {
                    Caption = 'Lines';
                    EntityName = 'salesInvoiceLine';
                    EntitySetName = 'salesInvoiceLines';
                    SubPageLink = "Document No." = field("No.");
                }
                part(pdfDocument; "APIV2 - PDF Document")
                {
                    Caption = 'PDF Document';
                    Multiplicity = ZeroOrOne;
                    EntityName = 'pdfDocument';
                    EntitySetName = 'pdfDocument';
                    SubPageLink = "Document Type" = const("Sales Invoice");
                }
                field(discountAmount; Rec."Invoice Discount Amount")
                {
                    Caption = 'Discount Amount';
                    Editable = false;
                }

                field(totalAmountExcludingTax; Rec.Amount)
                {
                    Caption = 'Total Amount Excluding Tax';
                    Editable = false;
                }
                field(totalTaxAmount; Rec."Ava Tax Amount")
                {
                    Caption = 'Total Tax Amount';
                    Editable = false;

                }
                field(totalAmountIncludingTax; Rec."Amount Including VAT")
                {
                    Caption = 'Total Amount Including Tax';
                    Editable = false;

                }

                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }
                field(phoneNumber; Rec."Sell-to Phone No.")
                {
                    Caption = 'Phone No.';
                    Editable = false;
                }
                field(email; Rec."Sell-to E-Mail")
                {
                    Caption = 'Email';
                    Editable = false;
                }
                //custom fields
                field("memo"; Rec."memo")
                {
                    ApplicationArea = All;
                    Caption = 'Memo';
                    Editable = false;
                }
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';
                    Editable = false;
                }
                field("shippingAddress_attention"; Rec."shippingAddress_attention")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Address Attention';
                    Editable = false;
                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';
                    Editable = false;
                }
                field("Dealer_Department_Number"; Rec."Dealer_Department_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Number';
                    Editable = false;
                }
                field("Dealer_Department_Description"; Rec."Dealer_Department_Description")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Description';
                    Editable = false;
                }
                field("Standard_Carrier_Alpha_Code"; Rec."Standard_Carrier_Alpha_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Carrier Alpha Code';
                    Editable = false;
                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';
                    Editable = false;
                }
                field("Carrier_Transportation_Method_Code"; Rec."Transportation_Method_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Carrier Transportation Method Code';
                    Editable = false;
                }
                field("Transaction_ID"; Rec."Transaction_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';
                    Editable = false;
                }
                field("discountItem_intID"; Rec."discountItem_intID")
                {
                    ApplicationArea = All;
                    Caption = 'Discount Item - intID';
                    Editable = false;
                }
                field("Customer_Account_Number"; Rec."Customer_Account_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Account Number';
                    Editable = false;
                }
                field("Special_Instructions"; Rec."Special_Instructions")
                {
                    ApplicationArea = All;
                    Caption = 'Special Instructions';
                    Editable = false;
                }
                field("Customer_Order_Number"; Rec."Customer_Order_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Order Number';
                    Editable = false;
                }
                field("Release_No"; Rec."Release_No")
                {
                    ApplicationArea = All;
                    Caption = 'Release No';
                    Editable = false;
                }
                field("Ship_To_Code_Qualifier"; Rec."Ship_To_Code_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'Ship To Code Qualifier';
                    Editable = false;
                }
                field("Requested_Ship_Date"; Rec."Requested_Ship_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Ship Date';
                    Editable = false;
                }
                field("Current_Scheduled_Delivery"; Rec."Current_Scheduled_Delivery")
                {
                    ApplicationArea = All;
                    Caption = 'Current Scheduled Delivery';
                    Editable = false;
                }
                field("Requested_PickUp_Date"; Rec."Requested_PickUp_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Pick Up Date';
                    Editable = false;
                }
                field("Packaging_Type"; Rec."Packaging_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Packaging Type';
                    Editable = false;
                }
                field("Total_Packages"; Rec."Total_Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Total Packages';
                    Editable = false;
                }
                field("PKG_PLT_Qty"; Rec."PKG_PLT_Qty")
                {
                    ApplicationArea = All;
                    Caption = 'PKG PLT Qty';
                    Editable = false;
                }
                field("Marketplace_Shipment_ID"; Rec."Marketplace_Shipment_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Marketplace Shipment ID';
                    Editable = false;
                }
                field("824_Received"; Rec."824_Received")
                {
                    ApplicationArea = All;
                    Caption = '824 Received';
                    Editable = false;
                }
                field("824_Notes"; Rec."824_Notes")
                {
                    ApplicationArea = All;
                    Caption = '824 Notes';
                    Editable = false;
                }
                field("Routing_Request_Sent"; Rec."Routing_Request_Sent")
                {
                    ApplicationArea = All;
                    Caption = 'Routing Request Sent';
                    Editable = false;
                }
                field("Processed"; Rec."Processed")
                {
                    ApplicationArea = All;
                    Caption = 'Processed';
                    Editable = false;
                }
                field("Supplier_Contact_Name"; Rec."Supplier_Contact_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Name';
                    Editable = false;
                }
                field(locationCode; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Caption = 'Location Code';
                    Editable = false;
                }
                field("Supplier_Contact_No"; Rec."Supplier_Contact_No")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact No.';
                    Editable = false;
                }
                field("Supplier_Contact_Email"; Rec."Supplier_Contact_Email")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Email';
                    Editable = false;
                }
                field(invoiceSent; Rec."Invoice Sent")
                {
                    Caption = 'Invoice Sent';
                    Editable = true;
                }
                field(shipFrom; Rec."Ship From")
                {
                    Caption = 'Ship From';
                    Editable = false;
                }
                field(thirdPartyBillingAccount; Rec."3rd Party Billing Account")
                {
                    Caption = '3rd Party Billing Account';
                    Editable = false;
                }
                field(thirdPartyZip; Rec."3rd Party Zip")
                {
                    Caption = '3rd Party Zip';
                    Editable = false;
                }
                field(thirdPartyCarrier; Rec."3rd Party Carrier")
                {
                    Caption = '3rd Party Carrier';
                    Editable = false;
                }

                field(isShipResidential; Rec.isShipresidential)
                {
                    Caption = 'Is Ship Residential';
                    Editable = false;
                }

                // part(attachments; "APIV2 - Attachments")
                // {
                //     Caption = 'Attachments';
                //     EntityName = 'attachment';
                //     EntitySetName = 'attachments';
                //     SubPageLink = "Document Id" = field(Id), "Document Type" = const("Sales Invoice");
                // }

                // part(documentAttachments; "APIV2 - Document Attachments")
                // {
                //     Caption = 'Document Attachments';
                //     EntityName = 'documentAttachment';
                //     EntitySetName = 'documentAttachments';
                //     SubPageLink = "Document Id" = field(Id), "Document Type" = const("Sales Invoice");
                // }
            }
        }
    }

    actions
    {
    }


    var
        TempFieldBuffer: Record 8450 temporary;
        SellToCustomer: Record "Customer";
        BillToCustomer: Record "Customer";
        DisputeStatus: Record "Dispute Status";
        Currency: Record "Currency";
        PaymentTerms: Record "Payment Terms";
        ShipmentMethod: Record "Shipment Method";
        O365SetupEmail: Codeunit "O365 Setup Email";
        APIV2SendSalesDocument: Codeunit "APIV2 - Send Sales Document";
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        CannotChangeIDErr: Label 'The id cannot be changed.';
        LCYCurrencyCode: Code[10];
        CurrencyCodeTxt: Text;
        SellToCustomerNotProvidedErr: Label 'A "customerNumber" or a "customerId" must be provided.', Comment = 'customerNumber and customerId are field names and should not be translated.';
        SellToCustomerValuesDontMatchErr: Label 'The sell-to customer values do not match to a specific Customer.';
        BillToCustomerValuesDontMatchErr: Label 'The bill-to customer values do not match to a specific Customer.';
        CouldNotFindSellToCustomerErr: Label 'The sell-to customer cannot be found.';
        CouldNotFindBillToCustomerErr: Label 'The bill-to customer cannot be found.';
        CouldNotFindDisputeStatusErr: Label 'The dispute status cannot be found.';
        CurrencyValuesDontMatchErr: Label 'The currency values do not match to a specific Currency.';
        CurrencyIdDoesNotMatchACurrencyErr: Label 'The "currencyId" does not match to a Currency.', Comment = 'currencyId is a field name and should not be translated.';
        CurrencyCodeDoesNotMatchACurrencyErr: Label 'The "currencyCode" does not match to a Currency.', Comment = 'currencyCode is a field name and should not be translated.';
        BlankGUID: Guid;
        PaymentTermsIdDoesNotMatchAPaymentTermsErr: Label 'The "paymentTermsId" does not match to a Payment Terms.', Comment = 'paymentTermsId is a field name and should not be translated.';
        ShipmentMethodIdDoesNotMatchAShipmentMethodErr: Label 'The "shipmentMethodId" does not match to a Shipment Method.', Comment = 'shipmentMethodId is a field name and should not be translated.';
        DisputeStatusIdDoesNotMatchADisputeStatusErr: Label 'The "disputeStatusId" does not match to a Dispute Status.', Comment = 'disputeStatusId is a field name and should not be translated.';
        PermissionFilterFormatTxt: Label '<>%1&<>%2', Locked = true;
        PermissionInvoiceFilterformatTxt: Label '<>%1&<>%2&<>%3&<>%4', Locked = true;
        DiscountAmountSet: Boolean;
        InvoiceDiscountAmount: Decimal;
        RemainingAmountVar: Decimal;
        DocumentDateSet: Boolean;
        DocumentDateVar: Date;
        PostingDateSet: Boolean;
        PostingDateVar: Date;
        DueDateSet: Boolean;
        DueDateVar: Date;
        PostedInvoiceActionErr: Label 'The action can be applied to a posted invoice only.';
        DraftInvoiceActionErr: Label 'The action can be applied to a draft invoice only.';
        CannotFindInvoiceErr: Label 'The invoice cannot be found.';
        CancelingInvoiceFailedCreditMemoCreatedAndPostedErr: Label 'Canceling the invoice failed because of the following error: \\%1\\A credit memo is posted.', Comment = '%1 - arbitrary text (an error message)';
        CancelingInvoiceFailedCreditMemoCreatedButNotPostedErr: Label 'Canceling the invoice failed because of the following error: \\%1\\A credit memo is created but not posted.', Comment = '%1 - arbitrary text (an error message)';
        CancelingInvoiceFailedNothingCreatedErr: Label 'Canceling the invoice failed because of the following error: \\%1.', Comment = '%1 - arbitrary text (an error message)';
        EmptyEmailErr: Label 'The send-to email is empty. Specify email either for the customer or for the invoice in email preview.';
        AlreadyCanceledErr: Label 'The invoice cannot be canceled because it has already been canceled.';
        InvoiceClosedErr: Label 'The invoice is closed. The corrective credit memo will not be applied to the invoice.';
        InvoicePartiallyPaidErr: Label 'The invoice is partially paid or credited. The corrective credit memo may not be fully closed by the invoice.';
        HasWritePermissionForDraft: Boolean;

}