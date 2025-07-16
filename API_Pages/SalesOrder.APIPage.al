
page 50109 "API - Sales Orders"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Sales Order';
    EntitySetCaption = 'Sales Orders';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'alenSalesOrder';
    EntitySetName = 'alenSalesOrders';
    ODataKeyFields = Id;
    PageType = API;
    SourceTable = "Sales Order Entity Buffer";
    APIPublisher = 'HappiestMinds';
    APIGroup = 'AlenAPIS';
    Extensible = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.Id)
                {
                    Caption = 'Id';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(Id));
                    end;
                }
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("No."));
                    end;
                }
                field(externalDocumentNumber; Rec."External Document No.")
                {
                    Caption = 'External Document No.';

                    trigger OnValidate()
                    var
                        SalesHeader: Record "Sales Header";
                    begin
                        if Rec."External Document No." = '' then
                            Error(ExternalDocumentBlankErr);
                        SalesHeader.Reset();
                        SalesHeader.SetRange("External Document No.", Rec."External Document No.");
                        if SalesHeader.FindFirst() then
                            Error(ExternalDocumentAlreadyExistErr, SalesHeader."No.");
                        RegisterFieldSet(Rec.FieldNo("External Document No."))
                    end;
                }
                field(orderDate; Rec."Document Date")
                {
                    Caption = 'Order Date';

                    trigger OnValidate()
                    begin
                        DocumentDateVar := Rec."Document Date";
                        DocumentDateSet := true;

                        RegisterFieldSet(Rec.FieldNo("Document Date"));
                    end;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';

                    trigger OnValidate()
                    begin
                        PostingDateVar := Rec."Posting Date";
                        PostingDateSet := true;

                        RegisterFieldSet(Rec.FieldNo("Posting Date"));
                    end;
                }
                field(customerId; Rec."Customer Id")
                {
                    Caption = 'Customer Id';

                    trigger OnValidate()
                    begin
                        if not SellToCustomer.GetBySystemId(Rec."Customer Id") then
                            Error(CouldNotFindSellToCustomerErr);

                        Rec."Sell-to Customer No." := SellToCustomer."No.";
                        RegisterFieldSet(Rec.FieldNo("Customer Id"));
                        RegisterFieldSet(Rec.FieldNo("Sell-to Customer No."));
                    end;
                }

                field(customerNumber; Rec."Sell-to Customer No.")
                {
                    Caption = 'Customer No.';

                    trigger OnValidate()
                    begin
                        if SellToCustomer."No." <> '' then begin
                            if SellToCustomer."No." <> Rec."Sell-to Customer No." then
                                Error(SellToCustomerValuesDontMatchErr);
                            exit;
                        end;

                        if not SellToCustomer.Get(Rec."Sell-to Customer No.") then
                            Error(CouldNotFindSellToCustomerErr);

                        Rec."Customer Id" := SellToCustomer.SystemId;
                        RegisterFieldSet(Rec.FieldNo("Customer Id"));
                        RegisterFieldSet(Rec.FieldNo("Sell-to Customer No."));
                    end;
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
                field(billToCustomerId; Rec."Bill-to Customer Id")
                {
                    Caption = 'Bill-to Customer Id';

                    trigger OnValidate()
                    begin
                        if not BillToCustomer.GetBySystemId(Rec."Bill-to Customer Id") then
                            Error(CouldNotFindBillToCustomerErr);

                        Rec."Bill-to Customer No." := BillToCustomer."No.";
                        RegisterFieldSet(Rec.FieldNo("Bill-to Customer Id"));
                        RegisterFieldSet(Rec.FieldNo("Bill-to Customer No."));
                    end;
                }
                field(BillToOptions; Rec.BillToOptions)
                {
                    Caption = 'Bill-to';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(BillToOptions));
                    end;
                }
                field(billToCustomerNumber; Rec."Bill-to Customer No.")
                {
                    Caption = 'Bill-to Customer No.';

                    trigger OnValidate()
                    begin
                        // if BillToCustomer."No." <> '' then begin
                        //     if BillToCustomer."No." <> Rec."Bill-to Customer No." then
                        //         Error(BillToCustomerValuesDontMatchErr);
                        //     exit;
                        // end;

                        // if not BillToCustomer.Get(Rec."Bill-to Customer No.") then
                        //     Error(CouldNotFindBillToCustomerErr);

                        // Rec."Bill-to Customer Id" := BillToCustomer.SystemId;
                        RegisterFieldSet(Rec.FieldNo("Bill-to Customer Id"));
                        RegisterFieldSet(Rec.FieldNo("Bill-to Customer No."));
                    end;
                }
                field(shipToName; Rec."Ship-to Name")
                {
                    Caption = 'Ship-to Name';

                    trigger OnValidate()
                    begin
                        if xRec."Ship-to Name" <> Rec."Ship-to Name" then begin
                            Rec."Ship-to Code" := '';
                            RegisterFieldSet(Rec.FieldNo("Ship-to Code"));
                            RegisterFieldSet(Rec.FieldNo("Ship-to Name"));
                        end;
                    end;
                }
                field(shipToContact; Rec."Ship-to Contact")
                {
                    Caption = 'Ship-to Contact';

                    trigger OnValidate()
                    begin
                        if xRec."Ship-to Contact" <> Rec."Ship-to Contact" then begin
                            Rec."Ship-to Code" := '';
                            RegisterFieldSet(Rec.FieldNo("Ship-to Code"));
                            RegisterFieldSet(Rec.FieldNo("Ship-to Contact"));
                        end;
                    end;
                }
                field(sellToAddressLine1; Rec."Sell-to Address")
                {
                    Caption = 'Sell-to Address Line 1';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sell-to Address"));
                    end;
                }
                field(sellToAddressLine2; Rec."Sell-to Address 2")
                {
                    Caption = 'Sell-to Address Line 2';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sell-to Address 2"));
                    end;
                }
                field(sellToCity; Rec."Sell-to City")
                {
                    Caption = 'Sell-to City';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sell-to City"));
                    end;
                }
                field(sellToCountry; Rec."Sell-to Country/Region Code")
                {
                    Caption = 'Sell-to Country/Region Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sell-to Country/Region Code"));
                    end;
                }
                field(sellToState; Rec."Sell-to County")
                {
                    Caption = 'Sell-to State';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sell-to County"));
                    end;
                }
                field(sellToPostCode; Rec."Sell-to Post Code")
                {
                    Caption = 'Sell-to Post Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sell-to Post Code"));
                    end;
                }
                field(billToAddressLine1; Rec."Bill-to Address")
                {
                    Caption = 'Bill-to Address Line 1';
                    //Editable = false;
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bill-to Address"));
                    end;
                }
                field(billToAddressLine2; Rec."Bill-to Address 2")
                {
                    Caption = 'Bill-to Address Line 2';
                    //Editable = false;
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bill-to Address 2"));
                    end;
                }
                field(billToCity; Rec."Bill-to City")
                {
                    Caption = 'Bill-to City';
                    //Editable = false;
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bill-to City"));
                    end;
                }
                field(billToCountry; Rec."Bill-to Country/Region Code")
                {
                    Caption = 'Bill-to Country/Region Code';
                    //Editable = false;
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bill-to Country/Region Code"));
                    end;
                }
                field(billToState; Rec."Bill-to County")
                {
                    Caption = 'BillTo State';
                    //Editable = false;
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bill-to County"));
                    end;
                }
                field(billToPostCode; Rec."Bill-to Post Code")
                {
                    Caption = 'Bill-to Post Code';
                    //Editable = false;
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bill-to Post Code"));
                    end;
                }
                field(billToPhoneNo; Rec."Bill-to Phone No.")
                {
                    Caption = 'Bill-to Phone No.';
                    //Editable = false;
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Bill-to Phone No."));
                    end;
                }

                field(shipToAddressLine1; Rec."Ship-to Address")
                {
                    Caption = 'Ship-to Address Line 1';

                    trigger OnValidate()
                    begin
                        Rec."Ship-to Code" := '';
                        RegisterFieldSet(Rec.FieldNo("Ship-to Code"));
                        RegisterFieldSet(Rec.FieldNo("Ship-to Address"));
                    end;
                }

                field(shipToAddressLine2; Rec."Ship-to Address 2")
                {
                    Caption = 'Ship-to Address Line 2';

                    trigger OnValidate()
                    begin
                        Rec."Ship-to Code" := '';
                        RegisterFieldSet(Rec.FieldNo("Ship-to Code"));
                        RegisterFieldSet(Rec.FieldNo("Ship-to Address 2"));
                    end;
                }
                field(shipToCity; Rec."Ship-to City")
                {
                    Caption = 'Ship-to City';

                    trigger OnValidate()
                    begin
                        Rec."Ship-to Code" := '';
                        RegisterFieldSet(Rec.FieldNo("Ship-to Code"));
                        RegisterFieldSet(Rec.FieldNo("Ship-to City"));
                    end;
                }
                field(shipToCountry; Rec."Ship-to Country/Region Code")
                {
                    Caption = 'Ship-to Country/Region Code';

                    trigger OnValidate()
                    begin
                        Rec."Ship-to Code" := '';
                        RegisterFieldSet(Rec.FieldNo("Ship-to Code"));
                        RegisterFieldSet(Rec.FieldNo("Ship-to Country/Region Code"));
                    end;
                }
                field(shipToState; Rec."Ship-to County")
                {
                    Caption = 'Ship-to State';

                    trigger OnValidate()
                    begin
                        Rec."Ship-to Code" := '';
                        RegisterFieldSet(Rec.FieldNo("Ship-to Code"));
                        RegisterFieldSet(Rec.FieldNo("Ship-to County"));
                    end;
                }
                field(shipToPostCode; Rec."Ship-to Post Code")
                {
                    Caption = 'Ship-to Post Code';

                    trigger OnValidate()
                    begin
                        Rec."Ship-to Code" := '';
                        RegisterFieldSet(Rec.FieldNo("Ship-to Code"));
                        RegisterFieldSet(Rec.FieldNo("Ship-to Post Code"));
                    end;
                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shortcut Dimension 1 Code"));
                    end;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shortcut Dimension 2 Code"));
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
                field(pricesIncludeTax; Rec."Prices Including VAT")
                {
                    Caption = 'Prices Include Tax';

                    trigger OnValidate()
                    var
                        SalesLine: Record "Sales Line";
                    begin
                        if Rec."Prices Including VAT" then begin
                            SalesLine.SetRange("Document No.", Rec."No.");
                            SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                            if SalesLine.FindFirst() then
                                if SalesLine."VAT Calculation Type" = SalesLine."VAT Calculation Type"::"Sales Tax" then
                                    Error(CannotEnablePricesIncludeTaxErr);
                        end;
                        RegisterFieldSet(Rec.FieldNo("Prices Including VAT"));
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
                field(salesperson; Rec."Salesperson Code")
                {
                    Caption = 'Salesperson';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Salesperson Code"));
                    end;
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    AccessByPermission = TableData "Shipping Agent Services" = R;
                    Caption = 'Shipping Agent Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shipping Agent Code"));
                    end;
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Shipping Agent Service Code"));
                    end;
                }
                field(paymentMethod; Rec."Payment Method Code")
                {
                    Caption = 'Payment Method Code';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Payment Method Code"));
                    end;
                }
                field(partialShipping; PartialOrderShipping)
                {
                    Caption = 'Partial Shipping';

                    trigger OnValidate()
                    begin
                        ProcessPartialShipping();
                    end;
                }
                field(requestedDeliveryDate; Rec."Requested Delivery Date")
                {
                    Caption = 'Requested Delivery Date';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Requested Delivery Date"));
                    end;
                }

                field(orderTotalCheck; Rec."Order Total Check")
                {
                    Caption = 'Order Total Check';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Order Total Check"));
                    end;
                }
                field(orderTotalVariance; Rec."Order Total Variance")
                {
                    Caption = 'Order Total Variance';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Order Total Variance"));
                    end;
                }
                field("memo"; Rec."memo")
                {
                    ApplicationArea = All;
                    Caption = 'Memo';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("memo"));
                    end;
                }
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Vendor_Number"));
                    end;
                }
                field("shippingAddress_attention"; Rec."shippingAddress_attention")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Address Attention';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("shippingAddress_attention"));
                    end;
                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Store_number"));
                    end;
                }
                field("Dealer_Department_Number"; Rec."Dealer_Department_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Number';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Dealer_Department_Number"));
                    end;
                }
                field("Dealer_Department_Description"; Rec."Dealer_Department_Description")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Description';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Dealer_Department_Description"));
                    end;
                }
                field("Standard_Carrier_Alpha_Code"; Rec."Standard_Carrier_Alpha_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Carrier Alpha Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Standard_Carrier_Alpha_Code"));
                    end;
                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("FOB_Qualifier"));
                    end;
                }
                field("Carrier_Transportation_Method_Code"; Rec."Transportation_Method_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Carrier Transportation Method Code';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Transportation_Method_Code"));
                    end;
                }
                field("Transaction_ID"; Rec."Transaction_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Transaction_ID"));
                    end;
                }
                field("discountItem_intID"; Rec."discountItem_intID")
                {
                    ApplicationArea = All;
                    Caption = 'Discount Item - intID';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("discountItem_intID"));
                    end;
                }
                field("Customer_Account_Number"; Rec."Customer_Account_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Account Number';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Customer_Account_Number"));
                    end;
                }
                field("Special_Instructions"; Rec."Special_Instructions")
                {
                    ApplicationArea = All;
                    Caption = 'Special Instructions';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Special_Instructions"));
                    end;
                }
                field("Customer_Order_Number"; Rec."Customer_Order_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Order Number';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Customer_Order_Number"));
                    end;
                }
                field("Release_No"; Rec."Release_No")
                {
                    ApplicationArea = All;
                    Caption = 'Release No';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Release_No"));
                    end;
                }
                field("Ship_To_Code_Qualifier"; Rec."Ship_To_Code_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'Ship To Code Qualifier';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Ship_To_Code_Qualifier"));
                    end;
                }
                field("Requested_Ship_Date"; Rec."Requested_Ship_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Ship Date';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Requested_Ship_Date"));
                    end;
                }
                field("Current_Scheduled_Delivery"; Rec."Current_Scheduled_Delivery")
                {
                    ApplicationArea = All;
                    Caption = 'Current Scheduled Delivery';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Current_Scheduled_Delivery"));
                    end;
                }
                field("Requested_PickUp_Date"; Rec."Requested_PickUp_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Pick Up Date';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Requested_PickUp_Date"));
                    end;
                }
                field("Packaging_Type"; Rec."Packaging_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Packaging Type';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Packaging_Type"));
                    end;
                }
                field("Total_Packages"; Rec."Total_Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Total Packages';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Total_Packages"));
                    end;
                }
                field("PKG_PLT_Qty"; Rec."PKG_PLT_Qty")
                {
                    ApplicationArea = All;
                    Caption = 'PKG PLT Qty';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("PKG_PLT_Qty"));
                    end;
                }
                field("Marketplace_Shipment_ID"; Rec."Marketplace_Shipment_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Marketplace Shipment ID';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Marketplace_Shipment_ID"));
                    end;
                }
                field("824_Received"; Rec."824_Received")
                {
                    ApplicationArea = All;
                    Caption = '824 Received';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("824_Received"));
                    end;
                }
                field("824_Notes"; Rec."824_Notes")
                {
                    ApplicationArea = All;
                    Caption = '824 Notes';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("824_Notes"));
                    end;
                }
                field("Routing_Request_Sent"; Rec."Routing_Request_Sent")
                {
                    ApplicationArea = All;
                    Caption = 'Routing Request Sent';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Routing_Request_Sent"));
                    end;
                }
                field("Processed"; Rec."Processed")
                {
                    ApplicationArea = All;
                    Caption = 'Processed';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Processed"));
                    end;
                }
                field("Supplier_Contact_Name"; Rec."Supplier_Contact_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Name';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Supplier_Contact_Name"));
                    end;
                }
                field("Supplier_Contact_No"; Rec."Supplier_Contact_No")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact No.';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Supplier_Contact_No"));
                    end;
                }
                field("Supplier_Contact_Email"; Rec."Supplier_Contact_Email")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Email';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Supplier_Contact_Email"));
                    end;
                }
                field(shipFrom; Rec."Ship From")
                {
                    Caption = 'Ship From';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Ship From"));
                    end;
                }
                field(thirdPartyBillingAccount; Rec."3rd Party Billing Account")
                {
                    Caption = '3rd Party Billing Account';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("3rd Party Billing Account"));
                    end;
                }
                field(thirdPartyZip; Rec."3rd Party Zip")
                {
                    Caption = '3rd Party Zip';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("3rd Party Zip"));
                    end;
                }
                field(thirdPartyCarrier; Rec."3rd Party Carrier")
                {
                    Caption = '3rd Party Carrier';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("3rd Party Carrier"));
                    end;
                }

                field(isShipResidential; Rec.isShipresidential)
                {
                    Caption = 'Is Ship Residential';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo(isShipresidential));
                    end;
                }
                part(dimensionSetLines; "APIV2 - Dimension Set Lines")
                {
                    Caption = 'Dimension Set Lines';
                    EntityName = 'dimensionSetLine';
                    EntitySetName = 'dimensionSetLines';
                    SubPageLink = "Parent Id" = field(Id), "Parent Type" = const("Sales Order");
                }
                part(salesOrderLines; "API - Sales Order Lines")
                {
                    Caption = 'Lines';
                    EntityName = 'salesItemList';
                    EntitySetName = 'salesItemList';
                    SubPageLink = "Document Id" = field(Id);
                }
                field(discountAmount; Rec."Invoice Discount Amount")
                {
                    Caption = 'Discount Amount';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Invoice Discount Amount"));
                        InvoiceDiscountAmount := Rec."Invoice Discount Amount";
                        DiscountAmountSet := true;
                    end;
                }
                field(discountAppliedBeforeTax; Rec."Discount Applied Before Tax")
                {
                    Caption = 'Discount Applied Before Tax';
                    Editable = false;
                }
                field(totalAmountExcludingTax; Rec.Amount)
                {
                    Caption = 'Total Amount Excluding Tax';
                    Editable = false;
                }
                field(orderTotalTax; Rec."Order Total Tax")
                {
                    Caption = 'Order Total Tax';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Order Total Tax"));
                    end;
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

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Amount Including VAT"));
                    end;
                }
                field(fullyShipped; Rec."Completely Shipped")
                {
                    Caption = 'Fully Shipped';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Completely Shipped"));
                    end;
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    Editable = false;
                }

                field(phoneNumber; Rec."Sell-to Phone No.")
                {
                    Caption = 'Phone No.';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sell-to Phone No."));
                    end;
                }
                field(email; Rec."Sell-to E-Mail")
                {
                    Caption = 'Email';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Sell-to E-Mail"));
                    end;
                }
                field(poNumber; Rec."Your Reference")
                {
                    Caption = 'Your Reference';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Your Reference"));
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
                field(orderDiscountDetails; Rec."Order Discount Details")
                {
                    Caption = 'Order Discount Details';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Order Discount Details"));
                    end;
                }
                field(orderType; Rec."Order Type Code")
                {
                    Caption = 'Order Type';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Order Type Code"));
                    end;
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

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("All Items Fully Commited"));
                    end;
                }
                field(orderSource; Rec."Order Source")
                {
                    Caption = 'Order Source';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Order Source"));
                    end;
                }
                field(storeFrontName; Rec."Storefront Name")
                {
                    Caption = 'Storefront Name';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Storefront Name"));
                    end;
                }
                field(storeFrontPaymentStatus; Rec."Store Front Payment Status")
                {
                    Caption = 'Store Front Payment Status';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Store Front Payment Status"));
                    end;
                }
                field(storeFrontPaymentGateway; Rec."Store Front Payment Gateway")
                {

                    Caption = 'Store Front Payment Gateway';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Store Front Payment Gateway"));
                    end;
                }
                field(storeFrontPaymentEventType; Rec."Store Front Payment Event Type")
                {
                    Caption = 'Store Front Payment Event Type';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Store Front Payment Event Type"));
                    end;
                }
                field(storeFrontPaymentAuthcode; Rec."Store Front Payment Authcode")
                {
                    Caption = 'Store Front Payment Authcode';
                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Store Front Payment Authcode"));
                    end;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }
                part(attachments; "APIV2 - Attachments")
                {
                    Caption = 'Attachments';
                    EntityName = 'attachment';
                    EntitySetName = 'attachments';
                    SubPageLink = "Document Id" = field(Id), "Document Type" = const("Sales Order");
                }
                part(documentAttachments; "APIV2 - Document Attachments")
                {
                    Caption = 'Document Attachments';
                    EntityName = 'documentAttachment';
                    EntitySetName = 'documentAttachments';
                    SubPageLink = "Document Id" = field(Id), "Document Type" = const("Sales Order");
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
        if HasWritePermission then
            GraphMgtSalesOrderBuffer.RedistributeInvoiceDiscounts(Rec);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        GraphMgtSalesOrderBuffer.PropagateOnDelete(Rec);

        exit(false);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        SalesHeader: Record "Sales Header";
        SalesHeader2: Record "Sales Header";
        custombillto: Record "Custom Bill To Address";
        LocCode: Code[10];
        yourReference: Text[35];
        taxareaCode: Code[20];
        paymentMethodCode: Code[10];
        shippingagentCode: Code[10];
        shippingAgentServiceCode: Code[10];
        taxliable: Boolean;
        orderTotalTax: Decimal;
    begin
        LocCode := Rec."Location Code";
        yourReference := Rec."Your Reference";
        taxareaCode := Rec."Tax Area Code";
        paymentMethodCode := Rec."Payment Method Code";
        shippingagentCode := Rec."Shipping Agent Code";
        shippingAgentServiceCode := Rec."Shipping Agent Service Code";
        taxliable := Rec."Tax Liable";
        orderTotalTax := Rec."Order Total Tax";
        if Rec.BillToOptions = Rec.BillToOptions::"Custom Address" then begin
            custombillto.DeleteAll();
            custombillto.Init();
            custombillto."Document Type" := custombillto."Document Type"::Order;
            custombillto."Document No." := Rec."No.";
            custombillto.billtooptions := Rec.BillToOptions;
            custombillto.BilltoAdd1 := Rec."Bill-to Address";
            custombillto.BilltoAdd2 := Rec."Bill-to Address 2";
            custombillto.billtoPostCode := Rec."Bill-to Post Code";
            custombillto.billtoCity := Rec."Bill-to City";
            custombillto.billtoCountryRegionCode := Rec."Bill-to Country/Region Code";
            custombillto.billtoCounty := Rec."Bill-to County";
            custombillto.Insert();

        end;

        CheckSellToCustomerSpecified();

        GraphMgtSalesOrderBuffer.PropagateOnInsert(Rec, TempFieldBuffer);


        SetDates();

        UpdateDiscount();

        SetCalculatedFields();
        if custombillto.BillToOptions = custombillto.BillToOptions::"Custom Address" then begin
            //Error('-%1 and %2 and %3 and %4', custombillto."Document No.", custombillto.BillToOptions, custombillto.BilltoAdd1, custombillto.billtoPostCode);
            Rec."Bill-to Address" := custombillto.BilltoAdd1;
            Rec."Bill-to Address 2" := custombillto.BilltoAdd2;
            Rec."Bill-to Post Code" := custombillto.billtoPostCode;
            Rec."Bill-to Country/Region Code" := custombillto.billtoCountryRegionCode;
            Rec."Bill-to City" := custombillto.billtoCity;
            Rec."Bill-to County" := custombillto.billtoCounty;
            SalesHeader.Get(SalesHeader."Document Type"::Order, Rec."No.");
            SalesHeader."Bill-to Address" := custombillto.BilltoAdd1;
            SalesHeader."Bill-to Address 2" := custombillto.BilltoAdd2;
            SalesHeader."Bill-to Post Code" := custombillto.billtoPostCode;
            SalesHeader."Bill-to Country/Region Code" := custombillto.billtoCountryRegionCode;
            SalesHeader."Bill-to City" := custombillto.billtoCity;
            SalesHeader."Bill-to County" := custombillto.billtoCounty;
            SalesHeader."Location Code" := LocCode;
            SalesHeader."Your Reference" := yourReference;
            SalesHeader."Tax Area Code" := taxareaCode;
            SalesHeader."Payment Method Code" := paymentMethodCode;
            SalesHeader."Shipping Agent Code" := shippingagentCode;
            SalesHeader."Shipping Agent Service Code" := shippingAgentServiceCode;
            SalesHeader."Tax Liable" := taxliable;
            SalesHeader."Order Total Tax" := orderTotalTax;
            SalesHeader.modify;

        end;
        SalesHeader2.Reset();
        if SalesHeader2.Get(SalesHeader2."Document Type"::Order, Rec."No.") then begin
            SalesHeader2."Location Code" := LocCode;
            SalesHeader2."Your Reference" := yourReference;
            SalesHeader2."Tax Area Code" := taxareaCode;
            SalesHeader2."Payment Method Code" := paymentMethodCode;
            SalesHeader2."Shipping Agent Code" := shippingagentCode;
            SalesHeader2."Shipping Agent Service Code" := shippingAgentServiceCode;
            SalesHeader2."Tax Liable" := taxliable;
            SalesHeader2."Order Total Tax" := orderTotalTax;
            SalesHeader2.Modify(false);
        end;
        custombillto.DeleteAll();
        Rec."Location Code" := LocCode;
        Rec."Your Reference" := yourReference;
        Rec."Tax Area Code" := taxareaCode;
        Rec."Payment Method Code" := paymentMethodCode;
        Rec."Shipping Agent Code" := shippingagentCode;
        Rec."Shipping Agent Service Code" := shippingAgentServiceCode;
        Rec."Tax Liable" := taxliable;
        Rec."Order Total Tax" := orderTotalTax;
        Rec.Modify();
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        SalesHeader: Record "Sales Header";
    begin
        if xRec.Id <> Rec.Id then
            Error(CannotChangeIDErr);

        GraphMgtSalesOrderBuffer.PropagateOnModify(Rec, TempFieldBuffer);
        UpdateDiscount();

        SetCalculatedFields();

        // if Rec.BillToOptions = Rec.BillToOptions::"Custom Address" then begin
        //     SalesHeader.Get(SalesHeader."Document Type"::Order, Rec."No.");
        //     SalesHeader."Bill-to Address" := Rec."Bill-to Address";
        //     SalesHeader."Bill-to Address 2" := Rec."Bill-to Address 2";
        //     SalesHeader."Bill-to Post Code" := Rec."Bill-to Post Code";
        //     SalesHeader."Bill-to Country/Region Code" := Rec."Bill-to Country/Region Code";
        //     SalesHeader."Bill-to City" := Rec."Bill-to City";
        //     SalesHeader."Bill-to County" := Rec."Bill-to County";
        //     SalesHeader.modify;
        // end;
        exit(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        SalesHeader: Record "Sales Header";
    begin
        ClearCalculatedFields();

        // if Rec.BillToOptions = Rec.BillToOptions::"Custom Address" then begin
        //     SalesHeader.Get(SalesHeader."Document Type"::Order, Rec."No.");
        //     SalesHeader."Bill-to Address" := Rec."Bill-to Address";
        //     SalesHeader."Bill-to Address 2" := Rec."Bill-to Address 2";
        //     SalesHeader."Bill-to Post Code" := Rec."Bill-to Post Code";
        //     SalesHeader."Bill-to Country/Region Code" := Rec."Bill-to Country/Region Code";
        //     SalesHeader."Bill-to City" := Rec."Bill-to City";
        //     SalesHeader."Bill-to County" := Rec."Bill-to County";
        //     SalesHeader.modify;
        // end;
    end;

    trigger OnOpenPage()
    begin
        CheckPermissions();
    end;

    var
        TempFieldBuffer: Record "Field Buffer" temporary;
        SellToCustomer: Record "Customer";
        BillToCustomer: Record "Customer";
        Currency: Record "Currency";
        PaymentTerms: Record "Payment Terms";
        ShipmentMethod: Record "Shipment Method";
        GraphMgtSalesOrderBuffer: Codeunit "Graph Mgt - Sales Order Buffer";
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        APIV2SendSalesDocument: Codeunit "APIV2 - Send Sales Document";
        LCYCurrencyCode: Code[10];
        zc: Record "Post Code";
        CurrencyCodeTxt: Text;
        CannotChangeIDErr: Label 'The "id" cannot be changed.', Comment = 'id is a field name and should not be translated.';
        SellToCustomerNotProvidedErr: Label 'A "customerNumber" or a "customerId" must be provided.', Comment = 'customerNumber and customerId are field names and should not be translated.';
        SellToCustomerValuesDontMatchErr: Label 'The sell-to customer values do not match to a specific Customer.';
        BillToCustomerValuesDontMatchErr: Label 'The bill-to customer values do not match to a specific Customer.';
        CouldNotFindSellToCustomerErr: Label 'The sell-to customer cannot be found.';
        CouldNotFindBillToCustomerErr: Label 'The bill-to customer cannot be found.';
        PartialOrderShipping: Boolean;
        SalesOrderPermissionsErr: Label 'You do not have permissions to read Sales Orders.';
        CurrencyValuesDontMatchErr: Label 'The currency values do not match to a specific Currency.';
        CurrencyIdDoesNotMatchACurrencyErr: Label 'The "currencyId" does not match to a Currency.', Comment = 'currencyId is a field name and should not be translated.';
        CurrencyCodeDoesNotMatchACurrencyErr: Label 'The "currencyCode" does not match to a Currency.', Comment = 'currencyCode is a field name and should not be translated.';
        PaymentTermsIdDoesNotMatchAPaymentTermsErr: Label 'The "paymentTermsId" does not match to a Payment Terms.', Comment = 'paymentTermsId is a field name and should not be translated.';
        ExternalDocumentBlankErr: Label '"externalDocumentNumber" cannot be empty. Shopify or Marketplace Order should be filled here.', Comment = 'externalDocumentNumber is a field name and should not be translated.';
        ExternalDocumentAlreadyExistErr: Label '"externalDocumentNumber" already exist in BC with Sales Order No. %1 .', Comment = 'externalDocumentNumber is a field name and should not be translated.';
        ShipmentMethodIdDoesNotMatchAShipmentMethodErr: Label 'The "shipmentMethodId" does not match to a Shipment Method.', Comment = 'shipmentMethodId is a field name and should not be translated.';
        CannotFindOrderErr: Label 'The order cannot be found.';
        CannotEnablePricesIncludeTaxErr: Label 'The "pricesIncludeTax" cannot be set to true if VAT Calculation Type is Sales Tax.', Comment = 'pricesIncludeTax is a field name and should not be translated.';
        DiscountAmountSet: Boolean;
        InvoiceDiscountAmount: Decimal;
        BlankGUID: Guid;
        DocumentDateSet: Boolean;
        DocumentDateVar: Date;
        PostingDateSet: Boolean;
        PostingDateVar: Date;
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

    local procedure RegisterFieldSet(FieldNo: Integer)
    var
        LastOrderNo: Integer;
    begin
        LastOrderNo := 1;
        if TempFieldBuffer.FindLast() then
            LastOrderNo := TempFieldBuffer.Order + 1;

        Clear(TempFieldBuffer);
        TempFieldBuffer.Order := LastOrderNo;
        TempFieldBuffer."Table ID" := Database::"Sales Invoice Entity Aggregate";
        TempFieldBuffer."Field ID" := FieldNo;
        TempFieldBuffer.Insert();
    end;

    local procedure CheckSellToCustomerSpecified()
    begin
        if (Rec."Sell-to Customer No." = '') and
           (Rec."Customer Id" = BlankGUID)
        then
            Error(SellToCustomerNotProvidedErr);
    end;

    local procedure ProcessPartialShipping()
    begin
        if PartialOrderShipping then
            Rec."Shipping Advice" := Rec."Shipping Advice"::Partial
        else
            Rec."Shipping Advice" := Rec."Shipping Advice"::Complete;

        RegisterFieldSet(Rec.FieldNo("Shipping Advice"));
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

    local procedure UpdateDiscount()
    var
        SalesHeader: Record "Sales Header";
        SalesCalcDiscountByType: Codeunit "Sales - Calc Discount By Type";
    begin
        if not DiscountAmountSet then begin
            GraphMgtSalesOrderBuffer.RedistributeInvoiceDiscounts(Rec);
            exit;
        end;

        SalesHeader.Get(SalesHeader."Document Type"::Order, Rec."No.");
        SalesCalcDiscountByType.ApplyInvDiscBasedOnAmt(InvoiceDiscountAmount, SalesHeader);
    end;

    local procedure SetDates()
    begin
        if not (DocumentDateSet or PostingDateSet) then
            exit;

        TempFieldBuffer.Reset();
        TempFieldBuffer.DeleteAll();

        if DocumentDateSet then begin
            Rec."Document Date" := DocumentDateVar;
            RegisterFieldSet(Rec.FieldNo("Document Date"));
        end;

        if PostingDateSet then begin
            Rec."Posting Date" := PostingDateVar;
            RegisterFieldSet(Rec.FieldNo("Posting Date"));
        end;

        GraphMgtSalesOrderBuffer.PropagateOnModify(Rec, TempFieldBuffer);
        Rec.Find();
    end;

    local procedure GetOrder(var SalesHeader: Record "Sales Header")
    begin
        if not SalesHeader.GetBySystemId(Rec.Id) then
            Error(CannotFindOrderErr);
    end;

    local procedure PostWithShipAndInvoice(var SalesHeader: Record "Sales Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"): Boolean
    var
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        OrderNo: Code[20];
        OrderNoSeries: Code[20];
    begin
        APIV2SendSalesDocument.CheckDocumentIfNoItemsExists(SalesHeader);
        LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(SalesHeader);
        OrderNo := SalesHeader."No.";
        OrderNoSeries := SalesHeader."No. Series";
        SalesHeader.Ship := true;
        SalesHeader.Invoice := true;
        SalesHeader.SendToPosting(Codeunit::"Sales-Post");
        SalesInvoiceHeader.SetCurrentKey("Order No.");
        SalesInvoiceHeader.SetRange("Pre-Assigned No. Series", '');
        SalesInvoiceHeader.SetRange("Order No. Series", OrderNoSeries);
        SalesInvoiceHeader.SetRange("Order No.", OrderNo);
        exit(SalesInvoiceHeader.FindFirst());
    end;

    local procedure SetActionResponse(var ActionContext: WebServiceActionContext; DocumentId: Guid; ObjectId: Integer; ResultCode: WebServiceActionResultCode)
    begin
        ActionContext.SetObjectType(ObjectType::Page);
        ActionContext.SetObjectId(ObjectId);
        ActionContext.AddEntityKey(Rec.FieldNo(Id), DocumentId);
        ActionContext.SetResultCode(ResultCode);
    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure ShipAndInvoice(var ActionContext: WebServiceActionContext)
    var
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceAggregator: Codeunit "Sales Invoice Aggregator";
        Invoiced: Boolean;
    begin
        GetOrder(SalesHeader);
        Invoiced := PostWithShipAndInvoice(SalesHeader, SalesInvoiceHeader);
        if Invoiced then
            SetActionResponse(ActionContext, SalesInvoiceAggregator.GetSalesInvoiceHeaderId(SalesInvoiceHeader), Page::"APIV2 - Sales Invoices", WebServiceActionResultCode::Deleted)
        else
            SetActionResponse(ActionContext, SalesHeader.SystemId, Page::"APIV2 - Sales Orders", WebServiceActionResultCode::Updated);
    end;

    [ServiceEnabled]
    [Scope('Cloud')]
    procedure release(var ActionContext: WebServiceActionContext)
    var
        SalesHeader: Record "Sales Header";
        Released: Boolean;
    begin
        GetOrder(SalesHeader);
        SalesHeader.Get(SalesHeader."Document Type"::Order, Rec."No.");
        Released := CODEUNIT.Run(CODEUNIT::"Release Sales Document", SalesHeader);
        // Invoiced := PostWithShipAndInvoice(SalesHeader, SalesInvoiceHeader);
        if Released then
            SetActionResponse(ActionContext, SalesHeader.SystemId, Page::"API - Sales Orders", WebServiceActionResultCode::Updated);
    end;
}


















