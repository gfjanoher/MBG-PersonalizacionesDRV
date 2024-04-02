pageextension 50250 "MBG 50250 Ficha Producto" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            group(Configuraciones)
            {
                field("Máquina"; rec."Máquina") { ApplicationArea = All; }
                field("Existencia valor cero"; rec."Existencia valor cero") { ApplicationArea = All; }
                field("Global Dimension 1 Code"; rec."Global Dimension 1 Code") { ApplicationArea = All; ShowMandatory = true; }
                field("Global Dimension 2 Code"; rec."Global Dimension 2 Code") { ApplicationArea = All; ShowMandatory = true; }
            }

        }
        modify("Item Tracking Code")
        {
            ShowMandatory = rec."Máquina";
        }
    }
}