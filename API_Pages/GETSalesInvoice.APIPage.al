
page 50145 "API - Get Sales Invoices"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Sales Invoice';
    EntitySetCaption = 'Sales Invoices';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'getAlenSalesInvoice';
    EntitySetName = 'getAlenSalesInvoices';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Invoice));
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
    Extensible = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
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


                }
                field(invoiceDate; Rec."Document Date")
                {
                    Caption = 'Invoice Date';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';

                }
                field(customerPostingGroup; Rec."Customer Posting Group")
                {
                    Caption = 'Customer Posting Group';
                    Editable = false;
                }

                field(customerNumber; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';

                }
                field(customerName; Rec."Sell-to Customer Name")
                {
                    Caption = 'Customer Name';
                    Editable = false;
                }
                field(billToName; Rec."Bill-to Name")
                {
                    Caption = 'Bill-to Name';
                    Editable = true;
                }
                field(billToCustomerId; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer Id';
                }

                field(billToCustomerNumber; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';
                }
                field(sellToAddressLine1; Rec."Sell-to Address")
                {
                    Caption = 'Sell-to Address Line 1';
                }
                field(sellToAddressLine2; Rec."Sell-to Address 2")
                {
                    Caption = 'Sell-to Address Line 2';
                }
                field(sellToCity; Rec."Sell-to City")
                {
                    Caption = 'Sell-to City';


                }
                field(sellToCountry; Rec."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';


                }
                field(sellToState; Rec."Sell-to County")
                {
                    Caption = 'Sell-to State';


                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code';


                }
                field(billToAddressLine1; Rec."Bill-to Address")
                {
                    Caption = 'Bill-to Address Line 1';
                    //Editable = false;

                }
                field(billToAddressLine2; Rec."Bill-to Address 2")
                {
                    Caption = 'Bill-to Address Line 2';
                    //Editable = false;

                }
                field(billToCity; Rec."Bill-to City")
                {
                    Caption = 'Bill-to City';
                    //Editable = false;

                }
                field(billToCountry; Rec."Bill-to Country/Region Code")
                {
                    Caption = 'Bill-to Country/Region Code';
                    //Editable = false;

                }
                field(billToState; Rec."Bill-to County")
                {
                    Caption = 'BillTo State';
                    //Editable = false;

                }
                field(billToPostCode; Rec."Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code';
                    Editable = false;

                }
                field(billToPhoneNo; Rec."Bill-to Phone No.")
                {
                    Caption = 'Bill-to Phone No.';
                    Editable = false;

                }

                field(shipToAddressLine1; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address Line 1';


                }

                field(shipToAddressLine2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address Line 2';


                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';


                }
                field(shipToCountry; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';


                }
                field(shipToState; Rec."Ship-to County")
                {
                    Caption = 'Ship-to State';


                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';


                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';


                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';

                }

                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';


                }
                field(pricesIncludeTax; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Include Tax';


                }
                field(paymentTermsId; Rec."Payment Terms Code")
                {
                    Caption = 'Payment Terms Code';


                }
                field(shipmentMethodId; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';


                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';

                }
                field(taxLiable; Rec."Tax Liable")
                {
                    Caption = 'Tax Liable';

                }

                field(taxAreaCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Area Code';
                }
                field(salesperson; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    AccessByPermission = TableData "Shipping Agent Services" = R;
                    Caption = 'Shipping Agent Code';

                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';

                }
                field(paymentMethod; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';
                }
                field(partialShipping; PartialOrderShipping)
                {
                    Caption = 'Partial Shipping';
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                {
                    Caption = 'Requested Delivery Date';

                }

                field(orderTotalCheck; Rec."Order Total Check")
                {
                    Caption = 'Order Total Check';
                }
                field(orderTotalExclTax; Rec."Order Total Excl Tax")
                {
                    Caption = 'Order Total Excl. Tax';

                }
                field(orderTotalVariance; Rec."Order Total Variance")
                {
                    Caption = 'Order Total Variance';

                }
                field(taxAmount; Rec."Ava Tax Amount")
                {
                    Caption = 'AVA Tax Amount';

                }
                field("memo"; Rec."memo")
                {
                    ApplicationArea = All;
                    Caption = 'Memo';

                }
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';

                }
                field("shippingAddress_attention"; Rec."shippingAddress_attention")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Address Attention';

                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';

                }
                field("Dealer_Department_Number"; Rec."Dealer_Department_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Number';

                }
                field("Dealer_Department_Description"; Rec."Dealer_Department_Description")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Description';

                }
                field("Standard_Carrier_Alpha_Code"; Rec."Standard_Carrier_Alpha_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Carrier Alpha Code';

                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';

                }
                field(carrierPRONumber; Rec.CarrierPRONumber)
                {
                    ApplicationArea = All;
                    Caption = 'Carrier PRO Number';

                }
                field(billofLading; Rec.BillofLading)
                {
                    ApplicationArea = All;
                    Caption = 'Bill of Lading';

                }
                field("Carrier_Transportation_Method_Code"; Rec."Transportation_Method_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Carrier Transportation Method Code';

                }
                field("Transaction_ID"; Rec."Transaction_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';

                }
                field("discountItem_intID"; Rec."discountItem_intID")
                {
                    ApplicationArea = All;
                    Caption = 'Discount Item - intID';

                }
                field("Customer_Account_Number"; Rec."Customer_Account_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Account Number';

                }
                field("Special_Instructions"; Rec."Special_Instructions")
                {
                    ApplicationArea = All;
                    Caption = 'Special Instructions';

                }
                field("Customer_Order_Number"; Rec."Customer_Order_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Order Number';

                }
                field("Release_No"; Rec."Release_No")
                {
                    ApplicationArea = All;
                    Caption = 'Release No';

                }
                field("Ship_To_Code_Qualifier"; Rec."Ship_To_Code_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'Ship To Code Qualifier';

                }
                field("Requested_Ship_Date"; Rec."Requested_Ship_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Ship Date';

                }
                field("Current_Scheduled_Delivery"; Rec."Current_Scheduled_Delivery")
                {
                    ApplicationArea = All;
                    Caption = 'Current Scheduled Delivery';

                }
                field("Requested_PickUp_Date"; Rec."Requested_PickUp_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Pick Up Date';

                }
                field("Packaging_Type"; Rec."Packaging_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Packaging Type';

                }
                field("Total_Packages"; Rec."Total_Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Total Packages';

                }
                field("PKG_PLT_Qty"; Rec."PKG_PLT_Qty")
                {
                    ApplicationArea = All;
                    Caption = 'PKG PLT Qty';
                }
                field("Marketplace_Shipment_ID"; Rec."Marketplace_Shipment_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Marketplace Shipment ID';
                }
                field("824_Received"; Rec."824_Received")
                {
                    ApplicationArea = All;
                    Caption = '824 Received';

                }
                field("824_Notes"; Rec."824_Notes")
                {
                    ApplicationArea = All;
                    Caption = '824 Notes';

                }
                field("Routing_Request_Sent"; Rec."Routing_Request_Sent")
                {
                    ApplicationArea = All;
                    Caption = 'Routing Request Sent';

                }
                field("Processed"; Rec."Processed")
                {
                    ApplicationArea = All;
                    Caption = 'Processed';

                }
                field("Supplier_Contact_Name"; Rec."Supplier_Contact_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Name';

                }
                field("Supplier_Contact_No"; Rec."Supplier_Contact_No")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact No.';

                }
                field("Supplier_Contact_Email"; Rec."Supplier_Contact_Email")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Email';

                }
                field(shipFrom; Rec."Ship From")
                {
                    Caption = 'Ship From';

                }
                field(thirdPartyBillingAccount; Rec."3rd Party Billing Account")
                {
                    Caption = '3rd Party Billing Account';

                }
                field(thirdPartyZip; Rec."3rd Party Zip")
                {
                    Caption = '3rd Party Zip';

                }
                field(thirdPartyCarrier; Rec."3rd Party Carrier")
                {
                    Caption = '3rd Party Carrier';

                }

                field(isShipResidential; Rec.isShipresidential)
                {
                    Caption = 'Is Ship Residential';

                }
                // part(dimensionSetLines; "APIV2 - Dimension Set Lines")
                // {
                //     Caption = 'Dimension Set Lines';
                //     EntityName = 'dimensionSetLine';
                //     EntitySetName = 'dimensionSetLines';
                //     SubPageLink = "Parent Id" = field(Id), "Parent Type" = const("Sales Order");
                // }
                part(salesInvoiceLines; "API - Get Sales Invoice Lines")
                {
                    Caption = 'Lines';
                    EntityName = 'getSalesInvoiceList';
                    EntitySetName = 'getSalesInvoiceList';
                    SubPageLink = "Document No." = field("No."), "Document Type" = const(Invoice);
                }
                field(discountAmount; Rec."Invoice Discount Amount")
                {
                    Caption = 'Discount Amount';

                }

                field(totalAmountExcludingTax; Rec.Amount)
                {
                    Caption = 'Total Amount Excluding Tax';
                    Editable = false;
                }
                field(orderTotalTax; Rec."Order Total Tax")
                {
                    Caption = 'Order Total Tax';
                }
                // field(totalTaxAmount; Rec."Total Tax Amount")
                // {
                //     Caption = 'Total Tax Amount';
                //     Editable = false;

                //     trigger OnValidate()
                //     begin
                //         RegisterFieldSet(Rec.FieldNo("Total Tax Amount"));
                //     end;
                // }
                field(totalAmountIncludingTax; Rec."Amount Including VAT")
                {
                    Caption = 'Total Amount Including Tax';
                    Editable = false;
                }
                field(fullyShipped; Rec."Completely Shipped")
                {
                    Caption = 'Fully Shipped';

                }
                field(shipmentExist; Rec."Shipment Exist")
                {
                    Caption = 'Shipment Exist';
                    Editable = false;
                }

                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    Editable = false;
                }

                field(phoneNumber; Rec."Sell-to Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(email; Rec."Sell-to E-Mail")
                {
                    Caption = 'Email';

                }
                field(poNumber; Rec."Your Reference")
                {
                    Caption = 'Your Reference';


                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';

                }
                field(agreementNo; Rec."Agreement No.")
                {
                    Caption = 'Agreement No.';


                }
                field(orderDiscountDetails; Rec."Order Discount Details")
                {
                    Caption = 'Order Discount Details';

                }
                field(orderType; Rec."Order Type Code")
                {
                    Caption = 'Order Type';

                }
                // field(shopifyVariant; Rec."Shopify Variant Id")
                // {
                //     Caption = 'Shopify Variant Id';

                //     trigger OnValidate()
                //     begin
                //         RegisterFieldSet(Rec.FieldNo("Shopify Variant Id"));
                //     end;
                // }
                field(sentTo3PLDate; Rec."Sent to 3PL Date")
                {
                    Caption = 'Sent to 3PL Date';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sent to 3PL Date"));
                    end;
                }
                field(sentTo3PL; Rec."Sent to 3PL")
                {
                    Caption = 'Sent to 3PL';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sent to 3PL"));
                    end;
                }
                field(allItemsFullyCommited; Rec."All Items Fully Commited")
                {
                    Caption = 'All Items Fully Commited';


                }
                field(orderSource; Rec."Order Source")
                {
                    Caption = 'Order Source';


                }
                field(storeFrontName; Rec."Storefront Name")
                {
                    Caption = 'Storefront Name';

                }
                field(shipmentWeight; Rec."Shipment Weight")
                {
                    Caption = 'Shipment Weight';

                }
                field(shipmentCubicFT; Rec."Shipment Cubic FT")
                {
                    Caption = 'Shipment Cubic FT';

                }
                field(storeFrontPaymentStatus; Rec."Store Front Payment Status")
                {
                    Caption = 'Store Front Payment Status';

                }
                field(storeFrontPaymentGateway; Rec."Store Front Payment Gateway")
                {

                    Caption = 'Store Front Payment Gateway';

                }
                field(storeFrontPaymentEventType; Rec."Store Front Payment Event Type")
                {
                    Caption = 'Store Front Payment Event Type';
                }
                field(avataxOverrideType; Rec."Ava Tax Override Type")
                {
                    Caption = 'Ava Tax Override Type';

                }
                field(avataxOverrideAmount; Rec."Ava Tax Override Amount")
                {
                    Caption = 'Ava Tax Override Amount';

                }

                field(storeFrontPaymentAuthcode; Rec."Store Front Payment Authcode")
                {
                    Caption = 'Store Front Payment Authcode';

                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }
                field(createdDateTime; Rec.SystemCreatedAt)
                {
                    Caption = 'Created Date';
                    Editable = false;
                }
                field(modifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'Modified By';
                    Editable = false;
                }
                field(createdBy; Rec.SystemCreatedBy)
                {
                    Caption = 'Created By';
                    Editable = false;
                }

                // part(attachments; "APIV2 - Attachments")
                // {
                //     Caption = 'Attachments';
                //     EntityName = 'attachment';
                //     EntitySetName = 'attachments';
                //     SubPageLink = "Document Id" = field(Id), "Document Type" = const("Sales Order");
                // }
                // part(documentAttachments; "APIV2 - Document Attachments")
                // {
                //     Caption = 'Document Attachments';
                //     EntityName = 'documentAttachment';
                //     EntitySetName = 'documentAttachments';
                //     SubPageLink = "Document Id" = field(Id), "Document Type" = const("Sales Order");
                // }
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

    trigger OnDeleteRecord(): Boolean
    begin

        exit(false);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var

    begin

        exit(false);

    end;

    trigger OnModifyRecord(): Boolean
    var
        SH: Record "Sales Header";
    begin
        SH.GetBySystemId(Rec.SystemId);

        if Rec."No." = SH."No." then
            Rec.Modify(true)
        else begin
            Error('test modify');
            SH.TransferFields(Rec, false);
            SH.Rename(Rec."Document Type", Rec."No.");
            Rec.TransferFields(SH);
        end;

        //SetCalculatedFields();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        ClearCalculatedFields();

    end;

    trigger OnOpenPage()
    begin
        CheckPermissions();
    end;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::"Sales Header", FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::"Sales Header";
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;

    var
        TempFieldBuffer: Record "Field Buffer" temporary;
        TempFieldSet: Record 2000000041 temporary;
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        LCYCurrencyCode: Code[10];
        CurrencyCodeTxt: Text;
        PartialOrderShipping: Boolean;
        SalesOrderPermissionsErr: Label 'You do not have permissions to read Sales Orders.';
        DiscountAmountSet: Boolean;
        InvoiceDiscountAmount: Decimal;
        HasWritePermission: Boolean;


    local procedure SetCalculatedFields()
    begin
        CurrencyCodeTxt := GraphMgtGeneralTools.TranslateNAVCurrencyCodeToCurrencyCode(LCYCurrencyCode, Rec."Currency Code");
        PartialOrderShipping := (Rec."Shipping Advice" = Rec."Shipping Advice"::Partial);
    end;

    local procedure ClearCalculatedFields()
    begin
        Clear(DiscountAmountSet);
        Clear(InvoiceDiscountAmount);

        PartialOrderShipping := false;
        TempFieldBuffer.DeleteAll();
    end;


    local procedure CheckPermissions()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        if not SalesHeader.ReadPermission() then
            Error(SalesOrderPermissionsErr);

        HasWritePermission := SalesHeader.WritePermission();
    end;

}
