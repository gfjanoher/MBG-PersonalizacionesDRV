page 50254 "MBG 50253 Listado Hist compra"
{
    ApplicationArea = All;
    Caption = 'Listado Hist Compra';
    SourceTable = "MBG 50253 Hist Cabecera compra";
    Editable = FALSE;
    InsertAllowed = false;
    UsageCategory = Lists;
    PageType = List;
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