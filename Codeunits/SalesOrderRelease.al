codeunit 50105 "Release Sales Order"
{
    TableNo = "Sales Header";
    Permissions = TableData "Sales Header" = rm,
                  TableData "Sales Line" = r;

    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.Copy(Rec);
        SalesHeader.PerformManualRelease();
        Rec := SalesHeader;
    end;
}