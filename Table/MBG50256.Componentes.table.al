table 50256 "MBG 50256 Componentes"
{
    fields
    {
        field(5; Table; integer)
        {

        }
        field(1; Código; Code[20])
        {
            TableRelation = if (Table = const(156)) Resource else
            if (Table = const(70479525)) "DAM Asset" else
            if (Table = const(5600)) "Fixed Asset";
        }
        field(2; Descripción; Text[200])
        {

        }
        field(3; "No Producto"; Code[20])
        {
            TableRelation = "Item"."No.";
        }
        field(4; "No Serie"; text[50])
        {

        }
    }
}