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
    }
}