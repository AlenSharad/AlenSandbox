page 50132 "API - Transfer Order"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Transfer Order';
    EntitySetCaption = 'Transfer Orders';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'alenTransOrder';
    EntitySetName = 'alenTransOrders';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Transfer Header";
    APIPublisher = 'HappiestMinds';
    APIGroup = 'AlenAPIS';
    Extensible = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            field(Id; Rec.SystemId)
            {
                Caption = 'Id';
                Editable = false;
            }
            field(number; Rec."No.")
            {
                Caption = 'Transfer Order No.';
            }
            field(status; Rec.Status)
            {
                Caption = 'Status';
                Editable = false;
            }
            field(companyCode; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'Company Code';
                Editable = false;
            }
            field(transferFrom; Rec."Transfer-from Code")
            {
                Caption = 'Transfer-from Code';
            }
            field(transterTo; Rec."Transfer-to Code")
            {
                Caption = 'Transfer-to Code';
            }
            field(postDate; Rec."Posting Date")
            {
                Caption = 'Posting Date';
                Editable = false;
            }
            field(shipmentDate; Rec."Shipment Date")
            {
                Caption = 'Shipment Date';
                Editable = false;
            }
            field(receiptDate; Rec."Receipt Date")
            {
                Caption = 'Receipt Date';
                Editable = false;
            }
            field(externalDocumentNo; Rec."External Document No.")
            {
                Caption = 'External Document No.';
            }
            field(shipAgentCode; Rec."Shipping Agent Code")
            {
                Caption = 'Shipping Agent Code';
            }
            field(shipAgentServiceCode; Rec."Shipping Agent Service Code")
            {
                Caption = 'Shipping Agent Service Code';
            }
            field(containerNo; Rec."Container No.")
            {
                Caption = 'Container No.';
            }
            field(shipmentId; Rec."Shipment ID")
            {
                Caption = 'Shipment ID';
            }
            field(sentTo3PL; Rec."Sent to 3PL")
            {
                Caption = 'Sent to 3PL';
                Editable = false;
            }
            field(sentTo3PLDate; Rec."Sent to 3PL Date")
            {
                Caption = 'Sent to 3PL Date';
                Editable = false;
            }

            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'Last Modified Date';
                Editable = false;
            }
            field(creationDateTime; Rec.SystemCreatedAt)
            {
                Caption = 'Created At';
                Editable = false;
            }
            part(transOrderLines; "API - Transfer Order Line")
            {
                Caption = 'Lines';
                EntityName = 'alenTransOrderLine';
                EntitySetName = 'alenTransOrderLines';
                Multiplicity = Many;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
}