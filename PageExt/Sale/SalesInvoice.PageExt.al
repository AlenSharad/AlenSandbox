pageextension 50145 "Sales Invoice Page Ext" extends "Sales Invoice"
{
    layout
    {

        modify(SellToEmail)
        {
            Visible = false;
        }
        modify(SellToPhoneNo)
        {
            Visible = false;
        }
        addafter(SellToEmail)
        {
            field("Sell-to Phone No."; Rec."Sell-to Phone No.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Phone No.';
                Importance = Additional;
                Editable = false;
                ExtendedDatatype = PhoneNo;
                ToolTip = 'Specifies the telephone number of the contact person that the sales document will be sent to.';
            }

            field("Sell-to E-Mail"; Rec."Sell-to E-Mail")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Email';
                Importance = Additional;
                Editable = false;
                ExtendedDatatype = EMail;
                ToolTip = 'Specifies the email address of the contact person that the sales document will be sent to.';

            }
        }
        addlast(General)
        {
            field("Order Type Code"; Rec."Order Type Code")
            {
                ApplicationArea = All;
                Caption = 'Order Type Code';
                TableRelation = "Order Type".Code;
                ToolTip = 'ALN - Specifies the type of order for this sales order.';
            }
            // field("Shopify Variant Id"; Rec."Shopify Variant Id")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Shopify Variant Id';
            //     ToolTip = 'ALN - Specifies the Shopify variant identifier for the item.';
            // }

            field("Sent to 3PL Date"; Rec."Sent to 3PL Date")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL Date';
                ToolTip = 'ALN - Specifies the date when the order was sent to the 3PL provider.';
            }
            field("Sent to 3PL"; Rec."Sent to 3PL")
            {
                ApplicationArea = All;
                Caption = 'Sent to 3PL';
                ToolTip = 'ALN - Indicates whether the order has been sent to the 3PL provider.';
            }
            field("All Items Fully Commited"; Rec."All Items Fully Commited")
            {
                ApplicationArea = All;
                Caption = 'All Items Fully Commited';
                ToolTip = 'ALN - Indicates if all items in the order are fully committed.';
            }
            field("Order Source"; Rec."Order Source")
            {
                ApplicationArea = All;
                Caption = 'Order Source';
                TableRelation = "Order Source".Code;
                ToolTip = 'ALN - Specifies the source of the order.';
            }
            field("Storefront Name"; Rec."Storefront Name")
            {
                ApplicationArea = All;
                Caption = 'Storefront Name';
                ToolTip = 'ALN - Specifies the name of the storefront for this order.';
            }
            field("Store Front Payment Status"; Rec."Store Front Payment Status")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Status';
                ToolTip = 'ALN - Shows the payment status from the storefront.';
            }
            field("Store Front Payment Gateway"; Rec."Store Front Payment Gateway")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Gateway';
                ToolTip = 'ALN - Specifies the payment gateway used by the storefront.';
            }
            field("Store Front Payment Event Type"; Rec."Store Front Payment Event Type")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Event Type';
                ToolTip = 'ALN - Shows the type of payment event from the storefront.';
            }
            field("Store Front Payment Authcode"; Rec."Store Front Payment Authcode")
            {
                ApplicationArea = All;
                Caption = 'Store Front Payment Authcode';
                ToolTip = 'ALN - Displays the payment authorization code from the storefront.';
            }
            field("Location Assigned"; Rec."Location Assigned")
            {
                ApplicationArea = All;
                Caption = 'Location Assigned';
                ToolTip = 'ALN - Indicates the location assigned for this sales order.';
            }


            field("Order Discount Details"; Rec."Order Discount Details")
            {
                ApplicationArea = All;
                Caption = 'Order Discount Details';
                ToolTip = 'ALN - Displays details about discounts applied to the order.';
            }

            group("Store front Data")
            {
                Caption = 'Store front Data';
                // Visible = false;
                field("Order Total Check"; Rec."Order Total Check")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Order Total Check';
                    ToolTip = 'ALN - Displays the Shopify Order Total for the order for validation.';
                }
                field("Order Total Excl Tax"; Rec."Order Total Excl Tax")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Order Total Excl Tax';
                    ToolTip = 'ALN - Displays the Shopify Order Total Excl Tax for the order for validation.';
                }
                field("Order Total Tax"; Rec."Order Total Tax")
                {
                    ApplicationArea = all;
                    Caption = 'Order Total Tax';
                    Editable = false;
                    ToolTip = 'ALN - Displays the total tax amount for the order.';
                }
            }
            group("BC Details")
            {
                field("Order Total Amount"; Rec."Order Total Amount")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Caption = 'Order Total Amount';
                    ToolTip = 'ALN - Shows the total amount for the order.';
                }


                field("Ava Tax Amount"; Rec."Ava Tax Amount")
                {
                    ApplicationArea = all;
                    Caption = 'Total Tax';
                    Editable = false;
                    ToolTip = 'ALN - Displays the Avalara tax amount for the order.';
                }
            }
            group("Variance Details")
            {
                Caption = 'Variance Details';
                field("Order Total Variance"; Rec."Order Total Variance")
                {
                    ApplicationArea = All;
                    Caption = 'Order Total Variance';
                    Editable = false;
                    ToolTip = 'ALN - Shows the variance between expected and actual order totals.';
                }
                field("Order Tax Variance"; Rec."Order Tax Variance")
                {
                    ApplicationArea = All;
                    Caption = 'Order Tax Variance';
                    Editable = false;
                    ToolTip = 'ALN - Shows the variance between expected and actual order tax amounts.';
                }

            }


            field("Ava Tax Override Type"; Rec."Ava Tax Override Type")
            {
                ApplicationArea = all;
            }
            field("Ava Tax Override Amount"; Rec."Ava Tax Override Amount")
            {
                ApplicationArea = all;
            }
        }

        // ...existing code...
        addafter("Shipping and Billing")
        {
            group("Marketplace Details")
            {
                Caption = 'Marketplace Details';

                field("Agreement No."; Rec."Agreement No.")
                {
                    ApplicationArea = All;
                    Caption = 'Agreement No.';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the agreement number associated with the order.';
                }
                field("memo"; Rec."memo")
                {
                    ApplicationArea = All;
                    Caption = 'Memo';
                    Importance = Standard;
                    ToolTip = 'ALN - Additional notes or memo for the order.';
                }
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the vendor number associated with the order.';
                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the store number for the order.';
                }
                field("Dealer_Department_Number"; Rec."Dealer_Department_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the dealer department number for the order.';
                }
                field("Dealer_Department_Description"; Rec."Dealer_Department_Description")
                {
                    ApplicationArea = All;
                    Caption = 'Dealer Department Description';
                    Importance = Standard;
                    ToolTip = 'ALN - Description of the dealer department for the order.';
                }
                field("Standard_Carrier_Alpha_Code"; Rec."Standard_Carrier_Alpha_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Standard Carrier Alpha Code';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the standard carrier alpha code for shipping.';
                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the FOB qualifier for the order.';
                }
                field("Carrier_Transportation_Method_Code"; Rec."Transportation_Method_Code")
                {
                    ApplicationArea = All;
                    Caption = 'Carrier Transportation Method Code';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the carrier transportation method code.';
                }
                field("Transaction_ID"; Rec."Transaction_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Transaction ID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the transaction ID for the order.';
                }
                field("discountItem_intID"; Rec."discountItem_intID")
                {
                    ApplicationArea = All;
                    Caption = 'Discount Item - intID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the internal ID for the discount item.';
                }
                field("Customer_Account_Number"; Rec."Customer_Account_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Account Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the customer account number for the order.';
                }
                field("Special_Instructions"; Rec."Special_Instructions")
                {
                    ApplicationArea = All;
                    Caption = 'Special Instructions';
                    Importance = Standard;
                    ToolTip = 'ALN - Displays any special instructions for the order.';
                }
                field("Customer_Order_Number"; Rec."Customer_Order_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Order Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the customer order number.';
                }
                field("Release_No"; Rec."Release_No")
                {
                    ApplicationArea = All;
                    Caption = 'Release No';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the release number for the order.';
                }
                field("Ship_To_Code_Qualifier"; Rec."Ship_To_Code_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'Ship To Code Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the ship-to code qualifier for the order.';
                }
                field("Requested_Ship_Date"; Rec."Requested_Ship_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Ship Date';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the requested ship date for the order.';
                }
                field("Current_Scheduled_Delivery"; Rec."Current_Scheduled_Delivery")
                {
                    ApplicationArea = All;
                    Caption = 'Current Scheduled Delivery';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the current scheduled delivery date for the order.';
                }
                field("Requested_PickUp_Date"; Rec."Requested_PickUp_Date")
                {
                    ApplicationArea = All;
                    Caption = 'Requested Pick Up Date';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the requested pick up date for the order.';
                }
                field("Packaging_Type"; Rec."Packaging_Type")
                {
                    ApplicationArea = All;
                    Caption = 'Packaging Type';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the packaging type for the order.';
                }
                field("Total_Packages"; Rec."Total_Packages")
                {
                    ApplicationArea = All;
                    Caption = 'Total Packages';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the total number of packages for the order.';
                }
                field("PKG_PLT_Qty"; Rec."PKG_PLT_Qty")
                {
                    ApplicationArea = All;
                    Caption = 'PKG PLT Qty';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the quantity of packages per pallet.';
                }
                field("Shipment Weight"; Rec."Shipment Weight")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Weight';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the Shipment Weight for the order.';

                }
                field("Shipment Cubic FT"; Rec."Shipment Cubic FT")
                {
                    ApplicationArea = All;
                    Caption = 'Shipment Cubic FT';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the Shipment Cubic FT for the order.';

                }
                field("Marketplace_Shipment_ID"; Rec."Marketplace_Shipment_ID")
                {
                    ApplicationArea = All;
                    Caption = 'Marketplace Shipment ID';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the marketplace shipment ID for the order.';
                }
                field("824_Received"; Rec."824_Received")
                {
                    ApplicationArea = All;
                    Caption = '824 Received';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates if the 824 document has been received.';
                }
                field("824_Notes"; Rec."824_Notes")
                {
                    ApplicationArea = All;
                    Caption = '824 Notes';
                    Importance = Standard;
                    ToolTip = 'ALN - Displays notes related to the 824 document.';
                }
                field("Routing_Request_Sent"; Rec."Routing_Request_Sent")
                {
                    ApplicationArea = All;
                    Caption = 'Routing Request Sent';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates if a routing request has been sent for the order.';
                }
                field("Processed"; Rec."Processed")
                {
                    ApplicationArea = All;
                    Caption = 'Processed';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates if the order has been processed.';
                }
                field("Supplier_Contact_Name"; Rec."Supplier_Contact_Name")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Name';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the supplier contact name for the order.';
                }
                field("Supplier_Contact_No"; Rec."Supplier_Contact_No")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact No.';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the supplier contact number for the order.';
                }
                field("Supplier_Contact_Email"; Rec."Supplier_Contact_Email")
                {
                    ApplicationArea = All;
                    Caption = 'Supplier Contact Email';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the supplier contact email for the order.';
                }
                field("Ship From"; Rec."Ship From")
                {
                    ApplicationArea = All;
                    Caption = 'Ship From';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the ship-from location for the order.';
                }
                field("3rd Party Billing Account"; Rec."3rd Party Billing Account")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Billing Account';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the third-party billing account for the order.';
                }
                field("3rd Party Carrier"; Rec."3rd Party Carrier")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Carrier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the third-party carrier for the order.';
                }
                field("3rd Party Zip"; Rec."3rd Party Zip")
                {
                    ApplicationArea = All;
                    Caption = '3rd Party Zip';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the third-party zip code for the order.';
                }
                field(isShipresidential; Rec.isShipresidential)
                {
                    ApplicationArea = All;
                    Caption = 'Is Ship Residential';
                    Importance = Standard;
                    ToolTip = 'ALN - Indicates if the shipping address is residential.';
                }
            }
            group(SystemDetails)
            {
                Caption = 'System Details';
                field("Created By"; GetUserNameFromSecurityId(Rec.SystemCreatedBy))
                {
                    ApplicationArea = All;
                    Caption = 'Created By';
                    Importance = Standard;
                    ToolTip = 'ALN - Shows the user who created this record.';
                }
                field("Created At"; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Created At';
                    Importance = Standard;
                    ToolTip = 'ALN - Shows the date and time when this record was created.';
                }
                field("Modified By"; GetUserNameFromSecurityId(Rec.SystemModifiedBy))
                {
                    ApplicationArea = All;
                    Caption = 'Modified By';
                    Importance = Standard;
                    ToolTip = 'ALN - Shows the user who last modified this record.';
                }
                field("Modified At"; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Modified At';
                    Importance = Standard;
                    ToolTip = 'ALN - Shows the date and time when this record was last modified.';
                }
                field("Error Description"; Rec."Error Description")
                {
                    ApplicationArea = All;
                    Caption = 'Error Description';
                    Editable = false;
                    ToolTip = 'ALN - Provides details about any errors associated with the order.';
                }
            }
        }
        addafter("Bill-to Post Code")
        {
            field("Bill-to Phone No."; Rec."Bill-to Phone No.")
            {
                ApplicationArea = All;
                Caption = 'Bill-to Phone No.';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the phone number for the bill-to address.';
            }
        }
        addafter("Ship-to Contact")
        {
            field("shippingAddress_attention"; Rec."shippingAddress_attention")
            {
                ApplicationArea = All;
                Caption = 'Shipping Address Attention';
                Importance = Standard;
                ToolTip = 'ALN - Specifies the attention line for the shipping address.';
            }
        }
        addafter("Package Tracking No.")
        {
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
            field("Shipment Exist"; Rec."Shipment Exist")
            {
                ApplicationArea = All;
                Caption = 'Shipment Exist';
                Importance = Standard;
                ToolTip = 'ALN - Indicates whether a shipment exists for the sales order.';
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(GetLocationAssignment)
            {
                ApplicationArea = All;
                Caption = 'Get Location Assignment';
                ToolTip = 'ALN - This action will call the API and assign Location.';
                Image = Action;
                trigger OnAction()
                var
                    LocationAssignment: Codeunit LocationAssignment;
                    bomavailable: Record "Item Bom Available";
                    customBillto: Record "Custom Bill To Address";
                    customshipto: Record "Custom Ship To Address";
                    salesheader: Record "Sales Header";
                    salesorderentitybuffer: Record "Sales Order Entity Buffer";
                begin

                    LocationAssignment.FillItemAvailabilityLocationwise(Rec, true);
                    bomavailable.Reset();
                    bomavailable.SetRange("Order No.", Rec."No.");
                    Page.Run(50121, bomavailable);


                end;
            }
        }
    }
    procedure GetUserNameFromSecurityId(UserSecurityID: Guid): Code[50]
    var
        User: Record User;
    begin
        if User.Get(UserSecurityID) then
            exit(User."User Name")
        else
            exit('');

    end;

    // trigger OnOpenPage()

    // begin
    //     CurrPage.Editable(false)
    // end;
}