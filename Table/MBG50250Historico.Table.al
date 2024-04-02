table 50250 "MBG HistoricoMovConta"
{
    fields
    {
        field(50250; "Nº mov"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(50251; "Nº cuenta"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50252; "Tipo documento"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Pago","Factura","Abono","Documento interés","Recordatorio","Reembolso","Efecto";
        }
        field(50253; "Nº documento"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50254; "Descripción"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(50255; "Cta. contrapartida"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50256; "Importe"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50257; "Importe IVA"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(50258; "Cód. empresa"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50259; "Tipo de registro"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Compra","Venta"," Devolución";
        }
        field(50260; "Tipo contrapartida"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Cuenta","Cliente","Proveedor","Banco","Activo fijo","Socio IC","Empleado","Cuenta de asignación";
        }
        field(50261; "Nº asiento"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(50262; "Importe debe"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(50263; "Importe haber"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(50264; "Fecha emision de documento"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(50265; "Nº documento externo"; Code[35])
        {
            DataClassification = ToBeClassified;
        }

        field(50266; "Tipo procedencia mov."; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Cliente","Proveedor","Banco","Activo fijo","Socio IC","Empresa";
        }

        field(50267; "Cód. procedencia"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(50268; "A/F Tipo mov."; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "","Activo fijo","Mantenimiento";
        }

        field(50269; "Nº Efecto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
}