
page 50112 "Order Source List"
{
    PageType = List;
    SourceTable = "Order Source";
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

}