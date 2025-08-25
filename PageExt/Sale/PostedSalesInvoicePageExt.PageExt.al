pageextension 50105 "Posted Sales Invoice Page Ext" extends "Posted Sales Invoice"
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
                ToolTip = 'ALN - Specifies the order type code for the sales invoice.';
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
                ToolTip = 'ALN - Specifies the date when the sales invoice was sent to the 3PL.';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
                ToolTip = 'ALN - Specifies whether the sales invoice has been sent to the 3PL.';
            }
            field("All Items Fully Commited"; Rec."All Items Fully Commited")
            {
                ApplicationArea = All;
                Caption = 'All Items Fully Commited';
                ToolTip = 'ALN - Specifies whether all items in the sales invoice are fully committed.';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Caption = 'Order Source';
                TableRelation = "Order Source".Code;
                ToolTip = 'ALN - Specifies the source of the order for the sales invoice.';
            }
            field("Storefront Name"; Rec."Storefront Name")
            {
                ApplicationArea = All;
                Caption = 'Storefront Name';
                ToolTip = 'ALN - Specifies the name of the storefront associated with the sales invoice.';
            }
            field("Store Front Payment Status"; Rec."Store Front Payment Status")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Status';
                ToolTip = 'ALN - Specifies the payment status for the sales invoice in the storefront.';

            }
            field("Store Front Payment Gateway"; Rec."Store Front Payment Gateway")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Gateway';
                ToolTip = 'ALN - Specifies the payment gateway used for the sales invoice in the storefront.';
            }
            field("Store Front Payment Event Type"; Rec."Store Front Payment Event Type")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Event Type';
                ToolTip = 'ALN - Specifies the type of payment event for the sales invoice in the storefront.';
            }
            field("Store Front Payment Authcode"; Rec."Store Front Payment Authcode")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Authcode';
                ToolTip = 'ALN - Specifies the authorization code for the payment of the sales invoice in the storefront.';
            }
            field("Order Total Check"; Rec."Order Total Check")
            {
                ApplicationArea = All;
                Caption = 'Order Total Check';
                ToolTip = 'ALN - Specifies whether the order total for the sales invoice has been checked.';
            }
            field("Order Total Variance"; Rec."Order Total Variance")
            {
                ApplicationArea = All;
                Caption = 'Order Total Variance';
                ToolTip = 'ALN - Specifies the variance in the order total for the sales invoice.';
            }
        }
        addafter("Shipping and Billing")
        {
            group("Marketplace Details")
            {
                Caption = 'Marketplace Details';
                field("memo"; Rec."memo")
                {
                    ApplicationArea = All;
                    Caption = 'Memo';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the memo for the sales invoice.';
                }
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the vendor number associated with the sales invoice.';
                }
                field("shippingAddress_attention"; Rec."shippingAddress_attention")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Address Attention';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the attention line for the shipping address of the sales invoice.';
                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the store number associated with the sales invoice.';
                }
                field("Dealer_Department_Number"; Rec."Dealer_Department_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the dealer department number associated with the sales invoice.';
                }
                field("Dealer_Department_Description"; Rec."Dealer_Department_Description")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Description';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the description of the dealer department associated with the sales invoice.';
                }
                field("Standard_Carrier_Alpha_Code"; Rec."Standard_Carrier_Alpha_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Carrier Alpha Code';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the standard carrier alpha code for the sales invoice.';
                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the FOB qualifier for the sales invoice.';
                }
                field("Carrier_Transportation_Method_Code"; Rec."Transportation_Method_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Carrier Transportation Method Code';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the transportation method code for the carrier associated with the sales invoice.';
                }
                field("Transaction_ID"; Rec."Transaction_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the transaction ID for the sales invoice.';
                }
                field("discountItem_intID"; Rec."discountItem_intID")
                {
                    ApplicationArea = All;
                    Caption = 'Discount Item - intID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the internal ID of the discount item associated with the sales invoice.';
                }
                field("Customer_Account_Number"; Rec."Customer_Account_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Account Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the customer account number associated with the sales invoice.';
                }
                field("Special_Instructions"; Rec."Special_Instructions")
                {
                    ApplicationArea = All;
                    Caption = 'Special Instructions';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies any special instructions for the sales invoice.';
                }
                field("Customer_Order_Number"; Rec."Customer_Order_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Order Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the customer order number associated with the sales invoice.';
                }
                field("Release_No"; Rec."Release_No")
                {
                    ApplicationArea = All;
                    Caption = 'Release No';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the release number associated with the sales invoice.';
                }
                field("Ship_To_Code_Qualifier"; Rec."Ship_To_Code_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'Ship To Code Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the ship to code qualifier for the sales invoice.';
                }
                field("Requested_Ship_Date"; Rec."Requested_Ship_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Ship Date';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the requested ship date for the sales invoice.';
                }
                field("Current_Scheduled_Delivery"; Rec."Current_Scheduled_Delivery")
                {
                    ApplicationArea = All;
                    Caption = 'Current Scheduled Delivery';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the current scheduled delivery date for the sales invoice.';
                }
                field("Requested_PickUp_Date"; Rec."Requested_PickUp_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Pick Up Date';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the requested pick-up date for the sales invoice.';
                }
                field("Packaging_Type"; Rec."Packaging_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Packaging Type';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the type of packaging used for the sales invoice.';
                }
                field("Total_Packages"; Rec."Total_Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Total Packages';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the total number of packages for the sales invoice.';
                }
                field("PKG_PLT_Qty"; Rec."PKG_PLT_Qty")
                {
                    ApplicationArea = All;
                    Caption = 'PKG PLT Qty';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the quantity of packages on a pallet for the sales invoice.';
                }
                field("Marketplace_Shipment_ID"; Rec."Marketplace_Shipment_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Marketplace Shipment ID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the ID of the marketplace shipment associated with the sales invoice.';
                }
                field("824_Received"; Rec."824_Received")
                {
                    ApplicationArea = All;
                    Caption = '824 Received';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies whether the 824 document has been received for the sales invoice.';
                }
                field("824_Notes"; Rec."824_Notes")
                {
                    ApplicationArea = All;
                    Caption = '824 Notes';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies any notes related to the 824 document for the sales invoice.';
                }
                field("Routing_Request_Sent"; Rec."Routing_Request_Sent")
                {
                    ApplicationArea = All;
                    Caption = 'Routing Request Sent';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies whether a routing request has been sent for the sales invoice.';
                }
                field("Processed"; Rec."Processed")
                {
                    ApplicationArea = All;
                    Caption = 'Processed';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies whether the sales invoice has been processed.';
                }
                field("Supplier_Contact_Name"; Rec."Supplier_Contact_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Name';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the name of the supplier contact associated with the sales invoice.';
                }
                field("Supplier_Contact_No"; Rec."Supplier_Contact_No")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact No.';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the contact number of the supplier associated with the sales invoice.';
                }
                field("Supplier_Contact_Email"; Rec."Supplier_Contact_Email")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Email';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the email address of the supplier contact associated with the sales invoice.';
                }
                field("Ship From"; Rec."Ship From")
                {
                    ApplicationArea = All;
                    Caption = 'Ship From';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the location from which the items are shipped for the sales invoice.';

                }
                field("3rd Party Billing Account"; Rec."3rd Party Billing Account")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Billing Account';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the 3rd party billing account associated with the sales invoice.';
                }
                field("3rd Party Carrier"; Rec."3rd Party Carrier")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Carrier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the 3rd party carrier associated with the sales invoice.';
                }
                field("3rd Party Zip"; Rec."3rd Party Zip")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Zip';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the zip code for the 3rd party associated with the sales invoice.';
                }

                field(isShipresidential; Rec.isShipresidential)
                {
                    ApplicationArea = All;
                    Caption = 'Is Ship Residential';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies whether the shipping address is residential for the sales invoice.';
                }
            }
        }
    }

}