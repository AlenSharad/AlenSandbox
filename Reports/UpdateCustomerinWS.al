report 50200 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    // DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            trigger OnAfterGetRecord()
            var
                salesheader: Record "Sales Header";
            begin
                salesheader.Reset();
                if salesheader.Get(salesheader."Document Type"::Order, "Warehouse Shipment Header"."Source No.") then begin
                    // You can add code here to process the salesheader record if needed
                    "Warehouse Shipment Header"."Customer No." := salesheader."Sell-to Customer No.";
                    "Warehouse Shipment Header"."Customer Name" := salesheader."Sell-to Customer Name";
                    "Warehouse Shipment Header"."Customer Posting Group" := salesheader."Customer Posting Group";
                    "Warehouse Shipment Header".Modify();
                end;
            end;
        }
        dataitem("Posted Whse. Shipment Header"; "Posted Whse. Shipment Header")
        {
            trigger OnAfterGetRecord()
            var
                salesheader: Record "Sales Shipment Header";
            begin
                salesheader.Reset();
                salesheader.SetRange("Order No.", "Posted Whse. Shipment Header"."Source No.");
                if salesheader.FindFirst() then begin
                    "Posted Whse. Shipment Header"."Customer No." := salesheader."Sell-to Customer No.";
                    "Posted Whse. Shipment Header"."Customer Name" := salesheader."Sell-to Customer Name";
                    "Posted Whse. Shipment Header"."Customer Posting Group" := salesheader."Customer Posting Group";
                    "Posted Whse. Shipment Header".Modify();
                end;
            end;
        }
    }
}