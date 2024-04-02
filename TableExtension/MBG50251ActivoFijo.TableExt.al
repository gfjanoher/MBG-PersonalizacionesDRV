tableextension 50251 "MBG 50251 Activo Fijo" extends "Fixed Asset"
{
    fields
    {
        // ++ 200324 GFJ GAP 2103-3 Recepcion
        field(50250; "Pendiente revisión"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = false;
        }
        // -- 200324 GFJ GAP 2103-3 Recepcion
    }
}