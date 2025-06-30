tableextension 50101 ShipToAddressExtension extends "Ship-to Address"
{
    fields
    {
        // Add changes to table fields here
        field(50000; IsResidential; Boolean)
        {
            Caption = 'Residential Address';
            DataClassification = ToBeClassified;
        }
        field(50001; AddressType; Option)
        {
            Caption = 'Address Type';
            OptionMembers = "","Default Billing","Default Shipping";
            DataClassification = ToBeClassified;
        }
        field(50002; Label; Text[100])
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