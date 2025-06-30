tableextension 50123 "Purch. Line Archive Ext" extends "Purchase Line Archive"
{
    fields
    {
        // field(50101; "Item Scheduled Date1"; Date)
        // {
        //     Caption = 'Item Scheduled Date1';
        //     DataClassification = ToBeClassified;
        //     Editable = false;
        // }

        // field(50102; "Item Scheduled Date2"; Date)
        // {
        //     Caption = 'Item Scheduled Date2';
        //     DataClassification = ToBeClassified;
        //     Editable = false;
        // }

        field(50103; "Container Number"; Text[30])
        {
            Caption = 'Container Number';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50104; "PO Line ID"; Integer)
        {
            Caption = 'PO Line ID';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50105; "Shipment ID"; Code[20])
        {
            Caption = 'Shipment ID';
            DataClassification = ToBeClassified;
        }
    }
}