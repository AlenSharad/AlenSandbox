pageextension 50102 ShipToAddExtension extends "Ship-to Address"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {

            field(AddressType; Rec.AddressType)
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Address Type field.';
            }
            field(IsResidential; Rec.IsResidential)
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Residential Address field.';
            }
            field("Label"; Rec."Label")
            {
                ApplicationArea = All;
                ToolTip = 'ALN - Specifies the value of the Label field.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}