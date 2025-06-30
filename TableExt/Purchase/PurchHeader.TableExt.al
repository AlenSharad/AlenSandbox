tableextension 50114 "Purchase Header Ext" extends "Purchase Header"
{
    fields
    {
        field(50101; "Manager Notes"; Text[100])
        {
            Caption = 'Manager Notes';
            DataClassification = ToBeClassified;
        }

        field(50102; "Actual Location Address"; Text[50])
        {
            Caption = 'Actual Location Address';
            DataClassification = ToBeClassified;
        }
    }
}