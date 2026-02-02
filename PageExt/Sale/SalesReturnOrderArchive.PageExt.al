pageextension 50127 "Sales Return Order Archive Ext" extends "Sales Return Order Archive"
{
    layout
    {

        addlast(General)
        {
            field("Order Type Code"; Rec."Order Type Code")
            {
                ApplicationArea = All;
                Caption = 'Order Type Code';
                TableRelation = "Order Type".Code;
                Editable = false;
                ToolTip = 'ALN - Specifies the type of order for this sales return.';
            }
            // field("Shopify Variant Id"; Rec."Shopify Variant Id")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Shopify Variant Id';
            // }
            field("Sent to 3PL Date"; Rec."Sent to 3PL Date")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL Date';
                Editable = false;
                ToolTip = 'ALN - Specifies the date when the sales return was sent to the third-party logistics provider (3PL).';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
                Editable = false;
                ToolTip = 'ALN - Indicates whether the sales return has been sent to the third-party logistics provider (3PL).';
            }
            field("All Items Fully Commited"; Rec."All Items Fully Commited")
            {
                ApplicationArea = All;
                Caption = 'All Items Fully Commited';
                Editable = false;
                ToolTip = 'ALN - Indicates whether all items in the sales return have been fully committed.';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Caption = 'Order Source';
                TableRelation = "Order Source".Code;
                Editable = false;
                ToolTip = 'ALN - Specifies the source of the order associated with the sales return.';
            }
            field("Storefront Name"; Rec."Storefront Name")
            {
                ApplicationArea = All;
                Caption = 'Storefront Name';
                Editable = false;
                ToolTip = 'ALN - Specifies the name of the storefront associated with the sales return.';
            }
            field("Store Front Payment Status"; Rec."Store Front Payment Status")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Status';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment status for the store front associated with the sales return.';

            }
            field("Store Front Payment Gateway"; Rec."Store Front Payment Gateway")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Gateway';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment gateway used for the store front associated with the sales return.';

            }
            field("Store Front Payment Event Type"; Rec."Store Front Payment Event Type")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Event Type';
                Editable = false;
                ToolTip = 'ALN - Specifies the payment event type for the store front associated with the sales return.';
            }
            field("Store Front Payment Authcode"; Rec."Store Front Payment Authcode")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Authcode';
                Editable = false;
                ToolTip = 'ALN - Specifies the authorization code for the store front payment associated with the sales return.';
            }
            field("Order Total Check"; Rec."Order Total Check")
            {
                ApplicationArea = All;
                Caption = 'Order Total Check';
                Editable = false;
                ToolTip = 'ALN - Specifies the check for the total amount of the sales return order.';
            }
            field("Order Total Variance"; Rec."Order Total Variance")
            {
                ApplicationArea = All;
                Caption = 'Order Total Variance';
                Editable = false;
                ToolTip = 'ALN - Specifies the variance in the total amount of the sales return order.';
            }

        }
        addafter("Invoice Details")
        {
            group("Marketplace Details")
            {
                Caption = 'Marketplace Details';
                field("memo"; Rec."memo")
                {
                    ApplicationArea = All;
                    Caption = 'Memo';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the memo or additional information related to the sales return.';
                }
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the vendor number associated with the sales return.';
                    Editable = false;
                }
                field("shippingAddress_attention"; Rec."shippingAddress_attention")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Address Attention';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the attention line for the shipping address of the sales return.';
                    Editable = false;
                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the store number associated with the sales return.';
                    Editable = false;
                }
                field("Dealer_Department_Number"; Rec."Dealer_Department_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the dealer department number associated with the sales return.';
                    Editable = false;
                }
                field("Dealer_Department_Description"; Rec."Dealer_Department_Description")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Description';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the description of the dealer department associated with the sales return.';
                    Editable = false;
                }
                field("Standard_Carrier_Alpha_Code"; Rec."Standard_Carrier_Alpha_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Carrier Alpha Code';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the standard carrier alpha code for the sales return.';
                    Editable = false;
                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the Free On Board (FOB) qualifier for the sales return.';
                    Editable = false;
                }
                field("Carrier_Transportation_Method_Code"; Rec."Transportation_Method_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Carrier Transportation Method Code';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the transportation method code used by the carrier for the sales return.';
                    Editable = false;
                }
                field("Transaction_ID"; Rec."Transaction_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the transaction ID associated with the sales return.';
                    Editable = false;
                }
                field("discountItem_intID"; Rec."discountItem_intID")
                {
                    ApplicationArea = All;
                    Caption = 'Discount Item - intID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the internal ID of the discount item associated with the sales return.';
                    Editable = false;
                }
                field("Customer_Account_Number"; Rec."Customer_Account_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Account Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the customer account number associated with the sales return.';
                    Editable = false;
                }
                field("Special_Instructions"; Rec."Special_Instructions")
                {
                    ApplicationArea = All;
                    Caption = 'Special Instructions';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies any special instructions related to the sales return.';
                    Editable = false;
                }
                field("Customer_Order_Number"; Rec."Customer_Order_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Order Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the customer order number associated with the sales return.';
                    Editable = false;
                }
                field("Release_No"; Rec."Release_No")
                {
                    ApplicationArea = All;
                    Caption = 'Release No';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the release number associated with the sales return.';
                    Editable = false;
                }
                field("Ship_To_Code_Qualifier"; Rec."Ship_To_Code_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'Ship To Code Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the ship-to code qualifier for the sales return.';
                    Editable = false;
                }
                field("Requested_Ship_Date"; Rec."Requested_Ship_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Ship Date';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the requested ship date for the sales return.';
                    Editable = false;
                }
                field("Current_Scheduled_Delivery"; Rec."Current_Scheduled_Delivery")
                {
                    ApplicationArea = All;
                    Caption = 'Current Scheduled Delivery';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the current scheduled delivery date for the sales return.';
                    Editable = false;
                }
                field("Requested_PickUp_Date"; Rec."Requested_PickUp_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Pick Up Date';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the requested pick-up date for the sales return.';
                    Editable = false;
                }
                field("Packaging_Type"; Rec."Packaging_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Packaging Type';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the type of packaging used for the sales return.';
                    Editable = false;
                }
                field("Total_Packages"; Rec."Total_Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Total Packages';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the total number of packages in the sales return.';
                    Editable = false;
                }
                field("PKG_PLT_Qty"; Rec."PKG_PLT_Qty")
                {
                    ApplicationArea = All;
                    Caption = 'PKG PLT Qty';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the quantity of packages on a pallet for the sales return.';
                    Editable = false;
                }
                field("Marketplace_Shipment_ID"; Rec."Marketplace_Shipment_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Marketplace Shipment ID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the ID of the marketplace shipment associated with the sales return.';
                    Editable = false;
                }
                field("824_Received"; Rec."824_Received")
                {
                    ApplicationArea = All;
                    Caption = '824 Received';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates whether the 824 transaction set has been received for the sales return.';
                    Editable = false;
                }
                field("824_Notes"; Rec."824_Notes")
                {
                    ApplicationArea = All;
                    Caption = '824 Notes';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies any notes related to the 824 transaction set for the sales return.';
                    Editable = false;
                }
                field("Routing_Request_Sent"; Rec."Routing_Request_Sent")
                {
                    ApplicationArea = All;
                    Caption = 'Routing Request Sent';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates whether a routing request has been sent for the sales return.';
                    Editable = false;
                }
                field("Processed"; Rec."Processed")
                {
                    ApplicationArea = All;
                    Caption = 'Processed';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates whether the sales return has been processed.';
                    Editable = false;
                }
                field("Supplier_Contact_Name"; Rec."Supplier_Contact_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Name';
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'ALN - Specifies the name of the supplier contact associated with the sales return.';
                }
                field("Supplier_Contact_No"; Rec."Supplier_Contact_No")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact No.';
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'ALN - Specifies the contact number of the supplier associated with the sales return.';
                }
                field("Supplier_Contact_Email"; Rec."Supplier_Contact_Email")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Email';
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'ALN - Specifies the email address of the supplier contact associated with the sales return.';
                }
                field("Ship From"; Rec."Ship From")
                {
                    ApplicationArea = All;
                    Caption = 'Ship From';
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'ALN - Specifies the location from which the sales return is shipped.';

                }
                field("3rd Party Billing Account"; Rec."3rd Party Billing Account")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Billing Account';
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'ALN - Specifies the third-party billing account associated with the sales return.';
                }
                field("3rd Party Carrier"; Rec."3rd Party Carrier")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Carrier';
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'ALN - Specifies the third-party carrier used for the sales return.';
                }
                field("3rd Party Zip"; Rec."3rd Party Zip")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Zip';
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'ALN - Specifies the zip code for the third-party carrier associated with the sales return.';
                }

                field(isShipresidential; Rec.isShipresidential)
                {
                    ApplicationArea = All;
                    Caption = 'Is Ship Residential';
                    Importance = Standard;
                    Editable = false;
                    ToolTip = 'ALN - Indicates whether the shipping address for the sales return is residential.';
                }
            }
            field(CarrierPRONumber; Rec.CarrierPRONumber)
            {
                ApplicationArea = All;
                Caption = 'Carrier PRO Number';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the Carrier PRO Number for the shipment.';
            }
            field(BillofLading; Rec.BillofLading)
            {
                ApplicationArea = All;
                Caption = 'Bill of Lading';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the Bill of Lading for the shipment.';
            }

        }


    }
}