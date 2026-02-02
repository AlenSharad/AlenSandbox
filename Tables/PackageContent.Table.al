table 50111 "Package Content"
{
    Caption = 'Package Content';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Shipment No."; Code[20])
        {
            Caption = 'Shipment No.';
            DataClassification = CustomerContent;
        }
        field(2; "Posted Shipment No."; Code[20])
        {
            Caption = 'Posted Shipment No.';
            DataClassification = CustomerContent;
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
            TableRelation = Item;
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(6; TrackingNumber; Text[50])
        {
            Caption = 'Tracking Number';
            DataClassification = CustomerContent;
        }
        field(7; UCC; Text[50])
        {
            Caption = 'UCC';
            DataClassification = CustomerContent;
        }
        field(8; "Package Type"; Text[30])
        {
            Caption = 'Package Type';
            DataClassification = CustomerContent;
        }
        field(9; "Shipped Date"; Date)
        {
            Caption = 'Shipped Date';
            DataClassification = CustomerContent;
        }
        field(10; "Dealer Item Number"; Code[20])
        {
            Caption = 'Dealer Item Number';
            DataClassification = CustomerContent;
        }
        field(11; "Master Tracking No."; Text[50])
        {
            Caption = 'Master Tracking No.';
            DataClassification = CustomerContent;
        }
        field(50; "Created By"; Text[50])
        {
            Caption = 'Created By';
            DataClassification = CustomerContent;
        }
        field(51; "Created At"; DateTime)
        {
            Caption = 'Created At';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Shipment No.", "Item No.", "Line No.")
        {
            Clustered = true;
        }

    }
    trigger OnInsert()
    var
        myInt: Integer;
    begin
        "Created By" := UserId;
        "Created At" := CurrentDateTime();
    end;
}