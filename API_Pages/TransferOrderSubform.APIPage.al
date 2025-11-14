page 50133 "API - Transfer Order Line"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Transfer Order Line';
    EntitySetCaption = 'Transfer Order Lines';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'alenTransOrderLine';
    EntitySetName = 'alenTransOrderLines';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Transfer Line";
    //SourceTableView = where("Derived From Line No." = filter(<> 0));
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
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
            field(transOrderNo; Rec."Document No.")
            {
                Caption = 'Transfer Order No.';
                Editable = false;
            }
            field(sequence; Rec."Line No.")
            {
                Caption = 'Line No.';
                Editable = false;
            }
            field(itemNo; Rec."Item No.")
            {
                Caption = 'Item No.';
            }
            field(quantity; Rec.Quantity)
            {
                Caption = 'Quantity';
            }
            field(unitOfMeasure; Rec."Unit of Measure Code")
            {
                Caption = 'Unit of Measure Code';
            }
            field(qtytoShip; Rec."Qty. to Ship")
            {
                Caption = 'Quantity to Ship';
            }
            field(qtytoReceive; Rec."Qty. to Receive")
            {
                Caption = 'Quantity to Receive';
            }
            field(qtyShipped; Rec."Quantity Shipped")
            {
                Caption = 'Quantity Shipped';
            }
            field(qtyReceived; Rec."Quantity Received")
            {
                Caption = 'Quantity Received';
            }

        }
    }
}