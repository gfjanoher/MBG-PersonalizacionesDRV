page 50257 "MBG Configuracion Procesos"
{
    ApplicationArea = All;
    Caption = 'MBG Configuracion Procesos';
    UsageCategory = Administration;
    PageType = card;
    SourceTable = "MBG Configuracion Procesos";
    Editable = false;
    InsertAllowed = false;
    layout
    {
        area(content)
        {
            repeater(Procesos)
            {
                field("No serie maquina"; rec."No serie maquina")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}