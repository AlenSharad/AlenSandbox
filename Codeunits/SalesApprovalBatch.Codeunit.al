codeunit 50104 "Sales Order Release Processor"
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
        SH2: Record "Sales Header";
        SAS: Record "Shipping Agent Services";
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
            //SalesHeader.SetRange("Location Assigned", true);
            if SalesHeader.FindSet() then
                repeat
                    SAS.Reset();
                    if SAS.Get(SalesHeader."Shipping Agent Code", SalesHeader."Shipping Agent Service Code") then
                        if SAS."Skip Auto Release" then
                            continue;
                    customer.Get(SalesHeader."Sell-to Customer No.");
                    if (customer."Blocked" <> customer."Blocked"::"Release") then begin
                        SalesLine.Reset();
                        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                        SalesLine.SetRange("Document No.", SalesHeader."No.");
                        SalesLine.Setfilter(Quantity, '<>%1', 0);
                        if Not SalesLine.IsEmpty then begin
                            if NOT SORelease.Run(SalesHeader) then begin
                                SH2.Reset();
                                SH2.Get(SalesHeader."Document Type", SalesHeader."No.");
                                SH2."Error Description" := GetLastErrorText;
                                SH2.Modify(true);
                            end;

                        end;
                        // SalesHeader.PerformManualRelease();
                    end else begin
                        SH2.Reset();
                        SH2.Get(SalesHeader."Document Type", SalesHeader."No.");
                        SH2."Error Description" := 'Customer is blocked for release';
                        SH2.Modify(true);
                    end;
                    Commit();
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