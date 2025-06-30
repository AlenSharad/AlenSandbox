tableextension 50102 CustomerBankExtension extends "Customer Bank Account"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Card Type"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Card State"; Text[30])
        {
            DataClassification = ToBeClassified;
        }

    }

}