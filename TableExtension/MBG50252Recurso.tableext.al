tableextension 50252 "MBG 50252 Recurso" extends Resource
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