tableextension 50111 "Posted Whse Shpt Header Ext" extends "Posted Whse. Shipment Header"
{
    fields
    {
        field(50100; "Order Type Code"; Code[20])
        {
            Caption = 'Order Type Code';
            DataClassification = ToBeClassified;
            TableRelation = "Order Type".Code;
        }
        field(50101; "Shopify Variant Id"; Text[50])
        {
            Caption = 'Shopify Variant Id';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50102; "Sent to 3PL Date"; DateTime)
        {
            Caption = 'Sent to 3PL Date';
            DataClassification = ToBeClassified;
        }

        field(50103; "Sent to 3PL"; Boolean)
        {
            Caption = 'Sent to 3PL';
            DataClassification = ToBeClassified;
        }
        field(50104; "All Items Fully Commited"; Boolean)
        {
            Caption = 'All Items Fully Commited';
            DataClassification = ToBeClassified;
        }
        field(50105; "Order Source"; Code[20])
        {
            Caption = 'Order Source Code';
            DataClassification = ToBeClassified;
            TableRelation = "Order Source".Code;
        }
        field(50106; "Store Front Payment Status"; Text[50])
        {
            Caption = 'Store Front Payment Status';
            DataClassification = ToBeClassified;
        }
        field(50107; "Store Front Payment Gateway"; Code[20])
        {
            Caption = 'Store Front Payment Gateway';
            DataClassification = ToBeClassified;
        }
        field(50108; "Store Front Payment Event Type"; Text[50])
        {
            Caption = 'Store Front Payment Event Type';
            DataClassification = ToBeClassified;
        }
        field(50109; "Store Front Payment Authcode"; Text[50])
        {
            Caption = 'Store Front Payment Authcode';
            DataClassification = ToBeClassified;
        }
        field(50110; "Order Total Check"; Decimal)
        {
            Caption = 'Order Total Check';
            DataClassification = ToBeClassified;
        }
        field(50111; "Order Total Variance"; Decimal)
        {
            Caption = 'Order Total Variance';
            DataClassification = ToBeClassified;
        }
        //... Marketplace fields
        field(50112; "memo"; Text[50])
        {
            Caption = 'Memo';
            DataClassification = ToBeClassified;
        }
        field(50113; "Vendor_Number"; Code[20])
        {
            Caption = 'Vendor Number';
            DataClassification = ToBeClassified;
        }
        field(50114; "shippingAddress_attention"; Text[50])
        {
            Caption = 'Shipping Address Attention';
            DataClassification = ToBeClassified;
        }
        field(50115; "Store_number"; Code[20])
        {
            Caption = 'Store Number';
            DataClassification = ToBeClassified;
        }
        field(50116; "Dealer_Department_Number"; Code[20])
        {
            Caption = 'Dealer Department Number';
            DataClassification = ToBeClassified;
        }
        field(50117; "Dealer_Department_Description"; Text[50])
        {
            Caption = 'Dealer Department Description';
            DataClassification = ToBeClassified;
        }
        field(50118; "Standard_Carrier_Alpha_Code"; Text[50])
        {
            Caption = 'Standard Carrier Alpha Code';
            DataClassification = ToBeClassified;
        }
        field(50119; "FOB_Qualifier"; Text[50])
        {
            Caption = 'FOB Qualifier';
            DataClassification = ToBeClassified;
        }
        field(50120; "Transportation_Method_Code"; Text[50])
        {
            Caption = 'Carrier Transportation Method Code';
            DataClassification = ToBeClassified;
        }
        field(50121; "Transaction_ID"; Code[20])
        {
            Caption = 'Transaction ID';
            DataClassification = ToBeClassified;
        }
        field(50122; "discountItem_intID"; Text[50])
        {
            Caption = 'Discount Item - intID';
            DataClassification = ToBeClassified;
        }
        field(50123; "Customer_Account_Number"; Text[50])
        {
            Caption = 'Customer Account Number';
            DataClassification = ToBeClassified;
        }
        field(50124; "Special_Instructions"; Text[100])
        {
            Caption = 'Special Instructions';
            DataClassification = ToBeClassified;
        }
        field(50125; "Customer_Order_Number"; Code[20])
        {
            Caption = 'Customer Order Number';
            DataClassification = ToBeClassified;
        }
        field(50126; "Release_No"; Text[50])
        {
            Caption = 'Release No';
            DataClassification = ToBeClassified;
        }
        field(50127; "Ship_To_Code_Qualifier"; Text[50])
        {
            Caption = 'Ship To Code Qualifier';
            DataClassification = ToBeClassified;
        }
        field(50128; "Requested_Ship_Date"; Date)
        {
            Caption = 'Requested Ship Date';
            DataClassification = ToBeClassified;
        }
        field(50129; "Current_Scheduled_Delivery"; Date)
        {
            Caption = 'Current Scheduled Delivery';
            DataClassification = ToBeClassified;
        }
        field(50130; "Requested_PickUp_Date"; Date)
        {
            Caption = 'Requested Pick Up Date';
            DataClassification = ToBeClassified;
        }
        field(50131; "Packaging_Type"; Text[20])
        {
            Caption = 'Packaging Type';
            DataClassification = ToBeClassified;
        }
        field(50132; "Total_Packages"; Decimal)
        {
            Caption = 'Total Packages';
            DataClassification = ToBeClassified;
        }
        field(50133; "PKG_PLT_Qty"; Decimal)
        {
            Caption = 'PKG PLT Qty';
            DataClassification = ToBeClassified;
        }
        field(50134; "Marketplace_Shipment_ID"; Text[50])
        {
            Caption = 'Marketplace Shipment ID';
            DataClassification = ToBeClassified;
        }
        field(50135; "824_Received"; Boolean)
        {
            Caption = '824 Received';
            DataClassification = ToBeClassified;
        }
        field(50136; "824_Notes"; Text[100])
        {
            Caption = '824 Notes';
            DataClassification = ToBeClassified;
        }
        field(50137; "Routing_Request_Sent"; Boolean)
        {
            Caption = 'Routing Request Sent';
            DataClassification = ToBeClassified;
        }
        field(50138; "Processed"; Boolean)
        {
            Caption = 'Processed';
            DataClassification = ToBeClassified;
        }
        field(50139; "Supplier_Contact_Name"; Text[100])
        {
            Caption = 'Supplier Contact Name';
            DataClassification = ToBeClassified;
        }
        field(50140; "Supplier_Contact_No"; Text[21])
        {
            Caption = 'Supplier Contact No.';
            DataClassification = ToBeClassified;
        }
        field(50141; "Supplier_Contact_Email"; Text[100])
        {
            Caption = 'Supplier Contact Email';
            DataClassification = ToBeClassified;
        }
        field(50142; "Ship From"; Text[100])
        {
            Caption = 'Ship From';
            DataClassification = ToBeClassified;
        }
        field(50143; "3rd Party Billing Account"; Text[100])
        {
            Caption = '3rd Party Billing Account';
            DataClassification = ToBeClassified;
        }
        field(50144; "3rd Party Zip"; Code[10])
        {
            Caption = '3rd Party Zip';
            DataClassification = ToBeClassified;
        }
        field(50145; "3rd Party Carrier"; Text[100])
        {
            Caption = '3rd Party Carrier';
            DataClassification = ToBeClassified;
        }
        field(50146; "Storefront Name"; Text[100])
        {
            Caption = 'Storefront Name';
            DataClassification = ToBeClassified;
        }
        field(50147; isShipresidential; Boolean)
        {
            Caption = 'Is Ship Residential';
            DataClassification = ToBeClassified;
        }
        field(50148; "Bill-to Phone No."; Text[30])
        {
            Caption = 'Bill-to Phone No.';
            DataClassification = ToBeClassified;
        }
    }
}