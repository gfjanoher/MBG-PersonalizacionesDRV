pageextension 50255 "MBG Rol accountant 50255  " extends "Accountant activities"
{
    layout
    {
        addbefore(Payments)
        {
            group("Group")
            {
                Caption = 'Pendientes de revisión';
                //  Caption = 'General Ledger';
                cuegroup("Activos Fijos")
                {
                    //CueGroupLayout = ver
                    ShowCaption = false;
                    field(AFPend; AFPend)
                    {
                        Caption = 'Activos Fijos';
                        ApplicationArea = All;
                        trigger OnDrillDown()
                        var
                            AFPENDREC: Record "Fixed Asset";
                        begin
                            AFPENDREC.SetFilter("Pendiente revisión", '%1', true);
                            IF AFPENDREC.FindSet() THEN Page.Run(page::"Fixed Asset List", AFPENDREC);

                        end;
                    }
                    field(RecPend; RecPend)
                    {
                        Caption = 'Recursos';
                        ApplicationArea = All;
                        trigger OnDrillDown()
                        var
                            RECPENDREC: Record Resource;
                        begin
                            RECPENDREC.SetFilter("Pendiente revisión", '%1', true);
                            IF RECPENDREC.FindSet() THEN Page.Run(page::"Resource List", RECPENDREC);

                        end;
                    }
                    field(DAMPend; DAMPend)
                    {
                        Caption = 'Activos de mantenimiento';
                        ApplicationArea = All;
                        trigger OnDrillDown()
                        var
                            DAMPENDREC: Record "DAM Asset";
                        begin
                            DAMPENDREC.SetFilter("Pendiente revisión", '%1', true);
                            IF DAMPENDREC.FindSet() THEN Page.Run(page::"DAM Asset List", DAMPENDREC);

                        end;
                    }
                }
            }
        }
    }
    var
        AFPend: INTEGER;
        RecPend: INTEGER;
        DAMPend: INTEGER;

    trigger OnOpenPage()

    var
        AFPENDREC: Record "Fixed Asset";
        RECPENDREC: Record Resource;
        DAMPENDREC: Record "DAM Asset";
    begin

        AFPENDREC.SetFilter("Pendiente revisión", '%1', true);
        IF AFPENDREC.FindSet() THEN
            REPEAT
                AFPend := AFPend + 1;
            UNTIL AFPENDREC.NEXT() = 0;
        RECPENDREC.SetFilter("Pendiente revisión", '%1', true);
        IF RECPENDREC.FindSet() THEN
            REPEAT
                RecPend := RecPend + 1;
            UNTIL RECPENDREC.NEXT() = 0;

        DAMPENDREC.SetFilter("Pendiente revisión", '%1', true);
        IF DAMPENDREC.FindSet() THEN
            REPEAT
                DAMPend := DAMPend + 1;
            UNTIL DAMPENDREC.NEXT() = 0;

    END;
}