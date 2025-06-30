// Table Extension: Post Code
tableextension 50131 "Post Code Extension" extends "Post Code"
{
    fields
    {
        field(50100; "Default Location"; Code[20])
        {
            Caption = 'Default Location';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50101; "Location 1"; Code[20])
        {
            Caption = 'Location 1';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50102; "Location 2"; Code[20])
        {
            Caption = 'Location 2';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50103; "Location 3"; Code[20])
        {
            Caption = 'Location 3';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50104; "Location 4"; Code[20])
        {
            Caption = 'Location 4';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50105; "Location 5"; Code[20])
        {
            Caption = 'Location 5';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }

    }
}
