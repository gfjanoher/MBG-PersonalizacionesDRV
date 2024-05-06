pageextension 50258 "MBG 50258 Sles Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("Unidad Promocional"; rec."Promoción")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Unit of Measure Code")
        {
            trigger OnAfterValidate()
            var


                unitOfMeasure: Record "Unit of Measure";
            begin
                unitOfMeasure.SetFilter(Code, rec."Unit of Measure code");

                if unitOfMeasure.FindSet() then
                    if unitofmeasure."Unidad Promocional" then begin
                        //  "Unidad Promocional" := unitOfMeasure.Code;
                        rec."Promoción" := true;
                    end else begin
                        rec."Unidad Promocional" := '';
                        rec."Promoción" := false;
                        rec."Cantidad Promocional" := 0;
                    end;

            end;

            trigger OnLookup(var Text: Text): Boolean
            var
                lookItemsearch: record "Unit of Measure" temporary;
                recItemsearch: record "Item Unit of Measure";
                copyItemsearch: record "Unit of Measure";
                lookpage: page "Item Units of Measure";
                salesPrice: Record "Price List Line";
                customer: Record Customer;
                recContact: Record "Contact";
                headerrs: Record "Sales Header";
            begin
                if rec."No." <> '' then begin
                    recItemsearch.SetFilter("Item No.", rec."No.");
                    if recItemsearch.FindSet() then begin
                        repeat
                            if recItemsearch."Unidad Promocional" then begin

                                customer.SetFilter("No.", rec."Sell-to Customer No.");
                                if customer.FindSet() then begin
                                    salesprice.Reset();
                                    salesPrice.SetFilter("Price Type", '%1', salesPrice."Price Type"::Sale);
                                    salesPrice.SetFilter("Source Type", '%1', salesPrice."Source Type"::All);
                                    if salesPrice.FindSet() then begin
                                        repeat
                                            copyItemsearch.Reset();
                                            copyItemsearch.SetFilter("Code", recItemsearch.Code);
                                            if copyItemsearch.FindSet() then begin
                                                lookItemsearch := copyItemsearch;
                                                lookItemsearch.Insert();
                                            end;
                                        until salesPrice.Next = 0;
                                    end;
                                    salesprice.Reset();
                                    salesPrice.SetFilter("Product No.", rec."No.");
                                    salesPrice.SetFilter("Unit of Measure Code", recItemsearch.Code);
                                    salesPrice.SetFilter("Price Type", '%1', salesPrice."Price Type"::Sale);
                                    salesPrice.SetFilter("Source Type", '%1', salesPrice."Source Type"::"All Customers");
                                    if salesPrice.FindSet() then begin
                                        repeat
                                            copyItemsearch.Reset();
                                            copyItemsearch.SetFilter("Code", recItemsearch.Code);
                                            if copyItemsearch.FindSet() then begin
                                                lookItemsearch := copyItemsearch;
                                                lookItemsearch.Insert();
                                            end;
                                        until salesPrice.Next = 0;
                                    end;
                                    salesprice.Reset();
                                    salesPrice.SetFilter("Product No.", rec."No.");
                                    salesPrice.SetFilter("Unit of Measure Code", recItemsearch.Code);
                                    salesPrice.SetFilter("Price Type", '%1', salesPrice."Price Type"::Sale);
                                    salesPrice.SetFilter("Source Type", '%1', salesPrice."Source Type"::Campaign);
                                    if salesPrice.FindSet() then begin
                                        headerrs.SetFilter("No.", rec."No.");
                                        if headerrs.FindSet() then begin
                                            repeat

                                                if headerrs."Campaign No." = salesPrice."Source No." then begin
                                                    copyItemsearch.Reset();
                                                    copyItemsearch.SetFilter("Code", recItemsearch.Code);
                                                    if copyItemsearch.FindSet() then begin
                                                        lookItemsearch := copyItemsearch;
                                                        lookItemsearch.Insert();
                                                    end;
                                                end;

                                            until salesPrice.Next = 0;
                                        end;
                                    end;
                                    salesprice.Reset();
                                    salesPrice.SetFilter("Product No.", rec."No.");
                                    salesPrice.SetFilter("Unit of Measure Code", recItemsearch.Code);
                                    salesPrice.SetFilter("Price Type", '%1', salesPrice."Price Type"::Sale);
                                    salesPrice.SetFilter("Source Type", '%1', salesPrice."Source Type"::Customer);
                                    if salesPrice.FindSet() then begin
                                        repeat
                                            if salesPrice."Source No." = rec."Sell-to Customer No." then begin
                                                copyItemsearch.Reset();
                                                copyItemsearch.SetFilter("Code", recItemsearch.Code);
                                                if copyItemsearch.FindSet() then begin
                                                    lookItemsearch := copyItemsearch;
                                                    lookItemsearch.Insert();
                                                end;
                                            end;
                                        until salesPrice.Next = 0;
                                    end;
                                    salesprice.Reset();
                                    salesPrice.SetFilter("Product No.", rec."No.");
                                    salesPrice.SetFilter("Unit of Measure Code", recItemsearch.Code);
                                    salesPrice.SetFilter("Price Type", '%1', salesPrice."Price Type"::Sale);
                                    salesPrice.SetFilter("Source Type", '%1', salesPrice."Source Type"::"Customer Price Group");
                                    if salesPrice.FindSet() then begin
                                        repeat
                                            if salesPrice."Source No." = customer."Customer Price Group" then begin
                                                copyItemsearch.Reset();
                                                copyItemsearch.SetFilter("Code", recItemsearch.Code);
                                                if copyItemsearch.FindSet() then begin
                                                    lookItemsearch := copyItemsearch;
                                                    lookItemsearch.Insert();
                                                end;
                                            end;
                                        until salesPrice.Next = 0;
                                    end;
                                    salesprice.Reset();
                                    salesPrice.SetFilter("Product No.", rec."No.");
                                    salesPrice.SetFilter("Unit of Measure Code", recItemsearch.Code);
                                    salesPrice.SetFilter("Price Type", '%1', salesPrice."Price Type"::Sale);
                                    salesPrice.SetFilter("Source Type", '%1', salesPrice."Source Type"::Contact);
                                    if salesPrice.FindSet() then begin
                                        repeat
                                            recContact.Reset();
                                            recContact.SetFilter("No.", '%1', salesPrice."Source No.");
                                            //recContact.SetFilter(  , rec."Sell-to Customer No.");
                                            if salesPrice."Source No." = customer.Contact then begin
                                                copyItemsearch.Reset();
                                                copyItemsearch.SetFilter("Code", recItemsearch.Code);
                                                if copyItemsearch.FindSet() then begin
                                                    lookItemsearch := copyItemsearch;
                                                    lookItemsearch.Insert();
                                                end;
                                            end;
                                        until salesPrice.Next = 0;
                                    end;
                                end;
                            end else begin
                                copyItemsearch.Reset();
                                copyItemsearch.SetFilter("Code", recItemsearch.Code);
                                if copyItemsearch.FindSet() then begin
                                    lookItemsearch := copyItemsearch;
                                    lookItemsearch.Insert();
                                end;
                            end;
                        until recItemsearch.Next = 0;
                    end;
                end;
                if page.RunModal(page::"Units List", lookItemsearch) = Action::LookupOK then rec.Validate("Unit of Measure Code", lookItemsearch.Code);

            end;
        }
    }
}