pageextension 50253 "MBG 50253 Resource card" extends "Resource Card"
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