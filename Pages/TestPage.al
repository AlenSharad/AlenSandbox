page 50120 PageName
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "BOM Buffer";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Name; Rec."No.")
                {

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Assembly;
                    Editable = false;
                    ToolTip = 'Specifies the item''s description.';
                }
                field("Location Code"; Rec."Location Code")
                {

                }
                field(Bottleneck; Rec.Bottleneck)
                {
                    ApplicationArea = Assembly;
                    Editable = false;
                    Style = Strong;
                    StyleExpr = true;
                    ToolTip = 'Specifies which item in the BOM structure restricts you from making a larger quantity than what is shown in the Able to Make Top Item field.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant code that you entered in the Variant Filter field in the Item Availability by BOM Level window.';
                    Visible = false;
                }
                field("Qty. per Parent"; Rec."Qty. per Parent")
                {
                    ApplicationArea = Assembly;
                    DecimalPlaces = 0 : 5;
                    Editable = false;
                    ToolTip = 'Specifies how many units of the component are required to assemble or produce one unit of the parent.';
                }
                field("Qty. per Top Item"; Rec."Qty. per Top Item")
                {
                    ApplicationArea = Assembly;
                    DecimalPlaces = 0 : 5;
                    Editable = false;
                    ToolTip = 'Specifies how many units of the component are required to assemble or produce one unit of the top item.';
                    Visible = false;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Assembly;
                    Editable = false;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Replenishment System"; Rec."Replenishment System")
                {
                    ApplicationArea = Assembly;
                    Editable = false;
                    ToolTip = 'Specifies the item''s replenishment system.';
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                    ApplicationArea = Assembly;
                    BlankZero = true;
                    Editable = false;
                    ToolTip = 'Specifies how many units of the item on the line are available, regardless of how many parents you can make with the item.';
                }
                field("Unused Quantity"; Rec."Unused Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the part of the item''s total availability that is not required to make the quantities that are shown in the fields.';
                    Visible = false;
                }
                field("Needed by Date"; Rec."Needed by Date")
                {
                    ApplicationArea = Assembly;
                    Editable = false;
                    ToolTip = 'Specifies when the item must be available to make the parent or top item.';
                }
                field("Able to Make Parent"; Rec."Able to Make Parent")
                {
                    ApplicationArea = Assembly;
                    BlankZero = true;
                    Editable = false;
                    ToolTip = 'Specifies how many units of the BOM item on the collapsible line above it can be assembled or produced.';
                }
                field("Able to Make Top Item"; Rec."Able to Make Top Item")
                {
                    ApplicationArea = Assembly;
                    BlankZero = true;
                    Editable = false;
                    ToolTip = 'Specifies how many units of the BOM item on the top line can be assembled or produced.';
                }
                field("Gross Requirement"; Rec."Gross Requirement")
                {
                    ApplicationArea = Basic, Suite;
                    BlankZero = true;
                    Editable = false;
                    ToolTip = 'Specifies the total demand for the item.';
                    Visible = false;
                }
                field("Scheduled Receipts"; Rec."Scheduled Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    BlankZero = true;
                    Editable = false;
                    ToolTip = 'Specifies how many units of the item are inbound on orders.';
                    Visible = false;
                }
                field("Safety Lead Time"; Rec."Safety Lead Time")
                {
                    ApplicationArea = Planning;
                    Editable = false;
                    ToolTip = 'Specifies any safety lead time that is defined for the item.';
                    Visible = false;
                }
                field("Rolled-up Lead-Time Offset"; Rec."Rolled-up Lead-Time Offset")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the cumulative lead time of components under a parent item.';
                    Visible = false;
                }
            }
        }


    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                var
                    LA: Codeunit "LocationAssignment";
                begin
                    LA.RefreshPage2();
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.DeleteAll();
    end;
}