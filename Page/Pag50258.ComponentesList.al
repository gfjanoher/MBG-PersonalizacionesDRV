page 50258 "MBG 50258 Componentes List"
{
    ApplicationArea = All;
    Caption = 'Componentes List';
    PageType = ListPart;
    SourceTable = "MBG 50256 Componentes";
    //UsageCategory = Lists;
    InsertAllowed = false;
    DeleteAllowed = FALSE;
    ModifyAllowed = FALSE;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Código"; rec."Código")
                {
                    ApplicationArea = All;
                }
                field("No Producto"; rec."No Producto")
                {
                    ApplicationArea = All;
                }
                field("Descripción"; rec."Descripción")
                {
                    ApplicationArea = All;
                }
                field("No Serie"; rec."No Serie")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
