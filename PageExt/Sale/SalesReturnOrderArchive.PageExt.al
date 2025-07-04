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
            }
            field("Shopify Variant Id"; Rec."Shopify Variant Id")
            {
                ApplicationArea = All;
                Caption = 'Shopify Variant Id';
            }
            field("Sent to 3PL Date"; Rec."Sent to 3PL Date")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL Date';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
            }
            field("All Items Fully Commited"; Rec."All Items Fully Commited")
            {
                ApplicationArea = All;
                Caption = 'All Items Fully Commited';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Caption = 'Order Source';
                TableRelation = "Order Source".Code;
            }
            field("Storefront Name"; Rec."Storefront Name")
            {
                ApplicationArea = All;
                Caption = 'Storefront Name';
            }
            field("Store Front Payment Status"; Rec."Store Front Payment Status")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Status';

            }
            field("Store Front Payment Gateway"; Rec."Store Front Payment Gateway")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Gateway';

            }
            field("Store Front Payment Event Type"; Rec."Store Front Payment Event Type")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Event Type';
            }
            field("Store Front Payment Authcode"; Rec."Store Front Payment Authcode")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Authcode';
            }
            field("Order Total Check"; Rec."Order Total Check")
            {
                ApplicationArea = All;
                Caption = 'Order Total Check';
            }
            field("Order Total Variance"; Rec."Order Total Variance")
            {
                ApplicationArea = All;
                Caption = 'Order Total Variance';
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
                }
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';
                    Importance = Standard;
                }
                field("shippingAddress_attention"; Rec."shippingAddress_attention")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Address Attention';
                    Importance = Standard;
                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';
                    Importance = Standard;
                }
                field("Dealer_Department_Number"; Rec."Dealer_Department_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Number';
                    Importance = Standard;
                }
                field("Dealer_Department_Description"; Rec."Dealer_Department_Description")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Description';
                    Importance = Standard;
                }
                field("Standard_Carrier_Alpha_Code"; Rec."Standard_Carrier_Alpha_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Carrier Alpha Code';
                    Importance = Standard;
                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';
                    Importance = Standard;
                }
                field("Carrier_Transportation_Method_Code"; Rec."Transportation_Method_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Carrier Transportation Method Code';
                    Importance = Standard;
                }
                field("Transaction_ID"; Rec."Transaction_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';
                    Importance = Standard;
                }
                field("discountItem_intID"; Rec."discountItem_intID")
                {
                    ApplicationArea = All;
                    Caption = 'Discount Item - intID';
                    Importance = Standard;
                }
                field("Customer_Account_Number"; Rec."Customer_Account_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Account Number';
                    Importance = Standard;
                }
                field("Special_Instructions"; Rec."Special_Instructions")
                {
                    ApplicationArea = All;
                    Caption = 'Special Instructions';
                    Importance = Standard;
                }
                field("Customer_Order_Number"; Rec."Customer_Order_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Order Number';
                    Importance = Standard;
                }
                field("Release_No"; Rec."Release_No")
                {
                    ApplicationArea = All;
                    Caption = 'Release No';
                    Importance = Standard;
                }
                field("Ship_To_Code_Qualifier"; Rec."Ship_To_Code_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'Ship To Code Qualifier';
                    Importance = Standard;
                }
                field("Requested_Ship_Date"; Rec."Requested_Ship_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Ship Date';
                    Importance = Standard;
                }
                field("Current_Scheduled_Delivery"; Rec."Current_Scheduled_Delivery")
                {
                    ApplicationArea = All;
                    Caption = 'Current Scheduled Delivery';
                    Importance = Standard;
                }
                field("Requested_PickUp_Date"; Rec."Requested_PickUp_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Pick Up Date';
                    Importance = Standard;
                }
                field("Packaging_Type"; Rec."Packaging_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Packaging Type';
                    Importance = Standard;
                }
                field("Total_Packages"; Rec."Total_Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Total Packages';
                    Importance = Standard;
                }
                field("PKG_PLT_Qty"; Rec."PKG_PLT_Qty")
                {
                    ApplicationArea = All;
                    Caption = 'PKG PLT Qty';
                    Importance = Standard;
                }
                field("Marketplace_Shipment_ID"; Rec."Marketplace_Shipment_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Marketplace Shipment ID';
                    Importance = Standard;
                }
                field("824_Received"; Rec."824_Received")
                {
                    ApplicationArea = All;
                    Caption = '824 Received';
                    Importance = Standard;
                }
                field("824_Notes"; Rec."824_Notes")
                {
                    ApplicationArea = All;
                    Caption = '824 Notes';
                    Importance = Standard;
                }
                field("Routing_Request_Sent"; Rec."Routing_Request_Sent")
                {
                    ApplicationArea = All;
                    Caption = 'Routing Request Sent';
                    Importance = Standard;
                }
                field("Processed"; Rec."Processed")
                {
                    ApplicationArea = All;
                    Caption = 'Processed';
                    Importance = Standard;
                }
                field("Supplier_Contact_Name"; Rec."Supplier_Contact_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Name';
                    Importance = Standard;
                }
                field("Supplier_Contact_No"; Rec."Supplier_Contact_No")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact No.';
                    Importance = Standard;
                }
                field("Supplier_Contact_Email"; Rec."Supplier_Contact_Email")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Email';
                    Importance = Standard;
                }
                field("Ship From"; Rec."Ship From")
                {
                    ApplicationArea = All;
                    Caption = 'Ship From';
                    Importance = Standard;

                }
                field("3rd Party Billing Account"; Rec."3rd Party Billing Account")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Billing Account';
                    Importance = Standard;
                }
                field("3rd Party Carrier"; Rec."3rd Party Carrier")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Carrier';
                    Importance = Standard;
                }
                field("3rd Party Zip"; Rec."3rd Party Zip")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Zip';
                    Importance = Standard;
                }

                field(isShipresidential; Rec.isShipresidential)
                {
                    ApplicationArea = All;
                    Caption = 'Is Ship Residential';
                    Importance = Standard;
                }
            }
        }

    }
}