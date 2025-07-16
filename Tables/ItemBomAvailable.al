table 50108 "Item Bom Available"
{
    Caption = 'Item BOM Available';
    DataClassification = ToBeClassified;
    Access = Internal;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            DataClassification = CustomerContent;
        }
        field(2; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(3; Available; Boolean)
        {
            Caption = 'Available';
            DataClassification = CustomerContent;
        }
        field(4; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = CustomerContent;
        }
        field(5; "Order Line No."; Integer)
        {
            Caption = 'Order Line No.';
            DataClassification = CustomerContent;
        }
        field(6; "Required Quantity"; Decimal)
        {
            Caption = 'Required Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(7; Weight; Decimal)
        {
            Caption = 'Weight';
            DataClassification = CustomerContent;
        }
        field(8; "Availability Count"; Integer)
        {
            Caption = 'Availability Count';
            FieldClass = FlowField;
            CalcFormula = count("Item Bom Available" where("Location Code" = field("Location Code"), Available = filter(true)));
        }
        field(9; "Actual Count"; Integer)
        {
            Caption = 'Actual Count';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Item No.", "Location Code")
        {
            Clustered = true;
        }
    }
}
