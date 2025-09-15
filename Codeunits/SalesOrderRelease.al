codeunit 50105 "Release Sales Order"
{
    TableNo = "Sales Header";
    Permissions = TableData "Sales Header" = rm,
                  TableData "Sales Line" = r, tabledata "Sales Invoice Header" = rm;

    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Copy(Rec);
        SalesHeader.PerformManualRelease();
        Rec := SalesHeader;
    end;

    procedure ReSendInvoice(var SalesInvHeader: Record "Sales Invoice Header")
    begin
        if SalesInvHeader."Invoice Sent" then begin
            SalesInvHeader."Invoice Sent" := false;
            SalesInvHeader.Modify();
        end;
    end;
}