page 50152 "API - Posted Purch. Inv. Line"
{
    APIVersion = 'v2.0';
    EntityCaption = 'Posted Purchase Invoice Line';
    EntitySetCaption = 'Posted Purchase Invoice Lines';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'postedPurchaseInvoiceLine';
    EntitySetName = 'postedPurchaseInvoiceLines';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Purch. Inv. Line";
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
    Extensible = true;
    ModifyAllowed = false;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                    Editable = false;
                }
                field(sequence; Rec."Line No.")
                {
                    Caption = 'Line No.';
                    Editable = false;
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                    Editable = false;
                }
                field(itemNo; Rec."No.")
                {
                    Caption = 'Item No.';
                    Editable = false;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                    Editable = false;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                    Editable = false;
                }
                field(unitOfMeasure; Rec."Unit of Measure")
                {
                    Caption = 'Unit of Measure';
                    Editable = false;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                    Editable = false;
                }
                field(directUnitCost; Rec."Direct Unit Cost")
                {
                    Caption = 'Direct Unit Cost';
                    Editable = false;
                }
                field(unitCost; Rec."Unit Cost")
                {
                    Caption = 'Unit Cost';
                    Editable = false;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    Editable = false;
                }
                field(amountIncludingVAT; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including VAT';
                    Editable = false;
                }
                field(discountAmount; Rec."Line Discount %")
                {
                    Caption = 'Line Discount %';
                    Editable = false;
                }
                field(lineDiscountAmount; Rec."Line Discount Amount")
                {
                    Caption = 'Line Discount Amount';
                    Editable = false;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                    Editable = false;
                }
                field(unitPriceVATInclusive; Rec."Unit Price (LCY)")
                {
                    Caption = 'Unit Price VAT Inclusive';
                    Editable = false;
                }
                field(vatBaseAmount; Rec."VAT Base Amount")
                {
                    Caption = 'VAT Base Amount';
                    Editable = false;
                }
                field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
                {
                    Caption = 'VAT Prod. Posting Group';
                    Editable = false;
                }
                // field(dimensionSetID; Rec."Dimension Set ID")
                //  {
                //      Caption = 'Dimension Set ID';
                //       }
                // field(jobNo; Rec."Job No.") 
                // { 
                //     Caption = 'Job No.'; 
                //     }
                // field(jobTaskNo; Rec."Job Task No.") { Caption = 'Job Task No.'; }
                // field(jobLineType; Rec."Job Line Type") { Caption = 'Job Line Type'; }
                // field(jobUnitPrice; Rec."Job Unit Price") { Caption = 'Job Unit Price'; }
                // field(jobLineAmount; Rec."Job Line Amount") { Caption = 'Job Line Amount'; }
                // field(jobLineDiscountAmount; Rec."Job Line Discount Amount") { Caption = 'Job Line Discount Amount'; }
                // field(jobLineDiscount; Rec."Job Line Discount %") { Caption = 'Job Line Discount %'; }
                // field(jobTotalPrice; Rec."Job Total Price") { Caption = 'Job Total Price'; }
                // field(jobUnitPriceLCY; Rec."Job Unit Price (LCY)") { Caption = 'Job Unit Price (LCY)'; }
                // field(jobTotalPriceLCY; Rec."Job Total Price (LCY)") { Caption = 'Job Total Price (LCY)'; }
                // field(jobLineAmountLCY; Rec."Job Line Amount (LCY)") { Caption = 'Job Line Amount (LCY)'; }
                // field(jobLineDiscAmountLCY; Rec."Job Line Disc. Amount (LCY)") { Caption = 'Job Line Disc. Amount (LCY)'; }
                // field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { Caption = 'Gen. Bus. Posting Group'; }
                field(totalTaxAmount; (Rec."Amount Including VAT" - Rec.Amount))
                {
                    Caption = 'Total Tax Amount';
                    Editable = false;
                }
                field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
                {
                    Caption = 'Gen. Prod. Posting Group';
                    Editable = false;
                }
                field(vatCalculationType; Rec."VAT Calculation Type")
                {
                    Caption = 'VAT Calculation Type';
                    Editable = false;
                }
                field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
                {
                    Caption = 'VAT Bus. Posting Group';
                    Editable = false;
                }
                field(expectedReceiptDate; Rec."Expected Receipt Date")
                {
                    Caption = 'Expected Receipt Date';
                    Editable = false;
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                    Editable = false;
                }
                field(orderLineNo; Rec."Order Line No.")
                {
                    Caption = 'Order Line No.';
                    Editable = false;
                }
                field(ContainerNumber; Rec."Container Number")
                {
                    Caption = 'Container Number';
                    Editable = false;
                }
                field(shipmentID; Rec."Shipment ID")
                {
                    Caption = 'Shipment ID';
                    Editable = false;
                }
                field(vendorItemNo; Rec."Vendor Item No.")
                {
                    Caption = 'Vendor Item No.';
                    Editable = false;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                    Editable = false;
                }
                field(createdDateTime; Rec.SystemCreatedAt)
                {
                    Caption = 'Created Date';
                    Editable = false;
                }
                field(modifiedBy; Rec.SystemModifiedBy)
                {
                    Caption = 'Modified By';
                    Editable = false;
                }
                field(createdBy; Rec.SystemCreatedBy)
                {
                    Caption = 'Created By';
                    Editable = false;
                }
            }
        }
    }
}