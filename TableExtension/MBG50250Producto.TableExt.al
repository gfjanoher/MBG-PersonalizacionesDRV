tableextension 50250 "MBG 50250 Producto" extends "Item"
{
    fields
    {
        // ++ 200324 GFJ GAP 2103-1 Alta Producto
        field(50250; "Máquina"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = false;
        }
        field(50251; "Existencia valor cero"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = false;
            //Sí: Este producto no hará ningún asiento de valoración de existencias. 
            //No. Se comporta como un producto normal. 
        }
        // -- 200324 GFJ GAP 2103-1 Alta Producto
    }

}