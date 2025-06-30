
page 50111 "Order Type List"
{
    PageType = List;
    SourceTable = "Order Type";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {

    }
}