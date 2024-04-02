table 50251 "MBG 50252 Hist Cabecera Venta"
{

    DataClassification = ToBeClassified;

    fields
    {
        field(50250; "Nº"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50251; "Venta a-Nº cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50252; "Factura-a Nº cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50253; "Fact. a-Nombre"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50254; "Fact. a-Nombre 2"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50255; "Fact. a-Dirección"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50256; "Fact. a-Población"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50257; "Fact. a-Atención"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Nombre dirección de envío"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50258; "Dirección de envío"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50259; "Población dirección de envío"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50260; "Contacto de dirección de envío"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50261; "Fecha registro"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50262; "Texto de registro"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50263; "Cód. términos pago"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50264; "Fecha vencimiento"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50265; "Cód. almacén"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50266; "Cód. divisa"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50267; "Factor divisa"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50268; "Cód. idioma"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50269; "Cód. vendedor"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50270; "Nº pedido"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50271; "CIF/NIF"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50272; "Naturaleza transacción"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50273; "Modo transporte"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50274; "Cód. IVA país/región"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50275; "Venta a-Nombre"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50276; "Venta a-Dirección"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50277; "Venta a-Población"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50278; "Venta a-Atención"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50279; "Fact. a-C.P."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50280; "Fact. a-Provincia"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50281; "Fact. a-Cód. país/región"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50282; "Venta a-C.P."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50283; "Venta a-Provincia"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50284; "Venta a-Cód. país/región"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50285; "C.P. dirección de envío"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50286; "Provincia dirección de envío"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(50287; "Cód. país/región dir envío"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50288; "Puerto/Aerop. carga"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50289; "Fecha emisión documento"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50290; "Nº documento externo"; Code[35])
        {
            DataClassification = ToBeClassified;
        }
        field(50291; "Área"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50292; "Especificación transacción"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50293; "Cód. forma pago"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50294; "Cód. transportista"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50295; "Cód. origen"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(50296; "Valor de descuento en factura"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50297; "Nº oferta"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50298; "Código cuenta bancaria empresa"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50299; "Correo electrónico"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Corrección; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50300; "Referencia de pago"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50301; "Descripción del trabajo"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(50302; "Tipo de factura"; Option)
        {
            OptionMembers = "F1 Factura","F2 Factura simplificada","F3 Factura emitida","F4 Mov resumen fact","R1 Factura corregida";
        }
        field(50303; "Tipo de abono"; Option)
        {
            OptionMembers = "R1 Factura corregida","F2 Factura corregida (art 80.3)","R3 Factura corregida (art 80.4)","R4 Factura corregida(otros)","R5 Factura corregida en";
        }
        field(50304; "Cód. de esquema especial"; Option)
        {
            OptionMembers = "01 General","02 Exportación","03 Sistema especial","04 Oro","05 Agencias de viaje","06 Grupos de entidades","07 Efectivo especial","08 IPSI/IGIC";
        }
        field(50305; "Descripción de la operación"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(1; "Su/Ntra. ref."; Text[35])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Recibido-de Cód. país/región"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Cód. servicio transportista"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Nº devolución"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "N.º factura corregida"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Tipo de corrección"; Option)
        {
            OptionMembers = "","Sustitución","Dfiferencia","Eliminación";
        }
    }
}
