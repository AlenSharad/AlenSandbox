codeunit 50103 APIManagement
{
    trigger OnRun()
    begin

    end;

    procedure PostRecordforLocAssignment(SalesHeader: Record "Sales Header")
    var
        IntegrationSetup: Record "Integration Setup";
        content: HttpContent;
        ResponseMsgTXT: Text[500];
        RecSalesLine: Record "Sales Line";
    begin
        finalLocation := '';
        finalAgentService := '';
        IntegrationSetup.Reset();
        IntegrationSetup.SetRange(Active, true);
        IntegrationSetup.SetRange(Code, 'LOCASSIGN');
        if not IntegrationSetup.FindFirst() then
            Error('Integration Setup not found for Location Assignment.');
        CheckMandatoryandReset(IntegrationSetup."API URL");
        ResponseMsg := MakeRequest(IntegrationSetup."API URL", httpMethod::POST, ResponseStatus, GeneratePostPayload(), IntegrationSetup.Username, IntegrationSetup.Password, IntegrationSetup.Code, SalesHeader."No.");

        content := ResponseMsg.Content();
        content.ReadAs(ResponseMsgTXT);
        //Message(ResponseMsgTXT);
        finalLocation := GetLocationfromResponse(ResponseMsgTXT);
        finalAgentService := GetAgentfromResponse(ResponseMsgTXT);
        //Message(finalLocation);
        if finalLocation <> '' then begin
            SalesHeader."Location Code" := finalLocation;
            if (finalAgentService <> '') and (finalAgentService <> SalesHeader."Shipping Agent Service Code") then
                SalesHeader.Validate("Shipping Agent Service Code", finalAgentService);
            SalesHeader.Modify(true);
            RecSalesLine.Reset();
            RecSalesLine.SetRange("Document Type", SalesHeader."Document Type");
            RecSalesLine.SetRange("Document No.", SalesHeader."No.");
            if RecSalesLine.FindSet() then
                repeat
                    RecSalesLine."Location Code" := finalLocation;
                    RecSalesLine.Modify(true);
                until RecSalesLine.Next() = 0;
        end else
            Error('Location code not found in response.');
    end;

    local procedure CheckMandatoryandReset(PostUrl: Text)
    begin
        if PostUrl = '' then
            Error('Post Url can not be blank.');
        Clear(Content);
        Clear(ResponseMsg);
        Clear(httpMethod);
        Clear(ResponseStatus);
        Clear(ResponseText);
    end;

    local procedure MakeRequest(APIUrl: Text; HttpMethod: Enum "Http Request Type"; var ResponseStatus: Boolean; Payload: Text; Username: Text[50]; Password: Text[50]; APICode: Code[20]; DocumentNo: Code[20]) response: HttpResponseMessage;
    var
        contentHeader: HttpHeaders;
        request: HttpRequestMessage;
        client: HttpClient;
        AuthString: Text;
        EncodedAuth: Text;
        TempBase64: Codeunit "Base64 Convert";
    begin

        Content.Clear();
        if Payload <> '' then
            Content.WriteFrom(Payload)
        else
            //Content.WriteFrom('');
            exit;
        // Step 1: Concatenate username and password with colon
        AuthString := StrSubstNo('%1:%2', Username, Password);

        // Step 2: Encode the string in Base64
        AuthString := TempBase64.ToBase64(AuthString);
        AuthString := StrSubstNo('Basic %1', AuthString);

        contentHeader := client.DefaultRequestHeaders();
        contentHeader.Add('Authorization', AuthString);
        contentHeader.Add('Accept', 'application/json');

        Content.GetHeaders(contentHeader);
        request.Content := Content;

        request.SetRequestUri(APIUrl);
        case HttpMethod of
            HttpMethod::GET:
                request.Method := 'GET';
            HttpMethod::POST:
                request.Method := 'POST';
            HttpMethod::PUT:
                request.Method := 'PUT';
            HttpMethod::PATCH:
                request.Method := 'PATCH';
            HttpMethod::DELETE:
                request.Method := 'DELETE';
            else
                Error('Unsupported HTTP method.');
        end;
        ResponseStatus := client.Send(request, response);

        LogApiTransactions(APIUrl, HttpMethod, ResponseStatus, Payload, response, APICode, DocumentNo);
        //Message('Response Status: %1', Format(ResponseStatus));
        //Log API Transactions
    end;

    local procedure GeneratePostPayload() payload: Text
    var
        RootObj, ShipToAddressObj, ShipmentWeightObj, WarehouseObj, ItemObj : JsonObject;
        ItemListArr, WarehouseListArr : JsonArray;
        salesheader: Record "Sales Header";
        itemBomAvailable: Record "Item Bom Available";
        LsalesLine: Record "Sales Line";
        LocFilter: Text[300];
        LocList: List of [Text];
        Value: Text;
        location: Record Location;
    begin
        itemBomAvailable.Reset();
        itemBomAvailable.SetRange(Available, true);
        if itemBomAvailable.FindFirst() then begin
            salesheader.get(salesheader."Document Type"::Order, itemBomAvailable."Order No.");
            //salesLine
            RootObj.Add('orderNumber', salesheader."No.");
            RootObj.Add('shipAgent', salesheader."Shipping Agent Code");
            RootObj.Add('shipAgentService', salesheader."Shipping Agent Service Code");

            // ShipToAddress object
            ShipToAddressObj.Add('postalCode', salesheader."Ship-to Post Code");
            ShipToAddressObj.Add('stateOrProvinceCode', salesheader."Ship-to County");
            ShipToAddressObj.Add('countryCode', salesheader."Ship-to Country/Region Code");
            RootObj.Add('shipToAddress', ShipToAddressObj);
        end;
        // ShipmentWeight object

        ShipmentWeightObj.Add('units', 'Lb');
        ShipmentWeightObj.Add('value', GetTotalWeight(salesheader."No."));
        RootObj.Add('shipmentWeight', ShipmentWeightObj);

        // Warehouse object inside array
        itemBomAvailable.Reset();
        itemBomAvailable.SetAutoCalcFields("Availability Count");
        itemBomAvailable.SetRange(Available, true);
        itemBomAvailable.SetRange("Order No.", salesheader."No.");
        if itemBomAvailable.FindSet() then
            repeat
                if itemBomAvailable."Availability Count" = itemBomAvailable."Actual Count" then begin
                    if LocFilter <> '' then begin

                        foreach Value in LocFilter.Split('|') do begin
                            LocList.Add(Value);
                        end;
                    end;
                    // Check if NewValue already exists
                    if not LocList.Contains(itemBomAvailable."Location Code") then begin
                        if LocFilter = '' then
                            LocFilter := itemBomAvailable."Location Code"
                        else
                            LocFilter += '|' + itemBomAvailable."Location Code";
                    end;
                end;
            until itemBomAvailable.Next() = 0;
        // filling items
        LsalesLine.Reset();
        LsalesLine.SetRange("Document Type", salesheader."Document Type");
        LsalesLine.SetRange("Document No.", salesheader."No.");
        LsalesLine.SetFilter(Quantity, '<>%1', 0);
        if LsalesLine.FindSet() then
            repeat
                Clear(ItemObj);
                ItemObj.Add('ItemNumber', LsalesLine."No.");
                ItemObj.Add('isReturnItem', getIsreturnflag(LsalesLine."No."));
                ItemListArr.Add(ItemObj);
            until LsalesLine.Next() = 0;
        RootObj.Add('Items', ItemListArr);

        if LocFilter <> '' then begin
            location.Reset();
            location.SetFilter(Code, LocFilter);
            if location.FindSet() then
                repeat
                    Clear(WarehouseObj);

                    WarehouseObj.Add('code', location.Code);
                    WarehouseObj.Add('id', '');
                    WarehouseObj.Add('postalCode', location."Post Code");
                    //WarehouseItemObj.Add('warehouses', WarehouseObj);
                    WarehouseListArr.Add(WarehouseObj);
                until location.Next() = 0;
        end;
        // Wrap Warehouse in warehouse key


        // Add array to root
        RootObj.Add('warehouses', WarehouseListArr);

        // Convert to text
        RootObj.WriteTo(payload);
        //Message('Payload: %1', payload);
        exit(payload);
    end;

    local procedure GetTotalWeight(No: Code[20]): Decimal
    var
        itembomavailable: Record "Item Bom Available";
        TotalWeight: Decimal;
        itemNo: Code[20];
    begin
        itembomavailable.Reset();
        itembomavailable.SetRange("Order No.", No);
        if itembomavailable.FindSet() then
            repeat
                if itemNo <> itembomavailable."Item No." then
                    TotalWeight += itembomavailable.Weight;
                itemNo := itembomavailable."Item No.";
            until itembomavailable.Next() = 0;

        exit(TotalWeight);
    end;

    local procedure GetLocationfromResponse(ResponseMsgTXT: Text[500]): Code[20]
    var
        JsonObj: JsonObject;
        AssignedWarehouseObj: JsonObject;
        OrderNumber: Text;
        WarehouseCode: Code[20];
        JToken: JsonToken;
        output: Text;
        WhToken: JsonToken;
    begin
        if not JsonObj.ReadFrom(ResponseMsgTXT) then
            Error('Invalid JSON format.');

        // // Get Order Number
        // JsonObj.Get('orderNumber', OrderNumber);

        // Get assignedWarehouse object
        JsonObj.Get('assignedWarehouse', WhToken);
        WarehouseCode := WhToken.AsValue().AsText();
        /*
        JsonObj.Get('assignedWarehouse', JToken);
        if JToken.IsObject then begin
            JToken.WriteTo(output);
            AssignedWarehouseObj.ReadFrom(output);
            AssignedWarehouseObj.Get('warehouseCode', WhToken);
            WarehouseCode := WhToken.AsValue().AsText();
        end;
        */
        exit(WarehouseCode);

        // Insert into table

    end;

    local procedure GetAgentfromResponse(ResponseMsgTXT: Text[500]): Code[20]
    var
        JsonObj: JsonObject;
        AssignedWarehouseObj: JsonObject;
        OrderNumber: Text;
        WarehouseCode: Code[20];
        JToken: JsonToken;
        output: Text;
        WhToken: JsonToken;
    begin
        if not JsonObj.ReadFrom(ResponseMsgTXT) then
            Error('Invalid JSON format.');

        // // Get Order Number
        // JsonObj.Get('orderNumber', OrderNumber);

        // Get assignedWarehouse object
        if JsonObj.Get('shipAgentService', WhToken) then
            WarehouseCode := WhToken.AsValue().AsText()
        else
            WarehouseCode := '';
        /*
        JsonObj.Get('assignedWarehouse', JToken);
        if JToken.IsObject then begin
            JToken.WriteTo(output);
            AssignedWarehouseObj.ReadFrom(output);
            AssignedWarehouseObj.Get('warehouseCode', WhToken);
            WarehouseCode := WhToken.AsValue().AsText();
        end;
        */
        exit(WarehouseCode);

        // Insert into table

    end;

    local procedure getIsreturnflag(No: Code[20]): Text
    var
        item: Record Item;
    begin
        item.Reset();
        item.Get(No);
        if item."Ava VAT isGoodsSecondHand" then
            exit('true')
        else
            exit('false');
    end;

    local procedure HandleStreams(var ApiLog: Record "API Log"; RequestBlob: InStream; ResponseBlob: InStream)
    var
        //OutStr: OutStream;
        OutStr2: OutStream;
    begin
        //Clear(OutStr);
        Clear(OutStr2);
        // ApiLog."Request".CreateOutStream(OutStr);
        // CopyStream(OutStr, RequestBlob);
        // ApiLog.Modify(true);
        // Commit();
        ApiLog."Response".CreateOutStream(OutStr2);
        CopyStream(OutStr2, ResponseBlob);

        // Update the API Log record with the streams
        ApiLog.Modify(true);
    end;


    procedure LogApiTransactions(ApiUrl: Text; HttpMethod: Enum "Http Request Type"; var ResponseStatus: Boolean; var request: text; var response: HttpResponseMessage; APIName: Code[20]; DocumentNo: Code[20])
    var
        ApiLog: Record "API Log";
        RequestBlob: InStream;
        ResponseBlob: InStream;
        TempRequest: InStream;
        TempResponse: InStream;
        outStr: OutStream;
    begin

        //    request.Content.ReadAs(RequestBlob);
        response.Content.ReadAs(ResponseBlob);
        ApiLog.Init;

        ApiLog.URL := ApiUrl;
        ApiLog.Method := HttpMethod;
        ApiLog.Request.CreateOutStream(outStr);
        outStr.WriteText(request);
        ApiLog.DocumentNo := DocumentNo;
        ApiLog."Status Code" := response.HttpStatusCode;
        ApiLog.Success := ResponseStatus;

        ApiLog."User ID" := UserId;

        ApiLog.LoggedOn := CurrentDateTime;
        ApiLog."API Name" := APIName;

        ApiLog.Insert();
        HandleStreams(ApiLog, RequestBlob, ResponseBlob);
    end;

    var
        Content: HttpContent;
        ResponseMsg: HttpResponseMessage;
        httpMethod: Enum "Http Request Type";
        ResponseStatus: Boolean;
        ResponseText: Text;
        finalLocation, finalAgentService : Code[20];

}