tableextension 50135 "Whse Receipt Header Ext" extends "Warehouse Receipt Header"
{
    fields
    {
        field(50100; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            DataClassification = ToBeClassified;
        }
        field(50101; "Error Description"; Text[250])
        {
            Caption = 'Error Description';
            DataClassification = ToBeClassified;
        }
    }
}