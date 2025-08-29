pageextension 50108 "Whse Shipment Page Ext" extends "Warehouse Shipment"
{

    layout
    {
        addlast(General)
        {
            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = All;
                Caption = 'Source No.';
                Editable = false;
                ToolTip = 'ALN - Specifies the source number for the warehouse shipment.';
            }
            field("Your Reference"; Rec."Your Reference")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Your Reference';
                ToolTip = 'ALN - Specifies your reference for the warehouse shipment.';
            }
            field("Order Type Code"; Rec."Order Type Code")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Order Type Code';
                TableRelation = "Order Type".Code;
                ToolTip = 'ALN - Specifies the type of order for this warehouse shipment.';
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
                ToolTip = 'ALN - Specifies the date when the warehouse shipment was sent to the third-party logistics provider (3PL).';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
                ToolTip = 'ALN - Indicates whether the warehouse shipment has been sent to the third-party logistics provider (3PL).';
            }
            field("All Items Fully Commited"; Rec."All Items Fully Commited")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'All Items Fully Commited';
                ToolTip = 'ALN - Indicates whether all items in the warehouse shipment have been fully committed.';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Order Source';
                TableRelation = "Order Source".Code;
                ToolTip = 'ALN - Specifies the source of the order associated with the warehouse shipment.';
            }
            field("Storefront Name"; Rec."Storefront Name")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Storefront Name';
                ToolTip = 'ALN - Specifies the name of the storefront associated with the warehouse shipment.';
            }
            field("Store Front Payment Status"; Rec."Store Front Payment Status")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Store Front Payment Status';
                ToolTip = 'ALN - Specifies the payment status for the store front associated with the warehouse shipment.';

            }
            field("Store Front Payment Gateway"; Rec."Store Front Payment Gateway")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Store Front Payment Gateway';
                ToolTip = 'ALN - Specifies the payment gateway used for the store front associated with the warehouse shipment.';

            }
            field("Store Front Payment Event Type"; Rec."Store Front Payment Event Type")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Store Front Payment Event Type';
                ToolTip = 'ALN - Specifies the payment event type for the store front associated with the warehouse shipment.';
            }
            field("Store Front Payment Authcode"; Rec."Store Front Payment Authcode")
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Store Front Payment Authcode';
                ToolTip = 'ALN - Specifies the authorization code for the store front payment associated with the warehouse shipment.';
            }
            field("Order Total Check"; Rec."Order Total Check")
            {
                ApplicationArea = All;
                Visible = false;
                Editable = false;
                Caption = 'Order Total Check';
                ToolTip = 'ALN - Specifies the order total check for the warehouse shipment.';
            }
            field("Order Total Variance"; Rec."Order Total Variance")
            {
                ApplicationArea = All;
                Visible = false;
                Editable = false;
                Caption = 'Order Total Variance';
                ToolTip = 'ALN - Specifies the order total variance for the warehouse shipment.';
            }
            field(TotalWeight; Rec.TotalWeight)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Total Weight';
                ToolTip = 'Specifies the total weight of the items in the warehouse shipment.';
            }

        }
        addlast(Shipping)
        {
            field("Ship to Name"; Rec."Ship to Name")
            {
                ApplicationArea = All;
                Caption = 'Ship to Name';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the name of the recipient for the warehouse shipment.';
            }
            field("Shipping Address"; Rec."Shipping Address")
            {
                ApplicationArea = All;
                Caption = 'Shipping Address';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the shipping address for the warehouse shipment.';
            }
            field("Shipping Address 2"; Rec."Shipping Address 2")
            {
                ApplicationArea = All;
                Caption = 'Shipping Address 2';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the second line of the shipping address for the warehouse shipment.';
            }
            field("Shipping City"; Rec."Shipping City")
            {
                ApplicationArea = All;
                Caption = 'Shipping City';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the city for the shipping address associated with the warehouse shipment.';
            }
            field("Shipping County"; Rec."Shipping County")
            {
                ApplicationArea = All;
                Caption = 'Shipping State';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the county for the shipping address associated with the warehouse shipment.';
            }
            field("Shipping Post Code"; Rec."Shipping Post Code")
            {
                ApplicationArea = All;
                Caption = 'Shipping Post Code';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the postal code for the shipping address associated with the warehouse shipment.';
            }
            field("Shipping Country/Region Code"; Rec."Shipping Country/Region Code")
            {
                ApplicationArea = All;
                Caption = 'Shipping Country/Region Code';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the country or region code for the shipping address associated with the warehouse shipment.';
            }
            field("Shipping Phone No."; Rec."Shipping Phone No.")
            {
                ApplicationArea = All;
                Caption = 'Shipping Phone No.';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the phone number for the shipping address associated with the warehouse shipment.';
            }
            field("Package Tracking No."; Rec."Package Tracking No.")
            {
                ApplicationArea = All;
                Caption = 'Package Tracking No.';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the tracking number for the package associated with the warehouse shipment.';
            }
            field("Requested Delivery Date"; Rec."Requested Delivery Date")
            {
                ApplicationArea = All;
                Caption = 'Requested Delivery Date';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the requested delivery date for the warehouse shipment.';
            }

        }
        addafter("Shipping")
        {
            group("Marketplace Details")
            {
                Caption = 'Marketplace Details';
                field("memo"; Rec."memo")
                {
                    ApplicationArea = All;
                    Caption = 'Memo';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies any additional information or notes related to the warehouse shipment.';
                }
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the vendor number associated with the warehouse shipment.';
                }
                field("shippingAddress_attention"; Rec."shippingAddress_attention")
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Address Attention';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the attention line for the shipping address associated with the warehouse shipment.';
                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the store number associated with the warehouse shipment.';
                }
                field("Dealer_Department_Number"; Rec."Dealer_Department_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the dealer department number associated with the warehouse shipment.';
                }
                field("Dealer_Department_Description"; Rec."Dealer_Department_Description")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Description';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the description of the dealer department associated with the warehouse shipment.';
                }
                field("Standard_Carrier_Alpha_Code"; Rec."Standard_Carrier_Alpha_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Carrier Alpha Code';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the standard carrier alpha code for the warehouse shipment.';
                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the Free On Board (FOB) qualifier for the warehouse shipment.';
                }
                field("Carrier_Transportation_Method_Code"; Rec."Transportation_Method_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Carrier Transportation Method Code';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the transportation method code for the carrier associated with the warehouse shipment.';
                }
                field("Transaction_ID"; Rec."Transaction_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the transaction ID associated with the warehouse shipment.';
                }
                field("discountItem_intID"; Rec."discountItem_intID")
                {
                    ApplicationArea = All;
                    Caption = 'Discount Item - intID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the internal ID of the discount item associated with the warehouse shipment.';
                }
                field("Customer_Account_Number"; Rec."Customer_Account_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Account Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the customer account number associated with the warehouse shipment.';
                }
                field("Special_Instructions"; Rec."Special_Instructions")
                {
                    ApplicationArea = All;
                    Caption = 'Special Instructions';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies any special instructions related to the warehouse shipment.';
                }
                field("Customer_Order_Number"; Rec."Customer_Order_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Order Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the customer order number associated with the warehouse shipment.';
                }
                field("Release_No"; Rec."Release_No")
                {
                    ApplicationArea = All;
                    Caption = 'Release No';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the release number associated with the warehouse shipment.';
                }
                field("Ship_To_Code_Qualifier"; Rec."Ship_To_Code_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'Ship To Code Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the ship to code qualifier for the warehouse shipment.';
                }
                field("Requested_Ship_Date"; Rec."Requested_Ship_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Ship Date';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the requested ship date for the warehouse shipment.';
                }
                field("Current_Scheduled_Delivery"; Rec."Current_Scheduled_Delivery")
                {
                    ApplicationArea = All;
                    Caption = 'Current Scheduled Delivery';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the current scheduled delivery date for the warehouse shipment.';
                }
                field("Requested_PickUp_Date"; Rec."Requested_PickUp_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Pick Up Date';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the requested pick-up date for the warehouse shipment.';
                }
                field("Packaging_Type"; Rec."Packaging_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Packaging Type';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the type of packaging used for the warehouse shipment.';
                }
                field("Total_Packages"; Rec."Total_Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Total Packages';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the total number of packages in the warehouse shipment.';
                }
                field("PKG_PLT_Qty"; Rec."PKG_PLT_Qty")
                {
                    ApplicationArea = All;
                    Caption = 'PKG PLT Qty';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the quantity of packages on a pallet for the warehouse shipment.';
                }
                field("Marketplace_Shipment_ID"; Rec."Marketplace_Shipment_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Marketplace Shipment ID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the ID of the marketplace shipment associated with the warehouse shipment.';
                }
                field("824_Received"; Rec."824_Received")
                {
                    ApplicationArea = All;
                    Caption = '824 Received';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates whether the 824 transaction set has been received for the warehouse shipment.';
                }
                field("824_Notes"; Rec."824_Notes")
                {
                    ApplicationArea = All;
                    Caption = '824 Notes';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies any notes related to the 824 transaction set for the warehouse shipment.';
                }
                field("Routing_Request_Sent"; Rec."Routing_Request_Sent")
                {
                    ApplicationArea = All;
                    Caption = 'Routing Request Sent';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates whether a routing request has been sent for the warehouse shipment.';
                }
                field("Processed"; Rec."Processed")
                {
                    ApplicationArea = All;
                    Caption = 'Processed';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates whether the warehouse shipment has been processed.';
                }
                field("Supplier_Contact_Name"; Rec."Supplier_Contact_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Name';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the name of the contact person at the supplier for the warehouse shipment.';
                }
                field("Supplier_Contact_No"; Rec."Supplier_Contact_No")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact No.';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the contact number of the supplier for the warehouse shipment.';
                }
                field("Supplier_Contact_Email"; Rec."Supplier_Contact_Email")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Email';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the email address of the contact person at the supplier for the warehouse shipment.';
                }
                field("Ship From"; Rec."Ship From")
                {
                    ApplicationArea = All;
                    Caption = 'Ship From';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the location from which the warehouse shipment is being sent.';

                }
                field("3rd Party Billing Account"; Rec."3rd Party Billing Account")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Billing Account';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the billing account for third-party billing associated with the warehouse shipment.';
                }
                field("3rd Party Carrier"; Rec."3rd Party Carrier")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Carrier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the third-party carrier used for the warehouse shipment.';
                }
                field("3rd Party Zip"; Rec."3rd Party Zip")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Zip';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the zip code for the third-party billing address associated with the warehouse shipment.';
                }

                field(isShipresidential; Rec.isShipresidential)
                {
                    ApplicationArea = All;
                    Caption = 'Is Ship Residential';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates whether the shipping address is residential for the warehouse shipment.';
                }
            }
        }
    }
    actions
    {
        addlast("&Shipment")
        {
            action(PackageContent)
            {
                ApplicationArea = All;
                Caption = 'Package Content';
                ToolTip = 'ALN - View the contents of the package associated with the warehouse shipment.';
                Image = BinContent;
                RunObject = Page "Package Contents";
                RunPageLink = "Shipment No." = field("No.");
                trigger OnAction()
                begin
                end;
            }
        }
        addfirst(Category_Category7)
        {
            actionref(Promoted_PackageContent; PackageContent)
            { }

        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.SetAutoCalcFields(TotalWeight);
    end;
}