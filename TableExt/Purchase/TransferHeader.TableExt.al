tableextension 50134 "Transfer Header Ext" extends "Transfer Header"
{
    fields
    {
        field(50100; "Container No."; Text[30])
        {
            Caption = 'Container No.';
            DataClassification = ToBeClassified;
        }
        field(50101; "Shipment ID"; Code[20])
        {
            Caption = 'Shipment ID';
            DataClassification = ToBeClassified;
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
    }
}