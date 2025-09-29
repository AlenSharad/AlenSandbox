
page 50141 "API - Sales Invoice Lines"
{
    DelayedInsert = true;
    APIVersion = 'v2.0';
    EntityCaption = 'Sales Invoice Line';
    EntitySetCaption = 'Sales Invoice Lines';
    PageType = API;
    ODataKeyFields = SystemId;
    EntityName = 'salesInvoiceLine';
    EntitySetName = 'salesInvoiceLines';
    SourceTable = "Sales Invoice Line";
    APIPublisher = 'ALEN';
    APIGroup = 'BCAPI';
    Extensible = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where(Type = const(Item));
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

                    trigger OnValidate()
                    begin
                        // if (not IsNullGuid(xRec."Document Id")) and (xRec."Document Id" <> Rec."Document Id") then
                        //     Error(CannotChangeDocumentIdNoErr);
                    end;
                }
                field(sequence; Rec."Line No.")
                {
                    Caption = 'Sequence';

                    trigger OnValidate()
                    begin
                        if (xRec."Line No." <> Rec."Line No.") and
                           (xRec."Line No." <> 0)
                        then
                            Error(CannotChangeLineNoErr);

                    end;
                }
                field(lineType; Rec.Type)
                {
                    Caption = 'Item Id';
                }
                field(itemId; Rec."No.")
                {
                    Caption = 'Item Id';

                    // trigger OnValidate()
                    // begin
                    //     if not Item.GetBySystemId(Rec."Item Id") then
                    //         Error(ItemDoesNotExistErr);

                    //     RegisterFieldSet(Rec.FieldNo(Type));
                    //     RegisterFieldSet(Rec.FieldNo("No."));
                    //     RegisterFieldSet(Rec.FieldNo("Item Id"));

                    //     Rec."No." := Item."No.";
                    // end;
                }

                field(lineObjectNumber; Rec."No.")
                {
                    Caption = 'Line Object No.';

                    trigger OnValidate()
                    var
                        GLAccount: Record "G/L Account";
                    begin
                        if (xRec."No." <> Rec."No.") and (xRec."No." <> '') then
                            Error(CannotChangeLineObjectNoErr);

                        // case Rec."API Type" of
                        //     Rec."API Type"::Item:
                        //         begin
                        //             if not Item.Get(Rec."No.") then
                        //                 Error(ItemDoesNotExistErr);

                        //             RegisterFieldSet(Rec.FieldNo("Item Id"));
                        //             Rec."Item Id" := Item.SystemId;
                        //         end;
                        //     Rec."API Type"::Account:
                        //         begin
                        //             if not GLAccount.Get(Rec."No.") then
                        //                 Error(AccountDoesNotExistErr);

                        //             RegisterFieldSet(Rec.FieldNo("Account Id"));
                        //             Rec."Account Id" := GLAccount.SystemId;
                        //         end;
                        // end;
                        // RegisterFieldSet(Rec.FieldNo("No."));
                    end;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(unitOfMeasureId; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit Of Measure Id';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'Unit Of Measure Code';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'Unit Price';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(discountAmount; Rec."Line Discount Amount")
                {
                    Caption = 'Discount Amount';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(discountPercent; Rec."Line Discount %")
                {
                    Caption = 'Discount Percent';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(lineDiscount; Rec."Line Discount Amount")
                {
                    Caption = 'Line Discount';
                    Editable = false;
                }
                field(amountExcludingTax; Rec."Line Amount")
                {
                    Caption = 'Amount Excluding Tax';
                    Editable = false;

                    trigger OnValidate()
                    begin
                    end;
                }
                field(taxCode; Rec."Tax Area Code")
                {
                    Caption = 'Tax Code';

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
                field(amountIncludingTax; Rec."Amount Including VAT")
                {
                    Caption = 'Amount Including Tax';
                    Editable = false;

                    trigger OnValidate()
                    begin
                    end;
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

                    trigger OnValidate()
                    begin
                    end;
                }

                field(locationId; Rec."Location Code")
                {
                    Caption = 'Location Id';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(shopifyVariantId; Rec."Shopify Variant Id")
                {
                    Caption = 'Shopify Variant Id';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(dealerItemNo; Rec."Dealer Item No.")
                {
                    Caption = 'Dealer Item No.';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(discountDetails; Rec."Discount Details")
                {
                    Caption = 'Discount Details';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(amazonItemId; Rec."Amazon Item ID")
                {
                    Caption = 'Amazon Item ID';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(upcCode; Rec.UPC_Code)
                {
                    Caption = 'Marketplace UPC Code';


                }
                field(poLine; Rec."PO Line")
                {
                    Caption = 'PO Line';

                    trigger OnValidate()
                    begin
                    end;
                }
                field(totalWeight; Rec."Gross Weight")
                {
                    Caption = 'Total Weight';
                }
                field(totalCubageFT; Rec."Total Cubage FT")
                {
                    Caption = 'Total Cubage FT';
                }
                field(customerSubscription; Rec."Customer Subscription No.")
                {
                    Caption = 'Customer Subscription No.';


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
                    SubPageLink = SystemId = field("Location Code");
                }
            }
        }
    }

    actions
    {
    }


    var
        TempFieldBuffer: Record "Field Buffer" temporary;
        TempItemFieldSet: Record 2000000041 temporary;
        Item: Record "Item";
        LinesLoaded: Boolean;
        IDOrDocumentIdShouldBeSpecifiedForLinesErr: Label 'You must specify an Id or a Document Id to get the lines.';
        CannotChangeDocumentIdNoErr: Label 'The value for "documentId" cannot be modified.', Comment = 'documentId is a field name and should not be translated.';
        CannotChangeLineNoErr: Label 'The value for "sequence" cannot be modified. Delete and insert the line again.', Comment = 'sequence is a field name and should not be translated.';
        BothItemIdAndAccountIdAreSpecifiedErr: Label 'Both "itemId" and "accountId" are specified. Specify only one of them.', Comment = 'itemId and accountId are field names and should not be translated.';
        ItemDoesNotExistErr: Label 'Item does not exist.';
        AccountDoesNotExistErr: Label 'Account does not exist.';
        CannotChangeLineObjectNoErr: Label 'The value for "lineObjectNumber" cannot be modified.', Comment = 'lineObjectNumber is a field name and should not be translated.';



}