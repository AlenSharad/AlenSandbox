tableextension 50104 ContactExtension extends Contact
{
    fields
    {
        // Add changes to table fields here
        field(50010; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}