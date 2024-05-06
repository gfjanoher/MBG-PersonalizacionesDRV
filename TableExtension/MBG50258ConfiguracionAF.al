tableextension 50258 "MBG 50258 Configuracion AF" extends "FA Setup"
{
    fields
    {
        field(50251; "Libro diario Activo Compra Maq"; Code[10])
        {
            TableRelation = "FA Journal Template";
            DataClassification = ToBeClassified;
        }
        field(50250; "Seccion diario activo Maquina"; Code[10])
        {
            TableRelation = "FA Journal Batch";
            DataClassification = ToBeClassified;
        }
    }
}