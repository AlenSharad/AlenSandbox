pageextension 50124 ItemReferencePageExtension extends "Item Reference Entries"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Item ID"; Rec."Item ID")
            {
                ApplicationArea = All;
                Caption = 'Item ID';
                ToolTip = 'The unique identifier for the item.';
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