pageextension 50109 "Purchase Order Page Ext" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("Manager Notes"; Rec."Manager Notes")
            {
                ApplicationArea = All;
                Caption = 'Manager Notes';
                ToolTip = 'ALN - Notes added by the manager regarding this purchase order.';
            }

            field("Actual Location Address"; Rec."Actual Location Address")
            {
                ApplicationArea = All;
                Caption = 'Actual Location Address';
                ToolTip = 'ALN - The address of the actual location where the goods were ordered.';
            }
        }
        addafter(Prepayment)
        {
            group(SystemDetails)
            {
                Caption = 'System Details';
                field("Created By"; GetUserNameFromSecurityId(Rec.SystemCreatedBy))
                {
                    ApplicationArea = All;
                    Caption = 'Created By';
                    Importance = Standard;
                    ToolTip = 'ALN - Shows the user who created this record.';
                }
                field("Created At"; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Created At';
                    Importance = Standard;
                    ToolTip = 'ALN - Shows the date and time when this record was created.';
                }
                field("Modified By"; GetUserNameFromSecurityId(Rec.SystemModifiedBy))
                {
                    ApplicationArea = All;
                    Caption = 'Modified By';
                    Importance = Standard;
                    ToolTip = 'ALN - Shows the user who last modified this record.';
                }
                field("Modified At"; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Modified At';
                    Importance = Standard;
                    ToolTip = 'ALN - Shows the date and time when this record was last modified.';
                }
                // field("Error Description"; Rec."Error Description")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Error Description';
                //     Editable = false;
                //     ToolTip = 'ALN - Provides details about any errors associated with the order.';
                // }
            }
        }
    }
    procedure GetUserNameFromSecurityId(UserSecurityID: Guid): Code[50]
    var
        User: Record User;
    begin
        if User.Get(UserSecurityID) then
            exit(User."User Name")
        else
            exit('');

    end;
}