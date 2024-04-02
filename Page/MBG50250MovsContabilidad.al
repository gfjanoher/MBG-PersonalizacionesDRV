
page 50250 "MBG50250 Historico Mov. Cont."
{
    PageType = List;
    ApplicationArea = all;
    SourceTable = "MBG HistoricoMovConta";
    layout
    {
        area(content)
        {
            repeater(Repeater)
            {


                field("Nº mov."; rec."Nº mov")
                {
                    ApplicationArea = All;
                }

                field("Nº cuenta"; rec."Nº cuenta")
                {
                    ApplicationArea = All;
                }
                field("Tipo documento"; rec."Tipo documento")
                {
                    ApplicationArea = All;
                }
                field("Nº documento"; rec."Nº documento")
                {
                    ApplicationArea = All;
                }
                field("Descripción"; rec."Descripción")
                {
                    ApplicationArea = All;
                }
                field("Cta. contrapartida"; rec."Cta. contrapartida")
                {
                    ApplicationArea = All;
                }
                field("Importe"; rec."Importe")
                {
                    ApplicationArea = All;
                }
                field("Importe IVA"; rec."Importe IVA")
                {
                    ApplicationArea = All;
                }
                field("Cód. empresa"; rec."Cód. empresa")
                {
                    ApplicationArea = All;
                }
                field("Tipo de registro"; rec."Tipo de registro")
                {
                    ApplicationArea = All;
                }
                field("Tipo contrapartida"; rec."Tipo contrapartida")
                {
                    ApplicationArea = All;
                }
                field("Nº asiento"; rec."Nº asiento")
                {
                    ApplicationArea = All;
                }
                field("Importe debe"; rec."Importe debe")
                {
                    ApplicationArea = All;
                }
                field("Importe haber"; rec."Importe haber")
                {
                    ApplicationArea = All;
                }
                field("Fecha emision de documento"; rec."Fecha emision de documento")
                {
                    ApplicationArea = All;
                }
                field("Nº documento externo"; rec."Nº documento externo")
                {
                    ApplicationArea = All;
                }
                field("Tipo procedencia mov."; rec."Tipo procedencia mov.")
                {
                    ApplicationArea = All;
                }
                field("Cód. procedencia"; rec."Cód. procedencia")
                {
                    ApplicationArea = All;
                }
                field("A/F Tipo mov."; rec."A/F Tipo mov.")
                {
                    ApplicationArea = All;
                }
                field("Nº Efecto"; rec."Nº Efecto")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
