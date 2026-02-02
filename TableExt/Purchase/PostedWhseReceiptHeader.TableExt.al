tableextension 50136 "Posted Whse Receipt Header Ext" extends "Posted Whse. Receipt Header"
{
    fields
    {
        field(50100; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            Editable = false;
            DataClassification = ToBeClassified;
        }
    }
}