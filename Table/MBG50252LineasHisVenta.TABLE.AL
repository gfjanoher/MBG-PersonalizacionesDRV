
table 50252 "MBG 50252 Lineas Hist Venta"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Nº documento"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Nº linea"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Venta a-Nº cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Tipo"; Option)
        {
            OptionMembers = "vacio","cuenta","Artículo","Recurso","Activo fijo","Cargo(Prod.)","Cuenta de asignacion";
        }
        field(5; "Nº"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Cód. almacén"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Fecha envío"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Descripción"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Unidad medida"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Cantidad"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Precio venta"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Coste unitario (DL)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "% IVA"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "% Descuento línea"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "importe dto. línea"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Importe"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Importe IVA incl."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Peso bruto"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Peso neto"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Unidades por lote"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Volumen"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Nº albarán"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "N.º pedido"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Factura-a Nº cliente"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Importe dto. factura"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Tipo cálculo IVA"; Option)
        {
            OptionMembers = "normal","IVA de cargo revertido","Total","Impto. venta","Ningún IVA sujeto";
        }
        field(27; "Naturaleza transacción"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Modo transporte"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Puerto/Aerop. carga"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Área"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Especificación transacción"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Código de cláusula de IVA"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Importe base IVA"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Coste unitario"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Importe línea"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Fecha registro"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Cant. por unidad medida"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Cód. unidad medida"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Cód. categoría producto"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Unidad de medida (ref. art.)"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Cód. auditoría dev."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "% RE"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Cód. de esquema especial"; Option)
        {
            OptionMembers = "01 General","02 Exportación","03 Sistema especial","04 Oro","05 Agencias de viaje","06 Grupos de entidades","07 Efectivo especial","08 IPSI/IGIC";
        }
    }
}
