tableextension 50122 ItemReferenceExtension extends "Item Reference"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Item ID"; Guid)
        {
            Caption = 'Item ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}