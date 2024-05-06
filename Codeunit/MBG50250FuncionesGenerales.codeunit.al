codeunit 50250 "MBG Funciones Generales 50250"
{
    var
        WorkTemplateRec: Record "Work-Hour Template";
        ResCapacityEntry: Record "Res. Capacity Entry";
        CompanyInformation: Record "Company Information";
        ResCapacityEntry2: Record "Res. Capacity Entry";
        CalendarMgmt: Codeunit "Calendar Management";
        WorkTemplateCode: Code[10];
        StartDate: Date;
        EndDate: Date;
        WeekTotal: Decimal;
        TempDate: Date;
        TempCapacity: Decimal;
        ChangedDays: Integer;
        LastEntry: Decimal;
        Holiday: Boolean;




    local procedure SetCalendar(var CustomizedCalendarChange: Record "Customized Calendar Change")
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;

        if IsHandled then
            exit;

        if CompanyInformation.Get() then begin
            CompanyInformation.TestField("Base Calendar Code");
            CalendarMgmt.SetSource(CompanyInformation, CustomizedCalendarChange);
        end;
    end;

    local procedure SelectCapacity() Hours: Decimal
    begin
        case Date2DWY(TempDate, 1) of
            1:
                Hours := WorkTemplateRec.Monday;
            2:
                Hours := WorkTemplateRec.Tuesday;
            3:
                Hours := WorkTemplateRec.Wednesday;
            4:
                Hours := WorkTemplateRec.Thursday;
            5:
                Hours := WorkTemplateRec.Friday;
            6:
                Hours := WorkTemplateRec.Saturday;
            7:
                Hours := WorkTemplateRec.Sunday;
        end;
    end;

    procedure updateCapacity(rec: Record "Resource")
    var

        CustomizedCalendarChange: Record "Customized Calendar Change";
        NewCapacity: Decimal;
    begin
        if StartDate = 0D then
            exit;

        if EndDate = 0D then
            exit;



        SetCalendar(CustomizedCalendarChange);

        ResCapacityEntry.Reset();
        ResCapacityEntry.SetCurrentKey("Resource No.", Date);
        ResCapacityEntry.SetRange("Resource No.", Rec."No.");
        TempDate := StartDate;
        ChangedDays := 0;
        repeat
            Holiday := CalendarMgmt.IsNonworkingDay(TempDate, CustomizedCalendarChange);

            ResCapacityEntry.SetRange(Date, TempDate);
            ResCapacityEntry.CalcSums(Capacity);
            TempCapacity := ResCapacityEntry.Capacity;

            if Holiday then
                NewCapacity := TempCapacity
            else
                NewCapacity := TempCapacity - SelectCapacity();

            if NewCapacity <> 0 then begin
                ResCapacityEntry2.Reset();
                if ResCapacityEntry2.FindLast() then;
                LastEntry := ResCapacityEntry2."Entry No." + 1;
                ResCapacityEntry2.Init();
                ResCapacityEntry2."Entry No." := LastEntry;
                ResCapacityEntry2.Capacity := -NewCapacity;
                ResCapacityEntry2."Resource No." := Rec."No.";
                ResCapacityEntry2."Resource Group No." := Rec."Resource Group No.";
                ResCapacityEntry2.Date := TempDate;
                if ResCapacityEntry2.Insert(true) then;
                ChangedDays := ChangedDays + 1;
            end;
            TempDate := TempDate + 1;
        until TempDate > EndDate;
        Commit();


    end;
    // ++gfj Recepción del Producto Máquina
    procedure creacionRecepcion(var whLine: record "Warehouse Receipt Line")
    var
        newResource: Record Resource;
        itemLine: Record Item;
        newDAMasset: Record "DAM Asset";
        newAF: record "Fixed Asset";
        locCduNoSerieMgt: Codeunit NoSeriesManagement;
        locRecConfResource: record "Resources Setup";
        locCduDimMgt: Codeunit DimensionManagement;
        resCapa: record "Res. Capacity Entry";
        faconf: Record "FA Setup";
        FAADMIN: Record "DAM Asset Management Setup";
    begin
        itemLine.SetFilter("No.", whLine."Item No.");
        if itemLine.FindFirst then begin
            newResource.Init();
            newResource."No." := '';
            locRecConfResource.Get();
            locCduNoSerieMgt.InitSeries(locRecConfResource."Resource Nos.", locRecConfResource."Resource Nos.", 0D, newResource."No.", newResource."No. Series");
            newResource.Name := itemLine.Description;
            //newResource.Bastidor  //Código que se le da al Producto en Seguim. prod. al recibir la línea. 
            newResource."Pendiente revisión" := true;
            //dimension 1 y 2 del producto
            newResource.Validate("Global Dimension 1 Code", itemLine."Global Dimension 1 Code");
            newResource.Validate("Global Dimension 2 Code", itemLine."Global Dimension 2 Code");

            newResource.Blocked := true;
            // newResource."Centro FF" : = // centro responsabilidad falta definir
            newResource.Insert(true);
            //generar capacidad desde hoy hasta 31/12/2100  


            newAF.Init();
            newAF."No." := '';
            faconf.Get();
            locCduNoSerieMgt.InitSeries(faconf."Fixed Asset Nos.", faconf."Fixed Asset Nos.", 0D, newAF."No.", newAF."No. Series");

            newAF.Description := itemLine.Description;
            //  newaf."Serial No."  //no esta definido
            newAF."Pendiente revisión" := true;
            newAF."Blocked" := true;
            newAF."Recurso relacionado" := newResource."No.";
            //dimension 1 y 2
            newAF.Validate("Global Dimension 1 Code", itemLine."Global Dimension 1 Code");
            newAF.Validate("Global Dimension 2 Code", itemLine."Global Dimension 2 Code");
            newAF.Insert(true);

            newDAMasset.Init();
            FAADMIN.Get();
            //newDAMasset."No." := //esperar conf
            newDAMasset.Description := itemLine.Description;
            //newAF."Serial No." := itemLine."Serial No."; //no definido
            newDAMasset."Pendiente revisión" := true;
            locCduNoSerieMgt.InitSeries(FAADMIN."Asset Nos.", FAADMIN."Asset Nos.", 0D, newDAMasset."No.", newDAMasset."No. Series");
            newDAMasset."active" := true;
            //dimensiones
            //newDAMasset.a
            newDAMasset.Insert();



        end;
    end;
    // --gfj Recepción del Producto Máquina








    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterManualReOpenSalesDoc', '', false, false)]

    local procedure OnAfterManualReOpenSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    var
        boolMessage: Boolean;
        recLines: Record "Sales Line";
    begin
        recLines.SetFilter("Document No.", SalesHeader."No.");
        recLines.SetFilter("Document Type", '%1', recLines."Document Type"::Order);
        if recLines.FindSet() then begin
            if recLines."Unidad Promocional" <> '' then begin
                //recLines.Validate("Cantidad Promocional", recLines.Quantity);
                recLines.Validate(Quantity, recLines."Cantidad Promocional");
                recLines.Validate("Unit Price", recLines."Line Amount");
                reclines.Validate("Unit of Measure Code", recLines."Unidad Promocional");
                recLines.Modify();
                Commit();
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforePerformManualCheckAndRelease', '', false, false)]
    local procedure OnBeforePerformManualCheckAndRelease(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean)
    var
        confBase: Record Item;
        recLines: Record "Sales Line";
        newPrice: decimal;
    begin
        recLines.SetFilter("Document No.", SalesHeader."No.");
        recLines.SetFilter("Document Type", '%1', recLines."Document Type"::Order);
        if recLines.FindSet() then begin
            if recLines."Unidad Promocional" <> '' then begin
                if recLines."Unidad Promocional" = recLines."Unit of Measure Code" then begin
                    newPrice := recLines."Unit Price" / recLines."Quantity (Base)";
                    recLines.Validate("Cantidad Promocional", recLines.Quantity);
                    recLines.Validate(Quantity, recLines."Quantity (Base)");
                    reclines."Promoción" := true;
                    confBase.SetFilter("No.", recLines."No.");
                    if confBase.FindSet() then begin
                        recLines.Validate("Unit of Measure Code", confBase."Base Unit of Measure");
                        recLines.Modify();
                        Commit();
                    end;
                    recLines.Validate("Unit Price", newPrice);
                    // reclines.Validate("Unit of Measure Code", recLines."Unidad Promocional");
                    recLines.Modify();
                    Commit();
                end;
            end;
        end;
    end;




    //********************************EVENTOS***********************************


    //GAP12-001 05 Facturación del Producto Máquina (2803)   GFJ 290424
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post (Yes/No)", 'OnAfterPost', '', false, false)]

    local procedure OnAfterPost(var PurchaseHeader: Record "Purchase Header")
    var
        linesPurch: Record "Purchase Line";
        confAF: Record "FA Setup";
        itemrec: Record Item;
        faLINE: RECORD "FA Journal Line";
        lastfaLINE: RECORD "FA Journal Line";
    begin
        confAF.Get();
        linesPurch.SetFilter("Document No.", PurchaseHeader."No.");
        //linesPurch.SetFilter("Document Type", '%1', linesPurch."Document Type"::);
        if linesPurch.FindSet() then begin
            repeat
                itemrec.Reset();
                itemrec.SetFilter("No.", linesPurch."No.");
                if itemrec.FindFirst then begin
                    if itemrec."Máquina" then begin
                        faLINE.Reset();
                        faLINE.Init();
                        FALINE."Journal Template Name" := confAF."Libro diario Activo Compra Maq";
                        FALINE."Journal Batch Name" := confAF."Seccion diario activo Maquina";
                        lastfaLINE.Reset();
                        lastfaLINE.SetFilter("Journal Template Name", confAF."Libro diario Activo Compra Maq");
                        lastfaLINE.SetFilter("Journal Batch Name", confAF."Seccion diario activo Maquina");
                        if lastfaLINE.FindLast() then faLINE."Line No." := lastfaLINE."Line No." + 10000 else faLINE."Line No." := 10000;
                        lastfaLINE."Debit Amount" := linesPurch."Line Amount";
                        lastfaLINE.Amount := linesPurch."Line Amount";
                        lastfaLINE."Posting Date" := linesPurch."FA Posting Date";
                        lastfaLINE.Insert();
                    end;
                end;
            until linesPurch.Next = 0;
        end;
    end;
    //GAP12-001 05 Facturación del Producto Máquina (2803)   GFJ 290424



    // ++gfj Recepción del Producto Máquina
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", 'OnCodeOnAfterPostSourceDocuments', '', false, false)]

    local procedure OnCodeOnAfterPostSourceDocuments(var WarehouseReceiptHeader: Record "Warehouse Receipt Header"; WarehouseReceiptLine: Record "Warehouse Receipt Line")
    var
        recFixedAssed: Record "Fixed Asset";
        recResource: Record Resource;
        recDAMAsset: Record "DAM Asset";
        rsItem: Record Item;
        purchhEADER: Record "Purchase Header";
    begin
        purchhEADER.SetFilter("No.", WarehouseReceiptLine."Source No.");
        purchhEADER.SetFilter("Document Type", '%1', purchhEADER."Document Type"::Order);
        IF purchhEADER.FindFirst() THEN BEGIN
            rsitem.SetFilter("No.", WarehouseReceiptLine."Item No.");
            if rsItem.FindFirst then begin
                if rsItem."Máquina" then creacionRecepcion(WarehouseReceiptLine);
            end;
        END;
    end;
    // --gfj Recepción del Producto Máquina
}