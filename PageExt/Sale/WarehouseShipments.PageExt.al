pageextension 50143 "Whse Shipment List Ext" extends "Warehouse Shipment List"
{
    layout
    {
        // Add changes to page layout here
        addfirst(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::"Warehouse Shipment Header"),
                              "No." = FIELD("No.");
            }
        }
        addafter(Status)
        {
            field("Source No."; Rec."Source No.")
            {
                ApplicationArea = All;
                Caption = 'Source No.';
                Editable = false;
                ToolTip = 'ALN - Specifies the source number for the warehouse shipment.';
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