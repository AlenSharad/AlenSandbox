pageextension 50113 "Posted Purch Rcpt. Subform Ext" extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addbefore("Requested Receipt Date")
        {
            // field("Item Scheduled Date1"; Rec."Item Scheduled Date1")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Item Scheduled Date1';
            // }

            // field("Item Scheduled Date2"; Rec."Item Scheduled Date2")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Item Scheduled Date2';
            // }

            field("Container Number"; Rec."Container Number")
            {
                ApplicationArea = All;
                Caption = 'Container Number';
                ToolTip = 'ALN - Specifies the container number associated with this purchase receipt.';
            }

            field("PO Line ID"; Rec."PO Line ID")
            {
                ApplicationArea = All;
                Caption = 'PO Line ID';
                ToolTip = 'ALN - Specifies the purchase order line ID associated with this purchase receipt.';
            }

            field("Shipment ID"; Rec."Shipment ID")
            {
                ApplicationArea = All;
                Caption = 'Shipment ID';
                ToolTip = 'ALN - Specifies the shipment ID associated with this purchase receipt.';
            }
        }
    }
}