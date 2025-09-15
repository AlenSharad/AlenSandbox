tableextension 50137 ShipAgentServiceExtension extends "Shipping Agent Services"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Skip Auto Release"; Boolean)
        {
            Caption = 'Skip Auto Release';
            DataClassification = CustomerContent;
            ToolTip = 'ALN - Specifies whether to skip automatic release for this shipping agent service.';
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