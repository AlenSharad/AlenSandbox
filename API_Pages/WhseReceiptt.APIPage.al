
page 50136 "API - Warehouse Receipt"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Warehouse Receipt';
    EntitySetCaption = 'Warehouse Receipts';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = true;
    EntityName = 'warehouseReceipt';
    EntitySetName = 'warehouseReceipts';
    InsertAllowed = false;
    ModifyAllowed = true;
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Warehouse Receipt Header";
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
    Extensible = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(number; Rec."No.")
                {
                    Caption = 'No.';
                    Editable = false;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }

                field(docStatus; Rec."Document Status")
                {
                    Caption = 'Document Status';
                }
                field(vendorShipmentNo; Rec."Vendor Shipment No.")
                {
                    Caption = 'Vendor Shipment No.';
                }
                field(assignedUserID; Rec."Assigned User ID")
                {
                    Caption = 'Assigned User ID';
                }

                field(assignmentDate; Rec."Assignment Date")
                {
                    Caption = 'Assignment Date';
                }
                field(assignmentTime; Rec."Assignment Time")
                {
                    Caption = 'Assignment Time';
                }
                field(sortingMethod; Rec."Sorting Method")
                {
                    Caption = 'Sorting Method';
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'Source No.';
                }
                field(receivingNo; Rec."Receiving No.")
                {
                    Caption = 'Receiving No.';
                }
                field(createdAt; Rec.SystemCreatedAt)
                {
                    Caption = 'Created At';
                }
                field(createdBy; Rec.SystemCreatedBy)
                {
                    Caption = 'Created By';
                }
                field(modifiedAt; Rec.SystemModifiedAt)
                {
                    Caption = 'Modified At';
                }
                field(modifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'Modified By';
                }
                part(salesReceiptLines; "API - Warehouse Receipt Lines")
                {
                    Caption = 'Lines';
                    EntityName = 'warehouseReceiptLine';
                    EntitySetName = 'warehouseReceiptLines';
                    SubPageLink = "No." = field("No.");
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //SetCalculatedFields();
    end;

    trigger OnOpenPage()
    begin
    end;

    var
        CurrencyCodeTxt: Text;

    local procedure SetCalculatedFields()
    var
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        LCYCurrencyCode: Code[10];
    begin
        //CurrencyCodeTxt := GraphMgtGeneralTools.TranslateNAVCurrencyCodeToCurrencyCode(LCYCurrencyCode, Rec."Currency Code");
    end;
}