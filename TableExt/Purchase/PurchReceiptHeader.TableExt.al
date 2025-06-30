tableextension 50116 "Purchase Receipt Header Ext" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50101; "Manager Notes"; Text[100])
        {
            Caption = 'Manager Notes';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50102; "Actual Location Address"; Text[50])
        {
            Caption = 'Actual Location Address';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}