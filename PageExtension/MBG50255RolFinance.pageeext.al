pageextension 50255 "MBG Rol finance 50255  " extends "Finance Manager Role Center"
{
    layout
    {
        addlast(RoleCenter)
        {
            group("Group")
            {
                Caption = 'General Ledger';
                part(revisionesPendientes; "MBG AF Revisiones")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Revisiones pendientes';

                }
            }
        }
    }
}