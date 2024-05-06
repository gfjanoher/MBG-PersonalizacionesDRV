pageextension 50254 "MBG 50254 DAM" extends "DAM Asset Card"
{
    layout
    {
        addlast(General)
        {
            field("Pendiente revisión"; rec."Pendiente revisión")
            {
                ApplicationArea = All;
                Caption = 'Pendiente revisión';
                ToolTip = 'Indica si el activo fijo está pendiente de revisión';
            }
        }
        addlast(content)
        {
            part("MBG 50258 Componentes List"; "MBG 50258 Componentes List")
            {
                ApplicationArea = All;
                Caption = 'Componentes';
                SubPageLink = "Código" = FIELD("No."), Table = const(70479525);
            }
        }
    }
}