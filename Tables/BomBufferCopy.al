
table 50107 "BOM Buffer Copy"
{
    Caption = 'BOM Buffer Copy';
    DataCaptionFields = "No.", Description;
    Permissions =;
    ReplicateData = false;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; Type; Enum "BOM Type")
        {
            Caption = 'Type';
            DataClassification = SystemMetadata;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = SystemMetadata;
            TableRelation = if (Type = const(Item)) Item
            else
            if (Type = const("Machine Center")) "Machine Center"
            else
            if (Type = const("Work Center")) "Work Center"
            else
            if (Type = const(Resource)) Resource;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = SystemMetadata;
        }
        field(6; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = SystemMetadata;
            TableRelation = if (Type = const(Item)) "Item Unit of Measure".Code where("Item No." = field("No."))
            else
            if (Type = const(Resource)) "Resource Unit of Measure".Code where("Resource No." = field("No."));
        }
        field(7; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = SystemMetadata;
            TableRelation = if (Type = const(Item)) "Item Variant".Code where("Item No." = field("No."));
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = SystemMetadata;
            TableRelation = Location;
        }
        field(9; "Replenishment System"; Enum "Replenishment System")
        {
            Caption = 'Replenishment System';
            DataClassification = SystemMetadata;
        }
        field(10; Indentation; Integer)
        {
            Caption = 'Indentation';
            DataClassification = SystemMetadata;
        }
        field(11; "Is Leaf"; Boolean)
        {
            Caption = 'Is Leaf';
            DataClassification = SystemMetadata;
        }
        field(13; Bottleneck; Boolean)
        {
            Caption = 'Bottleneck';
            DataClassification = SystemMetadata;
        }
        field(15; "Routing No."; Code[20])
        {
            Caption = 'Routing No.';
            DataClassification = SystemMetadata;
            TableRelation = "Routing Header";
        }
        field(16; "Production BOM No."; Code[20])
        {
            Caption = 'Production BOM No.';
            DataClassification = SystemMetadata;
            TableRelation = "Production BOM Header";
        }
        field(20; "Lot Size"; Decimal)
        {
            AccessByPermission = TableData "Production Order" = R;
            Caption = 'Lot Size';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(21; "Low-Level Code"; Integer)
        {
            Caption = 'Low-Level Code';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(22; "Rounding Precision"; Decimal)
        {
            Caption = 'Rounding Precision';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
            InitValue = 1;
        }
        field(30; "Qty. per Parent"; Decimal)
        {
            Caption = 'Qty. per Parent';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(31; "Qty. per Top Item"; Decimal)
        {
            Caption = 'Qty. per Top Item';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(32; "Able to Make Top Item"; Decimal)
        {
            Caption = 'Able to Make Top Item';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(33; "Able to Make Parent"; Decimal)
        {
            Caption = 'Able to Make Parent';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(35; "Available Quantity"; Decimal)
        {
            Caption = 'Available Quantity';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(36; "Gross Requirement"; Decimal)
        {
            Caption = 'Gross Requirement';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(37; "Scheduled Receipts"; Decimal)
        {
            Caption = 'Scheduled Receipts';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(38; "Unused Quantity"; Decimal)
        {
            Caption = 'Unused Quantity';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(40; "Lead Time Calculation"; DateFormula)
        {
            Caption = 'Lead Time Calculation';
            DataClassification = SystemMetadata;
        }
        field(41; "Lead-Time Offset"; DateFormula)
        {
            Caption = 'Lead-Time Offset';
            DataClassification = SystemMetadata;
        }
        field(42; "Rolled-up Lead-Time Offset"; Integer)
        {
            Caption = 'Rolled-up Lead-Time Offset';
            DataClassification = SystemMetadata;
        }
        field(43; "Needed by Date"; Date)
        {
            Caption = 'Needed by Date';
            DataClassification = SystemMetadata;
        }
        field(45; "Safety Lead Time"; DateFormula)
        {
            Caption = 'Safety Lead Time';
            DataClassification = SystemMetadata;
        }
        field(50; "Unit Cost"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Cost';
            DataClassification = SystemMetadata;
        }
        field(52; "Indirect Cost %"; Decimal)
        {
            Caption = 'Indirect Cost %';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(54; "Overhead Rate"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Overhead Rate';
            DataClassification = SystemMetadata;
        }
        field(55; "Scrap %"; Decimal)
        {
            BlankZero = true;
            Caption = 'Scrap %';
            DataClassification = SystemMetadata;
        }
        field(56; "Scrap Qty. per Parent"; Decimal)
        {
            Caption = 'Scrap Qty. per Parent';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(57; "Scrap Qty. per Top Item"; Decimal)
        {
            Caption = 'Scrap Qty. per Top Item';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(59; "Resource Usage Type"; Option)
        {
            Caption = 'Resource Usage Type';
            DataClassification = SystemMetadata;
            OptionCaption = 'Direct,Fixed';
            OptionMembers = Direct,"Fixed";
        }
        field(61; "Single-Level Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Single-Level Material Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
        }
        field(62; "Single-Level Capacity Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Single-Level Capacity Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
        }
        field(63; "Single-Level Subcontrd. Cost"; Decimal)
        {
            AccessByPermission = TableData "Machine Center" = R;
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Single-Level Subcontrd. Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
        }
        field(64; "Single-Level Cap. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Single-Level Cap. Ovhd Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
        }
        field(65; "Single-Level Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Single-Level Mfg. Ovhd Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
        }
        field(66; "Single-Level Scrap Cost"; Decimal)
        {
            BlankZero = true;
            Caption = 'Single-Level Scrap Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
        }
        field(71; "Rolled-up Material Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Rolled-up Material Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
            Editable = false;
        }
        field(72; "Rolled-up Capacity Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Rolled-up Capacity Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
            Editable = false;
        }
        field(73; "Rolled-up Subcontracted Cost"; Decimal)
        {
            AccessByPermission = TableData "Machine Center" = R;
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Rolled-up Subcontracted Cost';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(74; "Rolled-up Capacity Ovhd. Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Rolled-up Capacity Ovhd. Cost';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(75; "Rolled-up Mfg. Ovhd Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Rolled-up Mfg. Ovhd Cost';
            DataClassification = SystemMetadata;
            Editable = false;
        }
        field(76; "Rolled-up Scrap Cost"; Decimal)
        {
            BlankZero = true;
            Caption = 'Rolled-up Scrap Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
        }
        field(77; "Single-Lvl Mat. Non-Invt. Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Single-Level Material Non-Inventory Cost';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
        }
        field(78; "Rolled-up Mat. Non-Invt. Cost"; Decimal)
        {
            AutoFormatType = 2;
            BlankZero = true;
            Caption = 'Rolled-up Material Non-Inventory Cost';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 5;
            Editable = false;
        }
        field(81; "Total Cost"; Decimal)
        {
            BlankZero = true;
            Caption = 'Total Cost';
            DataClassification = SystemMetadata;
            DecimalPlaces = 2 : 5;
        }
        field(82; "BOM Unit of Measure Code"; Code[10])
        {
            Caption = 'BOM Unit of Measure Code';
            DataClassification = SystemMetadata;
            TableRelation = if (Type = const(Item)) "Item Unit of Measure".Code where("Item No." = field("No."))
            else
            if (Type = const(Resource)) "Resource Unit of Measure".Code where("Resource No." = field("No."));
        }
        field(83; "Qty. per BOM Line"; Decimal)
        {
            Caption = 'Qty. per BOM Line';
            DataClassification = SystemMetadata;
            DecimalPlaces = 0 : 5;
        }
        field(84; "Inventoriable"; Boolean)
        {
            Caption = 'Inventoriable';
            DataClassification = SystemMetadata;
        }
        field(85; "Calculation Formula"; Enum "Quantity Calculation Formula")
        {
            Caption = 'Calculation Formula';
            DataClassification = SystemMetadata;
        }
        field(50000; "Sales Item"; Code[20])
        {
            Caption = 'Sales Item';
            DataClassification = SystemMetadata;

        }

    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Low-Level Code")
        {
        }
        key(Key3; Type, "No.", Indentation)
        {
            SumIndexFields = "Able to Make Parent";
        }
        key(Key4; "Total Cost")
        {
        }
    }

    fieldgroups
    {
    }

}

