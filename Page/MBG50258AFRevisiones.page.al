page 50258 "MBG AF Revisiones"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    //   SourceTable = "CUEM Expenses Manager";
    SourceTable = "Fixed Asset";
    Caption = 'Revisiones pendientes';

    layout
    {
        area(Content)
        {
            field(AFPend; AFPend)
            {
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
                ApplicationArea = All;
                trigger OnDrillDown()
                var
                    DAMPENDREC: Record "DAM Asset";
                begin
                    //   DAMPENDREC.SetFilter("Pendiente revisión", '%1', true);
                    IF DAMPENDREC.FindSet() THEN Page.Run(page::"DAM Asset List", DAMPENDREC);

                end;
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

        /*   DAMPENDREC.SetFilter("Pendiente revisión", '%1', true);
                IF DAMPENDREC.FindSet() THEN
                    REPEAT
                        DAMPend := DAMPend + 1;
                    UNTIL DAMPENDREC.NEXT() = 0;*/

    END;
}