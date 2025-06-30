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
                ToolTip = 'Specifies the value of the Address Type field.', Comment = '%';
            }
            field(IsResidential; Rec.IsResidential)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Residential Address field.', Comment = '%';
            }
            field("Label"; Rec."Label")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Label field.', Comment = '%';
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