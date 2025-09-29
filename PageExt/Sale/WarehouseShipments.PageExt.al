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
        addlast(Control1)
        {
            field("Error Description"; Rec."Error Description")
            {
                ApplicationArea = All;
                Caption = 'Error Description';
                Editable = false;
                ToolTip = 'ALN - Describes the error that occurred during processing.';
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