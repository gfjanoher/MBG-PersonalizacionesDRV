pageextension 50259 "MBG 50259 Configuración AF" extends "Fixed Asset Setup"
{
    layout
    {
        addlast(General)
        {
            field("Pendiente revisión"; rec."Libro diario Activo Compra Maq")
            {
                ApplicationArea = All;
                Caption = 'Libro diario Activo Compra Máquina';
                //   ToolTip = 'Indica si el activo fijo está pendiente de revisión';
            }
            field("Sección diario activo Maquina"; rec."Seccion diario activo Maquina")
            {
                ApplicationArea = All;
                Caption = 'Sección diario activo Máquina';
                //   ToolTip = 'Indica si el activo fijo está pendiente de revisión';
            }
        }

    }
}