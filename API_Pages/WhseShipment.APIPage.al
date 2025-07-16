
page 50123 "API - Warehouse Shipments"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Warehouse Shipment';
    EntitySetCaption = 'Warehouse Shipments';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = true;
    EntityName = 'itemFulfillment';
    EntitySetName = 'itemFulfillments';
    InsertAllowed = true;
    ModifyAllowed = true;
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Warehouse Shipment Header";
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
                    Editable = false;
                }
                field(externalDocumentNumber; Rec."External Document No.")
                {
                    Caption = 'External Document No.';
                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }

                field(locationId; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }

                field(Status; Rec.Status)
                {
                    Caption = 'Status';
                    Editable = false;
                }
                field(assignedUser; Rec."Assigned User ID")
                {
                    Caption = 'Assigned User ID';
                }
                field(sortingMethod; Rec."Sorting Method")
                {
                    Caption = 'Sorting Method';
                }
                field(currencyCode; CurrencyCodeTxt)
                {
                    Caption = 'Currency Code';
                }

                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'Shipment Method Code';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }
                field(shippingAgentServiceCode; Rec."Shipping Agent Service Code")
                {
                    Caption = 'Shipping Agent Service Code';
                }
                field(orderType; Rec."Order Type Code")
                {
                    Caption = 'Order Type';
                }

                field(sentTo3PLDate; Rec."Sent to 3PL Date")
                {
                    Caption = 'Sent to 3PL Date';

                }
                field(sentTo3PL; Rec."Sent to 3PL")
                {
                    Caption = 'Sent to 3PL';

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
                field(storeFrontPaymentAuthcode; Rec."Store Front Payment Authcode")
                {
                    Caption = 'Store Front Payment Authcode';
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
                }
                part(salesShipmentLines; "API - Warehouse Shipment Lines")
                {
                    Caption = 'Lines';
                    EntityName = 'itemFulfillmentLine';
                    EntitySetName = 'itemFulfillmentLines';
                    SubPageLink = "No." = field("No.");
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }

                // part(dimensionSetLines; "APIV2 - Dimension Set Lines")
                // {
                //     Caption = 'Dimension Set Lines';
                //     EntityName = 'dimensionSetLine';
                //     EntitySetName = 'dimensionSetLines';
                //     SubPageLink = "Parent Id" = field(SystemId), "Parent Type" = const("Sales Shipment");
                // }
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

    trigger OnOpenPage()
    begin
    end;

    var
        CurrencyCodeTxt: Text;

    local procedure SetCalculatedFields()
    var
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        LCYCurrencyCode: Code[10];
    begin
        //CurrencyCodeTxt := GraphMgtGeneralTools.TranslateNAVCurrencyCodeToCurrencyCode(LCYCurrencyCode, Rec."Currency Code");
    end;
}