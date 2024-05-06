page 50260 "Units List"
{
    ApplicationArea = All;
    Caption = 'Unidades de Medida';
    PageType = List;
    SourceTable = "Unit of Measure";
    UsageCategory = Lists;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies a code for the unit of measure that is shown on the item and resource cards where it is used.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the unit of measure.';
                }
            }
        }
    }
}
