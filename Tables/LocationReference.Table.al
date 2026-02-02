
table 50106 "Location Reference"
{
    Caption = 'Location Reference';
    LookupPageID = "Location Reference List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Location Code"; Code[20])
        {
            Caption = 'Location Code';
            OptimizeForTextSearch = true;
            TableRelation = Location.Code;
        }

        field(4; "Reference Type"; Enum "Location Reference Type")
        {
            Caption = 'Reference Type';

            trigger OnValidate()
            var
                IsHandled: Boolean;
            begin
                IsHandled := false;
                OnBeforeValidateLocationReferenceType(Rec, xRec, IsHandled);
                if not IsHandled then
                    if ("Reference Type" <> xRec."Reference Type") and (xRec."Reference Type" <> xRec."Reference Type"::" ") then
                        "Reference Type No." := '';
            end;
        }
        field(5; "Reference Type No."; Code[20])
        {
            Caption = 'Reference Type No.';
            OptimizeForTextSearch = true;
            TableRelation = if ("Reference Type" = const(Customer)) Customer."No."
            else
            if ("Reference Type" = const(Vendor)) Vendor."No.";
        }
        field(6; "Reference No."; Code[50])
        {
            Caption = 'Reference No.';
            OptimizeForTextSearch = true;
            NotBlank = true;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            OptimizeForTextSearch = true;
        }
        field(9; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
            OptimizeForTextSearch = true;
        }
        field(10; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                CheckDates();
            end;
        }
        field(11; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                CheckDates();
            end;
        }
    }

    keys
    {
        key(Key1; "Location Code", "Reference Type", "Reference Type No.", "Reference No.")
        {
            Clustered = true;
        }
        key(Key2; "Reference No.")
        {
        }
        key(Key3; "Reference No.", "Reference Type", "Reference Type No.")
        {
        }
        key(Key4; "Reference Type", "Reference Type No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Location Code", "Reference Type", "Reference Type No.", "Reference No.")
        {
        }
        fieldgroup(Brick; "Location Code", "Reference Type", "Reference Type No.", "Reference No.")
        {
        }
    }

    trigger OnDelete()
    begin

    end;

    trigger OnInsert()
    begin
        if ("Reference Type No." <> '') and ("Reference Type" = "Reference Type"::" ") then
            Error(BlankReferenceTypeErr);

        Location.Get("Location Code");

    end;

    trigger OnRename()
    var
        IsHandled: Boolean;
    begin
        if ("Reference Type No." <> '') and ("Reference Type" = "Reference Type"::" ") then
            Error(BlankReferenceTypeErr);


    end;

    var
        Location: Record Location;
        BlankReferenceTypeErr: Label 'You cannot enter a Reference Type No. for a blank Reference Type.';


    local procedure MultipleLocationReferencesExist(LocationReference: Record "Location Reference"): Boolean
    var
        LocationReference2: Record "Location Reference";
        IsHandled: Boolean;
        Result: Boolean;
    begin
        IsHandled := false;
        OnBeforeMultipleLocationReferencesExist(LocationReference, Result, IsHandled);
        if IsHandled then
            exit(Result);

        LocationReference2.SetRange("Location Code", LocationReference."Location Code");
        LocationReference2.SetRange("Reference Type", LocationReference."Reference Type");
        LocationReference2.SetRange("Reference Type No.", LocationReference."Reference Type No.");
        LocationReference2.SetRange("Reference No.", LocationReference."Reference No.");

        exit(not LocationReference2.IsEmpty);
    end;

    procedure FindLocationDescription(var LocDescription: Text[100]; var LocDescription2: Text[50]; LocCode: Code[20]; ToDate: Date; ReferenceType: Enum "Location Reference Type"; ReferenceTypeNo: Code[20]) Result: Boolean
    var
        LocationReference: Record "Location Reference";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeFindLocationDescription(LocDescription, LocDescription2, LocCode, ReferenceType, ReferenceTypeNo, Result, IsHandled, LocationReference, ToDate);
        if IsHandled then
            exit(Result);

        LocationReference.SetRange("Location Code", LocCode);
        if ToDate <> 0D then begin
            LocationReference.SetFilter("Starting Date", '<=%1', ToDate);
            LocationReference.SetFilter("Ending Date", '>=%1|%2', ToDate, 0D);
        end;
        LocationReference.SetRange("Reference Type", ReferenceType);
        LocationReference.SetRange("Reference Type No.", ReferenceTypeNo);
        if LocationReference.FindFirst() then begin
            if (LocationReference.Description = '') and (LocationReference."Description 2" = '') then
                exit(false);
            LocDescription := LocationReference.Description;
            LocDescription2 := LocationReference."Description 2";
            exit(true);
        end;

        exit(false);
    end;

    local procedure CheckDates()
    var
        StartingEndingDateErr: Label '%1 %2 is before %3 %4.', Comment = '%1 and %3 = Date Captions, %2 and %4 = Date Values';
    begin
        if Rec."Ending Date" = 0D then
            exit;
        if Rec."Ending Date" < Rec."Starting Date" then
            Error(StartingEndingDateErr, Rec.FieldCaption("Ending Date"), Rec."Ending Date", Rec.FieldCaption("Starting Date"), Rec."Starting Date");
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeFindLocationDescription(var LocDescription: Text[100]; var LocDescription2: Text[50]; LocCode: Code[20]; ReferenceType: Enum "Location Reference Type"; ReferenceTypeNo: Code[20]; var Result: Boolean; var IsHandled: Boolean; var LocationReference: Record "Location Reference"; ToDate: Date)
    begin
    end;


    [IntegrationEvent(false, false)]
    local procedure OnBeforeMultipleLocationReferencesExist(var LocationReference: Record "Location Reference"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateLocationReferenceType(var LocationReference: Record "Location Reference"; xLocationReference: Record "Location Reference"; var IsHandled: Boolean)
    begin
    end;
}