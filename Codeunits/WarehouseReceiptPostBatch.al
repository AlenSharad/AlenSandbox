codeunit 50110 WarehouseReceiptPostBatch
{
    Permissions = TableData "Whse. Item Tracking Line" = r,
                  TableData "Posted Whse. Receipt Header" = rim,
                  TableData "Posted Whse. Receipt Line" = ri,
                  tabledata "Warehouse Receipt Header" = rim,
                  tabledata "Warehouse Receipt Line" = rim;

    trigger OnRun()
    begin
        WhseRcptHeader.Reset();
        if WhseRcptHeader.FindSet() then
            repeat
                WhseRcptLine.Reset();
                WhseRcptLine.SetRange("No.", WhseRcptHeader."No.");
                WhseRcptLine.SetRange("Source Document", WhseRcptLine."Source Document"::"Inbound Transfer");
                WhseRcptLine.SetFilter("Qty. Outstanding", '<>%1', 0);
                if WhseRcptLine.FindSet() then
                    repeat
                        if not WhsePostReceipt.Run(WhseRcptLine) then begin
                            WhseRcptHeader.Get(WhseRcptLine."No.");
                            WhseRcptHeader."Error Description" := GetLastErrorText;
                            WhseRcptHeader.Modify(true);
                        end;
                        Clear(WhsePostReceipt);
                        //end;
                        Commit();
                    until WhseRcptLine.Next() = 0;
            until WhseRcptHeader.Next() = 0;
    end;

    var
        Invoice: Boolean;
        WhseRcptHeader: Record "Warehouse Receipt Header";
        WhseRcptLine: Record "Warehouse Receipt Line";
        WhsePostReceipt: Codeunit "Whse.-Post Receipt";
}