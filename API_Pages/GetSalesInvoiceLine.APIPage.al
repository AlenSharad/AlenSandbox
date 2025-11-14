
page 50146 "API - Get Sales Invoice Lines"
{
    DelayedInsert = true;
    APIVersion = 'v2.0';
    EntityCaption = 'Sales Invoice Line';
    EntitySetCaption = 'Sales Invoice Lines';
    PageType = API;
    ODataKeyFields = SystemId;
    EntityName = 'getSalesInvoiceList';
    EntitySetName = 'getSalesInvoiceList';
    SourceTable = "Sales Line";
    SourceTableView = where("Document Type" = filter(Invoice));
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
    Extensible = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
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
                field(documentId; Rec."Document No.")
                {
                    Caption = 'Document Id';
                }
                field(sequence; Rec."Line No.")
                {
                    Caption = 'Sequence';

                }
                field(itemId; Rec."No.")
                {
                    Caption = 'Item Id';
                }

                field(lineType; Rec.Type)
                {
                    Caption = 'Line Type';
                }

                field(description; Rec.Description)
                {
                    Caption = 'Description';

                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';

                }

                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit Of Measure Code';

                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';


                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';
                }
                field(bcUnitPrice; Rec."BC Unit Price")
                {
                    Caption = 'BC Unit Price';
                }
                field(discountAmount; Rec."Line Discount Amount")
                {
                    Caption = 'Discount Amount';

                }
                field(discountPercent; Rec."Line Discount %")
                {
                    Caption = 'Discount Percent';

                }
                field(itemType; Rec."Item Type")
                {
                    Caption = 'Item Type';

                }
                field(StoreFront_LineAmount; Rec.StoreFront_LineAmount)
                {
                    Caption = 'Store Front Line Amount';


                }
                field(amountExcludingTax; Rec."Line Amount")
                {
                    Caption = 'Amount Excluding Tax';
                    Editable = false;

                }
                field(taxGroupCode; Rec."Tax Group Code")
                {
                    Caption = 'Tax Group Code';

                }

                field(lineTaxAmount; Rec."Line Tax Amount")
                {
                    Caption = 'Line Tax Amount';

                }
                field(taxPercent; Rec."VAT %")
                {
                    Caption = 'Tax Percent';
                    Editable = false;
                }
                field(totalTaxAmount; Rec."Line Tax Amount")
                {
                    Caption = 'Total Tax Amount';
                    Editable = false;
                }

                field(invoiceDiscountAmount; Rec."Inv. Discount Amount")
                {
                    Caption = 'Invoice Discount Amount';
                    Editable = false;
                }
                field(netAmount; Rec.Amount)
                {
                    Caption = 'Net Amount';
                    Editable = false;
                }
                field(netTaxAmount; Rec."Ava Tax Amount")
                {
                    Caption = 'Net Tax Amount';
                    Editable = false;
                }
                field(netAmountIncludingTax; Rec."Amount Including VAT")
                {
                    Caption = 'Net Amount Including Tax';
                    Editable = false;
                }
                field(shipmentDate; Rec."Shipment Date")
                {
                    Caption = 'Shipment Date';
                }
                field(shippedQuantity; Rec."Quantity Shipped")
                {
                    Caption = 'Shipped Quantity';

                }
                field(invoicedQuantity; Rec."Quantity Invoiced")
                {
                    Caption = 'Invoiced Quantity';

                }
                field(invoiceQuantity; Rec."Qty. to Invoice")
                {
                    Caption = 'Invoice Quantity';

                }
                field(shipQuantity; Rec."Qty. to Ship")
                {
                    Caption = 'Ship Quantity';

                }
                field(totalWeight; Rec."Gross Weight")
                {
                    Caption = 'Total Weight';
                }
                field(totalCubageFT; Rec."Total Cubage FT")
                {
                    Caption = 'Total Cubage FT';
                }
                field(netWeight; Rec."Net Weight")
                {
                    Caption = 'Net Weight';
                }

                field(locationId; Rec."Location Code")
                {
                    Caption = 'Location Id';

                }
                field(customerSubscription; Rec."Customer Subscription No.")
                {
                    Caption = 'Customer Subscription No.';

                }
                field(avaLineOverrideType; Rec."Ava Line Override Type")
                {
                    Caption = 'Ava Line Override Type';

                }
                field(avaLineOverrideAmount; Rec."Ava Line Override Amount")
                {
                    Caption = 'Ava Line Override Amount';

                }
                field(avaLineOverrideReason; Rec."Ava Line Override Reason")
                {
                    Caption = 'Ava Line Override Reason';

                }
                field(shopifyVariantId; Rec."Shopify Variant Id")
                {
                    Caption = 'Shopify Variant Id';


                }
                field(dealerItemNo; Rec."Dealer Item No.")
                {
                    Caption = 'Dealer Item No.';


                }
                field(discountDetails; Rec."Discount Details")
                {
                    Caption = 'Discount Details';

                }
                field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Shortcut Dimension 1 Code';


                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';

                }
                field(amazonItemId; Rec."Amazon Item ID")
                {
                    Caption = 'Amazon Item ID';

                }
                field(upcCode; Rec.UPC_Code)
                {
                    Caption = 'Marketplace UPC Code';

                }
                field(poLine; Rec."PO Line")
                {
                    Caption = 'PO Line';

                }
                part(dimensionSetLines; "APIV2 - Dimension Set Lines")
                {
                    Caption = 'Dimension Set Lines';
                    EntityName = 'dimensionSetLine';
                    EntitySetName = 'dimensionSetLines';
                    SubPageLink = "Parent Id" = field(SystemId), "Parent Type" = const("Sales Invoice Line");
                }
                part(location; "APIV2 - Locations")
                {
                    Caption = 'Location';
                    EntityName = 'location';
                    EntitySetName = 'locations';
                    Multiplicity = ZeroOrOne;
                    SubPageLink = Code = field("Location Code");
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
    end;


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
    begin

    end;

    trigger OnModifyRecord(): Boolean
    var
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
    end;

    var
        TempFieldBuffer: Record "Field Buffer" temporary;
        TempItemFieldSet: Record 2000000041 temporary;
        Item: Record "Item";
        LinesLoaded: Boolean;
        IDOrDocumentIdShouldBeSpecifiedForLinesErr: Label 'You must specify an Id or a Document Id to get the lines.';
        CannotChangeDocumentIdNoErr: Label 'The value for "documentId" cannot be modified.', Comment = 'documentId is a field name and should not be translated.';
        CannotChangeLineNoErr: Label 'The value for sequence cannot be modified. Delete and insert the line again.';
        BothItemIdAndAccountIdAreSpecifiedErr: Label 'Both "itemId" and "accountId" are specified. Specify only one of them.', Comment = 'itemId and accountId are field names and should not be translated.';
        ItemDoesNotExistErr: Label 'Item does not exist.';
        AccountDoesNotExistErr: Label 'Account does not exist.';
        CannotChangeLineObjectNoErr: Label 'The value for "lineObjectNumber" cannot be modified.', Comment = 'lineObjectNumber is a field name and should not be translated.';

}