pageextension 50147 "Posted Sales Inv Update Ext" extends "Posted Sales Inv. - Update"
{
    layout
    {
        // Add changes to page layout here
        addafter("Package Tracking No.")
        {
            field("Invoice Sent"; Rec."Invoice Sent")
            {
                ApplicationArea = All;
                Caption = 'EDI Invoice Sent';
                Editable = true;
                ToolTip = 'ALN - Indicates whether the EDI sales invoice has been sent to the customer.';
            }
        }
        addafter(Payment)
        {
            group("Marketplace Details")
            {
                Caption = 'Marketplace Details';
                field("Vendor_Number"; Rec."Vendor_Number")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Number';
                    Importance = Standard;
                    Editable = true;
                    ToolTip = 'ALN - Specifies the vendor number associated with the sales invoice.';
                }
                field("Store_number"; Rec."Store_number")
                {
                    ApplicationArea = All;
                    Caption = 'Store Number';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the store number associated with the sales invoice.';
                }
                field("FOB_Qualifier"; Rec."FOB_Qualifier")
                {
                    ApplicationArea = All;
                    Caption = 'FOB Qualifier';
                    Importance = Standard;
                    ToolTip = 'ALN - Specifies the FOB qualifier for the sales invoice.';
                }

            }
        }


    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}