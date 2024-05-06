page 50253 "MBG 50253 Listado Hist Venta"
{
    ApplicationArea = All;
    Caption = 'Listado Hist Venta';
    SourceTable = "MBG 50252 Hist Cabecera Venta";
    Editable = FALSE;
    UsageCategory = Lists;
    PageType = List;
    InsertAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; REC."Nº")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    Editable = FALSE;
                    ToolTip = 'Número de documento';
                    Width = 10;
                }


            }
        }
    }
}