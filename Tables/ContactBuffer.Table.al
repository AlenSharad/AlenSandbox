
table 50101 "Contact Buffer"
{
    Caption = 'Contact Buffer';
    DataCaptionFields = "No.", Name;
    DataClassification = CustomerContent;
    TableType = Temporary;
    Permissions = TableData "Sales Header" = rm,
                  TableData "Contact Alt. Address" = rd,
                  TableData "Contact Alt. Addr. Date Range" = rd,
                  TableData "Contact Business Relation" = rid,
                  TableData "Contact Mailing Group" = rd,
                  TableData "Contact Industry Group" = rd,
                  TableData "Contact Web Source" = rd,
                  TableData "Rlshp. Mgt. Comment Line" = rd,
                  TableData "Interaction Log Entry" = rm,
                  TableData "Contact Job Responsibility" = rd,
                  TableData "To-do" = rm,
                  TableData "Contact Profile Answer" = rd,
                  TableData Opportunity = rm,
                  TableData "Opportunity Entry" = rm,
                  tabledata Contact = rm,
                  tabledata "Salesperson/Purchaser" = R,
                  tabledata "Marketing Setup" = r,
                  tabledata Salutation = r,
                  tabledata "Salutation Formula" = r,
                  tabledata Language = r,
                  tabledata "Language Selection" = r;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()

            begin

                if "No." <> xRec."No." then begin
                    RMSetup.Get();
                    NoSeries.TestManual(RMSetup."Contact Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Search Name"; Code[100])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';

        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';

        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';

        }
        field(7; City; Text[30])
        {
            Caption = 'City';

            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;

        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';

            ExtendedDatatype = PhoneNo;


        }
        field(10; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';

        }
        field(15; "Territory Code"; Code[10])
        {
            Caption = 'Territory Code';
            TableRelation = Territory;
        }
        field(22; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(24; "Language Code"; Code[10])
        {
            Caption = 'Language Code';
            TableRelation = Language;

        }
        field(25; "Registration Number"; Text[50])
        {
            Caption = 'Registration No.';



        }
        field(29; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser";

        }
        field(35; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

        }
        field(38; Comment; Boolean)
        {
            CalcFormula = exist("Rlshp. Mgt. Comment Line" where("Table Name" = const(Contact),
                                                                  "No." = field("No."),
                                                                  "Sub No." = const(0)));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Format Region"; Text[80])
        {
            Caption = 'Format Region';

            TableRelation = "Language Selection"."Language Tag";
        }
        field(54; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(84; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';

        }
        field(85; "Telex Answer Back"; Text[20])
        {
            Caption = 'Telex Answer Back';

        }
        field(86; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';



        }
        field(91; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;


        }
        field(92; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';

        }
        field(102; "E-Mail"; Text[80])
        {
            Caption = 'Email';

            ExtendedDatatype = EMail;

        }
#if not CLEAN24
        field(103; "Home Page"; Text[80])
        {
            Caption = 'Home Page';

            ExtendedDatatype = URL;
            ObsoleteReason = 'Field length will be increased to 255.';
            ObsoleteState = Pending;
            ObsoleteTag = '24.0';
        }
#else
#pragma warning disable AS0086
        field(103; "Home Page"; Text[255])
        {
            Caption = 'Home Page';
            
            ExtendedDatatype = URL;
        }
#pragma warning restore AS0086
#endif
        field(107; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(140; Image; Media)
        {
            Caption = 'Image';
            ExtendedDatatype = Person;
        }
        field(150; "Privacy Blocked"; Boolean)
        {
            Caption = 'Privacy Blocked';

        }
        field(151; Minor; Boolean)
        {
            Caption = 'Minor';

        }
        field(152; "Parental Consent Received"; Boolean)
        {
            Caption = 'Parental Consent Received';


        }
#if not CLEANSCHEMA26
        field(720; "Coupled to CRM"; Boolean)
        {
            Caption = 'Coupled to Dataverse';
            Editable = false;
            ObsoleteReason = 'Replaced by flow field Coupled to Dataverse';
            ObsoleteState = Removed;
            ObsoleteTag = '26.0';
        }
#endif
        field(721; "Coupled to Dataverse"; Boolean)
        {
            FieldClass = FlowField;
            Caption = 'Coupled to Dataverse';
            Editable = false;
            CalcFormula = exist("CRM Integration Record" where("Integration ID" = field(SystemId), "Table ID" = const(Database::Contact)));
        }
        field(5050; Type; Enum "Contact Type")
        {
            Caption = 'Type';


        }
        field(5051; "Company No."; Code[20])
        {
            Caption = 'Company No.';
            TableRelation = Contact where(Type = const(Company));


        }
        field(5052; "Company Name"; Text[100])
        {
            Caption = 'Company Name';

            TableRelation = Contact.Name where(Type = const(Company));
            ValidateTableRelation = false;

        }
        field(5053; "Lookup Contact No."; Code[20])
        {
            Caption = 'Lookup Contact No.';
            Editable = false;
            TableRelation = Contact;

        }
        field(5054; "First Name"; Text[30])
        {
            Caption = 'First Name';



        }
        field(5055; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';



        }
        field(5056; Surname; Text[30])
        {
            Caption = 'Surname';


        }
        field(5058; "Job Title"; Text[30])
        {
            Caption = 'Job Title';

        }
        field(5059; Initials; Text[30])
        {
            Caption = 'Initials';

        }
        field(5060; "Extension No."; Text[30])
        {
            Caption = 'Extension No.';

        }
        field(5061; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';

            ExtendedDatatype = PhoneNo;

        }
        field(5062; Pager; Text[30])
        {
            Caption = 'Pager';

        }
        field(5063; "Organizational Level Code"; Code[10])
        {
            Caption = 'Organizational Level Code';
            TableRelation = "Organizational Level";
        }
        field(5064; "Exclude from Segment"; Boolean)
        {
            Caption = 'Exclude from Segment';
        }
        field(5065; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(5066; "Next Task Date"; Date)
        {
            CalcFormula = min("To-do".Date where("Contact Company No." = field("Company No."),
                                                  "Contact No." = field(filter("Lookup Contact No.")),
                                                  Closed = const(false),
                                                  "System To-do Type" = const("Contact Attendee")));
            Caption = 'Next Task Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5067; "Last Date Attempted"; Date)
        {
            CalcFormula = max("Interaction Log Entry".Date where("Contact Company No." = field("Company No."),
                                                                  "Contact No." = field(filter("Lookup Contact No.")),
                                                                  "Initiated By" = const(Us),
                                                                  Postponed = const(false)));
            Caption = 'Last Date Attempted';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5068; "Date of Last Interaction"; Date)
        {
            CalcFormula = max("Interaction Log Entry".Date where("Contact Company No." = field("Company No."),
                                                                  "Contact No." = field(filter("Lookup Contact No.")),
                                                                  "Attempt Failed" = const(false),
                                                                  Postponed = const(false)));
            Caption = 'Date of Last Interaction';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5069; "No. of Job Responsibilities"; Integer)
        {
            CalcFormula = count("Contact Job Responsibility" where("Contact No." = field("No.")));
            Caption = 'No. of Job Responsibilities';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5070; "No. of Industry Groups"; Integer)
        {
            CalcFormula = count("Contact Industry Group" where("Contact No." = field("Company No.")));
            Caption = 'No. of Industry Groups';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5071; "No. of Business Relations"; Integer)
        {
            CalcFormula = count("Contact Business Relation" where("Contact No." = field("Company No.")));
            Caption = 'No. of Business Relations';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5072; "No. of Mailing Groups"; Integer)
        {
            CalcFormula = count("Contact Mailing Group" where("Contact No." = field("No.")));
            Caption = 'No. of Mailing Groups';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5073; "External ID"; Code[20])
        {
            Caption = 'External ID';
        }
        field(5074; "No. of Interactions"; Integer)
        {
            CalcFormula = count("Interaction Log Entry" where("Contact Company No." = field(filter("Company No.")),
                                                               Canceled = const(false),
                                                               "Contact No." = field(filter("Lookup Contact No.")),
                                                               Date = field("Date Filter"),
                                                               Postponed = const(false)));
            Caption = 'No. of Interactions';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5076; "Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Interaction Log Entry"."Cost (LCY)" where("Contact Company No." = field("Company No."),
                                                                          Canceled = const(false),
                                                                          "Contact No." = field(filter("Lookup Contact No.")),
                                                                          Date = field("Date Filter"),
                                                                          Postponed = const(false)));
            Caption = 'Cost (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5077; "Duration (Min.)"; Decimal)
        {
            CalcFormula = sum("Interaction Log Entry"."Duration (Min.)" where("Contact Company No." = field("Company No."),
                                                                               Canceled = const(false),
                                                                               "Contact No." = field(filter("Lookup Contact No.")),
                                                                               Date = field("Date Filter"),
                                                                               Postponed = const(false)));
            Caption = 'Duration (Min.)';
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5078; "No. of Opportunities"; Integer)
        {
            CalcFormula = count("Opportunity Entry" where(Active = const(true),
                                                           "Contact Company No." = field("Company No."),
                                                           "Estimated Close Date" = field("Date Filter"),
                                                           "Contact No." = field(filter("Lookup Contact No.")),
                                                           "Action Taken" = field("Action Taken Filter")));
            Caption = 'No. of Opportunities';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5079; "Estimated Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Opportunity Entry"."Estimated Value (LCY)" where(Active = const(true),
                                                                                 "Contact Company No." = field("Company No."),
                                                                                 "Estimated Close Date" = field("Date Filter"),
                                                                                 "Contact No." = field(filter("Lookup Contact No.")),
                                                                                 "Action Taken" = field("Action Taken Filter")));
            Caption = 'Estimated Value (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5080; "Calcd. Current Value (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Opportunity Entry"."Calcd. Current Value (LCY)" where(Active = const(true),
                                                                                      "Contact Company No." = field("Company No."),
                                                                                      "Estimated Close Date" = field("Date Filter"),
                                                                                      "Contact No." = field(filter("Lookup Contact No.")),
                                                                                      "Action Taken" = field("Action Taken Filter")));
            Caption = 'Calcd. Current Value (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5082; "Opportunity Entry Exists"; Boolean)
        {
            CalcFormula = exist("Opportunity Entry" where(Active = const(true),
                                                           "Contact Company No." = field("Company No."),
                                                           "Contact No." = field(filter("Lookup Contact No.")),
                                                           "Sales Cycle Code" = field("Sales Cycle Filter"),
                                                           "Sales Cycle Stage" = field("Sales Cycle Stage Filter"),
                                                           "Salesperson Code" = field("Salesperson Filter"),
                                                           "Campaign No." = field("Campaign Filter"),
                                                           "Action Taken" = field("Action Taken Filter"),
                                                           "Estimated Value (LCY)" = field("Estimated Value Filter"),
                                                           "Calcd. Current Value (LCY)" = field("Calcd. Current Value Filter"),
                                                           "Completed %" = field("Completed % Filter"),
                                                           "Chances of Success %" = field("Chances of Success % Filter"),
                                                           "Probability %" = field("Probability % Filter"),
                                                           "Estimated Close Date" = field("Date Filter"),
                                                           "Close Opportunity Code" = field("Close Opportunity Filter")));
            Caption = 'Opportunity Entry Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5083; "Task Entry Exists"; Boolean)
        {
            CalcFormula = exist("To-do" where("Contact Company No." = field("Company No."),
                                               "Contact No." = field(filter("Lookup Contact No.")),
                                               "Team Code" = field("Team Filter"),
                                               "Salesperson Code" = field("Salesperson Filter"),
                                               "Campaign No." = field("Campaign Filter"),
                                               Date = field("Date Filter"),
                                               Status = field("Task Status Filter"),
                                               Priority = field("Priority Filter"),
                                               Closed = field("Task Closed Filter")));
            Caption = 'Task Entry Exists';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5084; "Salesperson Filter"; Code[20])
        {
            Caption = 'Salesperson Filter';
            FieldClass = FlowFilter;
            TableRelation = "Salesperson/Purchaser";
        }
        field(5085; "Campaign Filter"; Code[20])
        {
            Caption = 'Campaign Filter';
            FieldClass = FlowFilter;
            TableRelation = Campaign;
        }
        field(5086; "Contact Business Relation"; Enum "Contact Business Relation")
        {
            Caption = 'Contact Business Relation';
            //Editable = false;
        }
        field(5087; "Action Taken Filter"; Option)
        {
            Caption = 'Action Taken Filter';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Next,Previous,Updated,Jumped,Won,Lost';
            OptionMembers = " ",Next,Previous,Updated,Jumped,Won,Lost;
        }
        field(5088; "Sales Cycle Filter"; Code[10])
        {
            Caption = 'Sales Cycle Filter';
            FieldClass = FlowFilter;
            TableRelation = "Sales Cycle";
        }
        field(5089; "Sales Cycle Stage Filter"; Integer)
        {
            Caption = 'Sales Cycle Stage Filter';
            FieldClass = FlowFilter;
            TableRelation = "Sales Cycle Stage".Stage where("Sales Cycle Code" = field("Sales Cycle Filter"));
        }
        field(5090; "Probability % Filter"; Decimal)
        {
            Caption = 'Probability % Filter';
            DecimalPlaces = 1 : 1;
            FieldClass = FlowFilter;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5091; "Completed % Filter"; Decimal)
        {
            Caption = 'Completed % Filter';
            DecimalPlaces = 1 : 1;
            FieldClass = FlowFilter;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5092; "Estimated Value Filter"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Estimated Value Filter';
            FieldClass = FlowFilter;
        }
        field(5093; "Calcd. Current Value Filter"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Calcd. Current Value Filter';
            FieldClass = FlowFilter;
        }
        field(5094; "Chances of Success % Filter"; Decimal)
        {
            Caption = 'Chances of Success % Filter';
            DecimalPlaces = 0 : 0;
            FieldClass = FlowFilter;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5095; "Task Status Filter"; Enum "Task Status")
        {
            Caption = 'Task Status Filter';
            FieldClass = FlowFilter;
        }
        field(5096; "Task Closed Filter"; Boolean)
        {
            Caption = 'Task Closed Filter';
            FieldClass = FlowFilter;
        }
        field(5097; "Priority Filter"; Option)
        {
            Caption = 'Priority Filter';
            FieldClass = FlowFilter;
            OptionCaption = 'Low,Normal,High';
            OptionMembers = Low,Normal,High;
        }
        field(5098; "Team Filter"; Code[10])
        {
            Caption = 'Team Filter';
            FieldClass = FlowFilter;
            TableRelation = Team;
        }
        field(5099; "Close Opportunity Filter"; Code[10])
        {
            Caption = 'Close Opportunity Filter';
            FieldClass = FlowFilter;
            TableRelation = "Close Opportunity Code";
        }
        field(5100; "Correspondence Type"; Enum "Correspondence Type")
        {
            Caption = 'Correspondence Type';
        }
        field(5101; "Salutation Code"; Code[10])
        {
            Caption = 'Salutation Code';
            TableRelation = Salutation;
        }
        field(5102; "Search E-Mail"; Code[80])
        {
            Caption = 'Search Email';
        }
        field(5104; "Last Time Modified"; Time)
        {
            Caption = 'Last Time Modified';
        }
        field(5105; "E-Mail 2"; Text[80])
        {
            Caption = 'Email 2';

            ExtendedDatatype = EMail;


        }
        field(5106; "Job Responsibility Filter"; Code[10])
        {
            Caption = 'Job Responsibility Filter';
            FieldClass = FlowFilter;
            TableRelation = "Job Responsibility";
        }
        field(8050; "Xrm Id"; Guid)
        {
            Caption = 'Xrm Id';
            Editable = false;
        }
        field(50010; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Customer No.", "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, Type, City, "Post Code", "Phone No.")
        {
        }
        fieldgroup(Brick; "Company Name", Name, Type, "Contact Business Relation", "Phone No.", "E-Mail", Image)
        {
        }
    }
    procedure LoadDataFromFilters(RelatedIdFilter: Text; RelatedTypeFilter: Text)
    var
        ContactBusinessRelation: Record "Contact Business Relation";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Contact: Record "Contact";
        ContactBusunessRelationLinkToTable: Enum "Contact Business Relation Link To Table";
    begin

        Evaluate(ContactBusunessRelationLinkToTable, RelatedTypeFilter);
        ContactBusinessRelation.SetRange("Link to Table", ContactBusunessRelationLinkToTable);

        case ContactBusunessRelationLinkToTable of
            ContactBusunessRelationLinkToTable::Customer:
                begin
                    Customer.Get(RelatedIdFilter);
                    ContactBusinessRelation.SetRange("No.", Customer."No.");
                end;
            ContactBusunessRelationLinkToTable::Vendor:
                begin
                    Vendor.GetBySystemId(RelatedIdFilter);
                    ContactBusinessRelation.SetRange("No.", Vendor."No.");
                end;
        end;

        if ContactBusinessRelation.FindFirst() then begin

            Contact.SetRange("Company No.", ContactBusinessRelation."Contact No.");
            if Contact.IsEmpty() then begin
                Contact.SetRange("Company No.");
                Contact.SetRange("No.", ContactBusinessRelation."Contact No.");
            end;
            if Contact.FindSet() then
                repeat
                    //        Error('error3');
                    Clear(Rec);
                    Rec.SystemId := Contact.SystemId;
                    Rec."No." := Contact."No.";
                    Rec.Name := Contact.Name;
                    Rec.Type := Contact.Type;
                    Rec."Customer No." := Customer."No.";
                    /*
                    case ContactBusinessRelation."Link to Table" of
                        ContactBusinessRelation."Link to Table"::Customer:
                            begin
                                Rec."Related Id" := Customer.SystemId;
                                Rec."Related Type" := Rec."Related Type"::Customer;
                            end;
                        ContactBusinessRelation."Link to Table"::Vendor:
                            begin
                                Rec."Related Id" := Vendor.SystemId;
                                Rec."Related Type" := Rec."Related Type"::Vendor;
                            end;
                    end;
                    */
                    Rec.Insert();
                //      Error('error4');
                until Contact.Next() = 0;
        end;
    end;


    trigger OnDelete()

    begin

    end;

    trigger OnInsert()

    begin

    end;

    trigger OnModify()
    begin
    end;

    trigger OnRename()
    begin

    end;

    var
        CannotDeleteWithOpenTasksErr: Label 'You cannot delete contact %1 because there are one or more tasks open.', Comment = '%1 = Contact No.';
#pragma warning disable AA0074
#pragma warning disable AA0470
        Text001: Label 'You cannot delete the %2 record of the %1 because the contact is assigned one or more unlogged segments.';
        Text002: Label 'You cannot delete the %2 record of the %1 because one or more opportunities are in not started or progress.';
        Text003: Label '%1 cannot be changed because one or more interaction log entries are linked to the contact.';
#pragma warning restore AA0470
#pragma warning restore AA0074
        CannotChangeWithOpenTasksErr: Label '%1 cannot be changed because one or more tasks are linked to the contact.', Comment = '%1 = Contact No.';
#pragma warning disable AA0074
#pragma warning disable AA0470
        Text006: Label '%1 cannot be changed because one or more opportunities are linked to the contact.';
        Text007: Label '%1 cannot be changed because there are one or more related people linked to the contact.';
#pragma warning restore AA0470
#pragma warning restore AA0074
#pragma warning disable AA0470
        RelatedRecordIsCreatedMsg: Label 'The %1 record has been created.', Comment = 'The Customer record has been created.';
#pragma warning restore AA0470
        RMSetup: Record "Marketing Setup";
        Salesperson: Record "Salesperson/Purchaser";
        PostCode: Record "Post Code";
        DuplMgt: Codeunit DuplicateManagement;
        NoSeries: Codeunit "No. Series";
        UpdateCustVendBank: Codeunit "CustVendBank-Update";
        CampaignMgt: Codeunit "Campaign Target Group Mgt";
        SelectedBusRelationCodes: Text;
        ContChanged: Boolean;
#pragma warning disable AA0074
#pragma warning disable AA0470
        Text012: Label 'You cannot change %1 because one or more unlogged segments are assigned to the contact.';
        Text019: Label 'The %2 record of the %1 already has the %3 with %4 %5.';
#pragma warning restore AA0470
#pragma warning restore AA0074
        CreateCustomerFromContactQst: Label 'Do you want to create a contact as a customer using a customer template?';
#pragma warning disable AA0074
        Text021: Label 'You have to set up the salutation formula of the type %1 in %2 language for the %3 contact.', Comment = '%1 - salutation type, %2 - language code, %3 - contact number.';
        Text022: Label 'The creation of the customer has been aborted.';
#pragma warning restore AA0074
        SelectContactErr: Label 'You must select an existing contact.';
        AlreadyExistErr: Label '%1 %2 already has a %3 with %4 %5.', Comment = '%1=Contact table caption;%2=Contact number;%3=Contact Business Relation table caption;%4=Contact Business Relation Link to Table value;%5=Contact Business Relation number';
        PrivacyBlockedPostErr: Label 'You cannot post this type of document because contact %1 is blocked due to privacy.', Comment = '%1=contact no.';
        PrivacyBlockedCreateErr: Label 'You cannot create this type of document because contact %1 is blocked due to privacy.', Comment = '%1=contact no.';
        PrivacyBlockedGenericErr: Label 'You cannot use contact %1 %2 because they are marked as blocked due to privacy.', Comment = '%1=contact no.;%2=contact name';
        ParentalConsentReceivedErr: Label 'Privacy Blocked cannot be cleared until Parental Consent Received is set to true for minor contact %1.', Comment = '%1=contact no.';
        ProfileForMinorErr: Label 'You cannot use profiles for contacts marked as Minor.';
        MultipleCustomerTemplatesConfirmQst: Label 'Quotes with customer templates different from %1 were assigned to customer %2. Do you want to review the quotes now?', Comment = '%1=Customer Template Code,%2=Customer No.';
        DifferentCustomerTemplateMsg: Label 'Sales quote %1 with original customer template %2 was assigned to the customer created from template %3.', Comment = '%1=Document No.,%2=Original Customer Template Code,%3=Customer Template Code';
        NoOriginalCustomerTemplateMsg: Label 'Sales quote %1 without an original customer template was assigned to the customer created from template %2.', Comment = '%1=Document No.,%2=Customer Template Code';
        PhoneNoCannotContainLettersErr: Label 'must not contain letters';
        FieldLengthErr: Label 'must not have the length more than 20 symbols';
        VendorTemplNotFoundMsg: Label 'You cannot create vendor because there is no vendor template with contact type: %1.', Comment = '%1=Contact Type';



}