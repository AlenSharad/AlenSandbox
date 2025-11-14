codeunit 50109 PurchaeseEvents
{
    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", OnAfterCreateRcptHeader, '', false, false)]
    local procedure UpdateSourceNoOnAfterCreateRcptHeader(var WarehouseReceiptHeader: Record "Warehouse Receipt Header"; PurchaseLine: Record "Purchase Line")
    begin
        WarehouseReceiptHeader."Source No." := PurchaseLine."Document No.";
        WarehouseReceiptHeader.Modify();
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", OnTransferLineOnAfterCreateRcptHeader, '', false, false)]
    local procedure UpdateSourceNoOnTransferLineOnAfterCreateRcptHeader(TransferHeader: Record "Transfer Header"; var WhseReceiptHeader: Record "Warehouse Receipt Header")
    begin
        WhseReceiptHeader."Source No." := TransferHeader."No.";
        WhseReceiptHeader.Modify();
    end;
}