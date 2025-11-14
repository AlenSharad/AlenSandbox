pageextension 50040 MyExtension extends "Purch. Receipt Lines"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Container Number"; Rec."Container Number")
            {
                Caption = 'Container Number';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'ALN - Specifies the container number associated with this purchase receipt line.';
            }

            field("Shipment ID"; Rec."Shipment ID")
            {
                Caption = 'Shipment ID';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'ALN - Specifies the shipment ID associated with this purchase receipt line.';
            }
            field("PO Line ID"; Rec."PO Line ID")
            {
                Caption = 'PO Line ID';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'ALN - Specifies the purchase order line ID associated with this purchase receipt line.';
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