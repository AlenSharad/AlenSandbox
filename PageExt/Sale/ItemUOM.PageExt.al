pageextension 50134 "Item Unit of Measures Ext" extends "Item Units of Measure"
{
    layout
    {
        // Add changes to page layout here
        addafter(Cubage)
        {
            field(Dimension; Rec.Dimension)
            {
                ApplicationArea = all;
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