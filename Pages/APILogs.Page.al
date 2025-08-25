page 50131 "API Logs"
{
    PageType = List;
    SourceTable = "API Log";
    ApplicationArea = All;
    Caption = 'API Logs';
    Editable = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field(URL; Rec.URL) { ApplicationArea = All; }
                field("API Name"; Rec."API Name") { ApplicationArea = All; }
                field(DocumentNo; Rec.DocumentNo) { ApplicationArea = All; }

                field(Method; Rec.Method) { ApplicationArea = All; }
                field(Request; Rec.Request)
                {
                    ApplicationArea = All;
                    ToolTip = 'ALN - The request sent to the API.';
                }
                field(Response; Rec.Response)
                {
                    ApplicationArea = All;
                    ToolTip = 'ALN - The response received from the API.';
                }
                field("Status Code"; Rec."Status Code") { ApplicationArea = All; }
                field(Success; Rec.Success) { ApplicationArea = All; }

                field("User ID"; Rec."User ID") { ApplicationArea = All; }
                field(LoggedOn; Rec.LoggedOn) { ApplicationArea = All; }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            action(DownloadReq)
            {
                ApplicationArea = All;
                Caption = 'Download Request';
                Image = New;
                trigger OnAction()
                begin
                    Rec.DownloadRequest();
                end;
            }
            action(DownloadRes)
            {
                ApplicationArea = All;
                Caption = 'Download Response';
                Image = New;
                trigger OnAction()
                begin
                    Rec.DownloadResponse();
                end;
            }
        }
        area(Promoted)
        {


            actionref(DownloadReqPromotedActionRef; DownloadReq)
            {
            }

            actionref(DownloadResPromotedActionRef; DownloadRes)
            {
            }
        }
    }

}