codeunit 50103 APIManagement
{
    trigger OnRun()
    begin

    end;

    procedure PostRecordforLocAssignment(SalesHeader: Record "Sales Header")
    var
        IntegrationSetup: Record "Integration Setup";
    begin
        IntegrationSetup.Reset();
        IntegrationSetup.SetRange(Active, true);
        IntegrationSetup.SetRange(Code, 'LOCASSIGN');
        if not IntegrationSetup.FindFirst() then
            Error('Integration Setup not found for Location Assignment.');
        CheckMandatoryandReset(IntegrationSetup."API URL");
        ResponseMsg := MakeRequest(IntegrationSetup."API URL", httpMethod::POST, ResponseStatus, GeneratePostPayload(), IntegrationSetup.Username, IntegrationSetup.Password);
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

    local procedure MakeRequest(APIUrl: Text; HttpMethod: Enum "Http Request Type"; var ResponseStatus: Boolean; Payload: Text; Username: Text[50]; Password: Text[50]) response: HttpResponseMessage;
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
            Content.WriteFrom('');
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
        //Log API Transactions
    end;

    local procedure GeneratePostPayload() payload: Text
    var
        RootObj, ShipToAddressObj, ShipmentWeightObj, WarehouseObj, WarehouseItemObj : JsonObject;
        WarehouseListArr: JsonArray;
        salesheader: Record "Sales Header";
        itemBomAvailable: Record "Item Bom Available";
        salesLine: Record "Sales Line";
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
        if LocFilter <> '' then begin
            location.Reset();
            location.SetFilter(Code, LocFilter);
            if location.FindSet() then
                repeat

                    WarehouseObj.Add('code', location.Code);
                    //WarehouseObj.Add('id', '157');
                    WarehouseObj.Add('postalCode', location."Post Code");
                until location.Next() = 0;
        end;
        // Wrap Warehouse in warehouse key
        WarehouseItemObj.Add('warehouse', WarehouseObj);
        WarehouseListArr.Add(WarehouseItemObj);

        // Add array to root
        RootObj.Add('warehouseList', WarehouseListArr);

        // Convert to text
        RootObj.WriteTo(payload);
        exit(payload);
    end;

    local procedure GetTotalWeight(No: Code[20]): Decimal
    var
        itembomavailable: Record "Item Bom Available";
        TotalWeight: Decimal;
    begin
        itembomavailable.Reset();
        itembomavailable.SetRange("Order No.", No);
        if itembomavailable.FindSet() then
            repeat
                TotalWeight += itembomavailable.Weight;
            until itembomavailable.Next() = 0;

        exit(TotalWeight);
    end;

    var
        Content: HttpContent;
        ResponseMsg: HttpResponseMessage;
        httpMethod: Enum "Http Request Type";
        ResponseStatus: Boolean;
        ResponseText: Text;
}