codeunit 50250 "MBG Funciones Generales 50250"
{
    procedure creacionRecepcion(var whLine: record "Warehouse Receipt Line")
    var
        newResource: Record Resource;
        itemLine: Record Item;
        newDAMasset: Record "DAM Asset";
        newAF: record "Fixed Asset";
    begin
        itemLine.SetFilter("No.", whLine."Item No.");
        if itemLine.FindFirst then begin
            newResource.Init();
            //  newResource. //esperamos a la configuracion
            newResource.Name := itemLine.Description;
            //newResource.Bastidor  //Código que se le da al Producto en Seguim. prod. al recibir la línea. 
            newResource."Pendiente revisión" := true;
            //dimension 1 y 2 del producto
            //generar capacidad desde hoy hasta 31/12/2100  
            newResource.Blocked := true;
            // newResource."Centro FF" : = // centro responsabilidad falta definir
            newResource.Insert(true);




            newAF.Init();
            // newAF."No."//esperamos a la configuracion
            newAF.Description := itemLine.Description;
            //  newaf."Serial No."  //no esta definido
            newAF."Pendiente revisión" := true;
            newAF."Blocked" := true;
            newAF."Recurso relacionado" := newResource."No.";
            //dimension 1 y 2

            newAF.Insert(true);

            newDAMasset.Init();
            //newDAMasset."No." := //esperar conf
            newDAMasset.Description := itemLine.Description;
            //newAF."Serial No." := itemLine."Serial No."; //no definido
            //newDAMasset."Pendiente revisión" := true;
            //newDAMasset."Blocked" := true;
            //dimensiones
            //newDAMasset.a
            newDAMasset.Insert();



        end;
    end;
}