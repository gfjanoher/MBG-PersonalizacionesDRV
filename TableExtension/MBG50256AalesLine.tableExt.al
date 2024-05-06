tableextension 50256 "MBG 50256 salesline" extends "Sales Line"
{
    fields
    {

        field(50250; "Unidad Promocional"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(50251; "Cantidad Promocional"; decimal)
        {
            DataClassification = ToBeClassified;
            //    TableRelation = "Unit of Measure";
        }
        field(50252; Promoción; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        modify("Unit of Measure code")
        {
            trigger OnAfterValidate()
            var
                unitOfMeasure: Record "Unit of Measure";
            begin
                unitOfMeasure.SetFilter(Code, "Unit of Measure code");

                if unitOfMeasure.FindSet() then
                    if unitofmeasure."Unidad Promocional" then begin
                        "Unidad Promocional" := unitOfMeasure.Code;
                    end else begin

                    end;

            end;
        }
    }

}