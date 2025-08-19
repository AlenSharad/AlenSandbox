codeunit 50104 "Sales Order Approval Processor"
{

    Subtype = Normal;
    TableNo = "Job Queue Entry";
    Permissions = tabledata "Sales Header" = rm,
                    tabledata "Sales Line" = rm;


    trigger OnRun()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        customer: Record Customer;
        SORelease: Codeunit "Release Sales Order";
    begin

        if Rec."Parameter String" = 'Sales Order Approval' then begin
            SalesHeader.Reset();
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
            SalesHeader.SetRange(Status, SalesHeader.Status::Open);
            SalesHeader.SetFilter("Order Total Variance", '>%1', 0);
            if SalesHeader.FindSet() then
                repeat
                    ProcessSalesOrderApproval(SalesHeader);
                until SalesHeader.Next() = 0;
        end;
        if Rec."Parameter String" = 'Sales Order Release' then begin
            SalesHeader.Reset();
            SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
            SalesHeader.SetRange(Status, SalesHeader.Status::Open);
            SalesHeader.SetRange("Order Total Variance", 0);
            SalesHeader.SetFilter("Location Code", '<>%1', '');
            if SalesHeader.FindSet() then
                repeat
                    customer.Get(SalesHeader."Sell-to Customer No.");
                    if (customer."Blocked" <> customer."Blocked"::"Release") then begin
                        SalesLine.Reset();
                        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                        SalesLine.SetRange("Document No.", SalesHeader."No.");
                        SalesLine.Setfilter(Quantity, '<>%1', 0);
                        if Not SalesLine.IsEmpty then
                            SalesHeader.PerformManualRelease();
                    end;
                until SalesHeader.Next() = 0;
        end;

    end;

    procedure ProcessSalesOrderApproval(var SalesHeader: Record "Sales Header")
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        cc: Codeunit 384;
    begin
        if IsApprovalRequired(SalesHeader) then begin
            if ApprovalsMgmt.CheckSalesApprovalPossible(SalesHeader) then
                ApprovalsMgmt.OnSendSalesDocForApproval(SalesHeader);
        end;
    end;

    procedure IsApprovalRequired(SalesHeader: Record "Sales Header"): Boolean
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        exit(ApprovalsMgmt.IsSalesHeaderPendingApproval(SalesHeader));
    end;

    [ServiceEnabled]
    procedure RunBatch()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange(Status, SalesHeader.Status::Open);
        if SalesHeader.FindSet() then
            repeat
                ProcessSalesOrderApproval(SalesHeader);
            until SalesHeader.Next() = 0;
    end;
}