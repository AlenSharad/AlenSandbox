pageextension 50100 ContactCardExtension extends "Contact Card"
{
    layout
    {
        // Add changes to page layout here
        modify("Job Title")
        {
            Visible = true;
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}