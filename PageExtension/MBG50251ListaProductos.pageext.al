pageextension 50251 "MBG 50251 Lista Productos" extends "Item List"
{
    layout
    {
        addlast(content)
        {
            field("Máquina"; rec."Máquina")
            {
                ApplicationArea = All;
                ToolTip = 'Máquina';
            }
            field("Existencia valor cero"; rec."Existencia valor cero")
            {
                ApplicationArea = All;
                ToolTip = 'Existencia valor cero';
            }
        }
    }
}