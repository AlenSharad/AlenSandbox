codeunit 50106 WarehouseShipmentPostBatch
{
    Permissions = TableData "Whse. Item Tracking Line" = r,
                  TableData "Posted Whse. Shipment Header" = rim,
                  TableData "Posted Whse. Shipment Line" = ri,
                  tabledata "Warehouse Shipment Header" = rim,
                  tabledata "Warehouse Shipment Line" = rim;

    trigger OnRun()
    begin
        WhseShptHeader.Reset();
        WhseShptHeader.SetCurrentKey(Processed);
        WhseShptHeader.SetRange(Processed, true);
        if WhseShptHeader.FindSet() then
            repeat
                WhseShptLine.Reset();
                WhseShptLine.SetRange("No.", WhseShptHeader."No.");
                //WhseShptLine.SetFilter("Qty. to Ship", '<>%1', 0);
                if WhseShptLine.FindSet() then
                    repeat
                        //if WhseShptLine."Qty. to Ship" <> 0 then begin
                        WhsePostShipment.SetPostingSettings(true);
                        WhsePostShipment.SetPrint(false);
                        if not WhsePostShipment.Run(WhseShptLine) then begin
                            WhseShptHeader.Get(WhseShptLine."No.");
                            WhseShptHeader."Error Description" := GetLastErrorText;
                            WhseShptHeader.Modify(true);
                        end;
                        Clear(WhsePostShipment);
                        //end;
                        Commit();
                    until WhseShptLine.Next() = 0;
            until WhseShptHeader.Next() = 0;
    end;

    var
        Invoice: Boolean;
        WhseShptHeader: Record "Warehouse Shipment Header";
        WhseShptLine: Record "Warehouse Shipment Line";
        WhsePostShipment: Codeunit "Whse.-Post Shipment";
}