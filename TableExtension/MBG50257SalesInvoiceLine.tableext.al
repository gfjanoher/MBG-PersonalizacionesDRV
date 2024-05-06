tableextension 50257 "MBG 50257 sales inv line" extends "Sales invoice Line"
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

    }
}