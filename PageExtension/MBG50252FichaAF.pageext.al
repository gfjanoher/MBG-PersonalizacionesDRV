pageextension 50252 "MBG 50252 Fixed Asset Card" extends "Fixed Asset Card"
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
                SubPageLink = "Código" = FIELD("No."), Table = const(5600);
            }
        }
    }
}