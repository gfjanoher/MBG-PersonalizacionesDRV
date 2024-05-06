page 50259 MBG50259NecesidadesCompraList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Necesidades de Compra';
    SourceTable = item;
    layout
    {
        area(Content)
        {
            repeater(Items)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    Editable = false;
                }

                field("Description"; rec."Description")
                {
                    ApplicationArea = All;
                    //  Caption = 'Description';
                    Editable = false;
                }
                field(Inventory; rec.Inventory)
                {
                    ApplicationArea = All;
                    //  Caption = 'Inventory';
                    Editable = false;
                }
                field(entradasPrevistasTot; entradasPrevistas(rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Entradas Previstas';
                }
                field(salidasPrevistasTot; salidasPrevistas(rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Salidas Previstas';
                }
                field(necesidadesCompraTot; necesidadesCompra(rec."No."))
                {
                    ApplicationArea = All;
                    Caption = 'Necesidades de Compra';
                    Editable = false;
                }
                field("Safety Stock Quantity"; rec."Safety Stock Quantity")
                {
                    ApplicationArea = All;
                    //    Caption = 'Safety Stock Quantity';
                    Editable = false;
                }
                field("Reorder Quantity"; rec."Reorder Quantity")
                {
                    ApplicationArea = All;
                    //   Caption = 'Reorder Quantity';
                    Editable = false;
                }
                field("Vendor No."; rec."Vendor No.")
                {
                    ApplicationArea = All;
                    //    Caption = 'Vendor No.';
                    Editable = false;
                }
                field("Lead Time Calculation"; rec."Lead Time Calculation")
                {
                    ApplicationArea = All;
                    //    Caption = 'Lead Time Calculation';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        /*area(Content)
        {
            action("New"; ActionType = Insert)
            {
                ApplicationArea = All;
                Caption = 'New';
            }
        }*/
    }


    procedure entradasPrevistas(ItemNo: Code[20]): decimal
    var
        SalesLine: Record "purchase Line";
        Count: decimal;
        prodLine: Record "Prod. Order Line";
    begin
        Count := 0;
        SalesLine.SETRANGE("No.", ItemNo);
        IF SalesLine.FINDSET THEN BEGIN
            REPEAT
                Count += SalesLine."Quantity (Base)";
            UNTIL SalesLine.NEXT = 0;
        END;
        prodLine.SetFilter("Item No.", ItemNo);
        prodLine.SETRANGE("Status", prodLine.Status::Released);
        IF prodLine.FINDSET THEN BEGIN
            REPEAT

                Count += prodLine."Quantity (Base)" - prodLine."Finished Qty. (Base)";
            UNTIL prodLine.NEXT = 0;
        END;
        prodLine.Reset();
        prodLine.SetFilter("Item No.", ItemNo);
        prodLine.SETRANGE("Status", prodLine.Status::"Firm Planned");
        IF prodLine.FINDSET THEN BEGIN
            REPEAT

                Count += prodLine."Quantity (Base)" - prodLine."Finished Qty. (Base)";
            UNTIL prodLine.NEXT = 0;
        END;
        cant1 := Count;
        EXIT(Count);
    end;

    procedure salidasPrevistas(ItemNo: Code[20]): decimal
    var
        SalesLine: Record "Sales Line";
        Count: decimal;
        prodOrder: record "Prod. Order Component";
        assembly: record "Assembly Line";
    begin
        Count := 0;
        SalesLine.SETRANGE("No.", ItemNo);
        IF SalesLine.FINDSET THEN BEGIN
            REPEAT
                Count += SalesLine."Quantity (Base)";
            UNTIL SalesLine.NEXT = 0;
        END;
        prodOrder.setfilter("Item No.", ItemNo);
        prodOrder.SETRANGE("Status", prodOrder.Status::Released);
        IF prodOrder.FINDSET THEN BEGIN
            REPEAT

                Count += prodOrder."Expected Qty. (Base)";
            UNTIL prodOrder.NEXT = 0;
        END;
        prodOrder.Reset();
        prodOrder.SetFilter("Item No.", ItemNo);
        prodOrder.SETRANGE("Status", prodOrder.Status::"Firm Planned");
        IF prodOrder.FINDSET THEN BEGIN
            REPEAT
                Count += prodOrder."Expected Qty. (Base)";
            UNTIL prodOrder.NEXT = 0;
        END;
        assembly.SetFilter("No.", ItemNo);
        // assembly.SetFilter(stat);
        IF assembly.FINDSET THEN BEGIN
            REPEAT
                Count += assembly."Quantity (Base)";
            UNTIL assembly.NEXT = 0;
        END;
        cant2 := Count;
        EXIT(Count);
    end;

    procedure necesidadesCompra(ItemNo: Code[20]): decimal
    var
    begin

        exit(rec.Inventory + cant1 - cant2);
    end;

    var
        cant1: Decimal;
        cant2: Decimal;
}