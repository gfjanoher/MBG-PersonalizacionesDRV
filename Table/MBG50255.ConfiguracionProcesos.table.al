table 50255 "MBG Configuracion Procesos"
{
    fields
    {
        field(1; "No serie maquina"; code[20])
        {
            TableRelation = "No. Series".Code;
        }
        field(2; "Libro Amortizacion AF"; code[20])
        {
            //   TableRelation = "MBG Procesos".Code;
        }
    }
}