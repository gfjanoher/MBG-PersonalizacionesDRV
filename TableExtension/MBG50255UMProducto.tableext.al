tableextension 50255 "MBG 50254 Unidad Medida Item" extends "item Unit of Measure"
{
    fields
    {

        field(50250; "Unidad Promocional"; Boolean)
        {
            DataClassification = ToBeClassified;
            InitValue = false;
        }

        modify(Code)
        {
            trigger OnAfterValidate()
            var
                UM: Record "Unit of Measure";
            begin
                UM.SetFilter("Code", Code);
                if um.FindSet() then
                    "Unidad Promocional" := UM."Unidad Promocional";
            end;
        }
    }

}