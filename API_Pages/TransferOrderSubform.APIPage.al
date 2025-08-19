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

        }
    }
}