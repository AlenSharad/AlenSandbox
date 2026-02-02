codeunit 50108 "Base64ToPDFHandler"
{
    SingleInstance = true;
    Subtype = Normal;

    procedure SaveBase64AsPDF(Base64Text: Text; FileName: Text; TableId: Integer; DocNo: Code[20])
    var
        DocumentAttachment: Record "Document Attachment";
        InStr: InStream;
        OutStr: OutStream;
        TempBlob: Codeunit "Temp Blob";
        Base64Mgt: Codeunit "Base64 Convert";
    begin
        // Convert Base64 text to Blob
        TempBlob.CreateOutStream(OutStr);
        Base64Mgt.FromBase64(Base64Text, OutStr);
        //"Table ID", "No.", "Document Type", "Line No.", ID)
        // Initialize Document Attachment record
        DocumentAttachment.Reset();
        DocumentAttachment.SetRange("Table ID", TableId);
        DocumentAttachment.SetRange("No.", DocNo);
        if not DocumentAttachment.FindFirst() then begin
            DocumentAttachment.Init();
            DocumentAttachment."Table ID" := TableId;
            DocumentAttachment."No." := DocNo;
            DocumentAttachment."File Name" := FileName;
            DocumentAttachment.Insert();
        end;

        TempBlob.CreateOutStream(OutStr);
        Base64Mgt.FromBase64(Base64Text, OutStr);
        TempBlob.CreateInStream(InStr);

        Clear(DocumentAttachment."Document Reference ID");
        DocumentAttachment."Document Reference ID".ImportStream(InStr, FileName);


        // Set additional fields if needed
        DocumentAttachment."File Type" := DocumentAttachment."File Type"::PDF;
        DocumentAttachment."File Extension" := '.pdf';
        DocumentAttachment."Attached By" := UserSecurityId();
        DocumentAttachment."Attached Date" := CurrentDateTime;
        // Insert or modify the attachment
        if not DocumentAttachment.Insert() then
            DocumentAttachment.Modify();
    end;

}
