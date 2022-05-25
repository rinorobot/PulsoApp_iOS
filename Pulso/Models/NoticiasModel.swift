//
//  NoticiasModel.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 10/03/22.
//

import Foundation

struct NoticiasModel{
    
    let titulo: String
    let fecha: String
    let descripcion: String
    let imagen: String
    
    static func getList() -> [NoticiasModel]{
        let list = [
            NoticiasModel(titulo: "Pulso 300",fecha: "11 de marzo de 2022",descripcion: "Presentamos el nuevo número de la revista Pulso. Hablamos de la designación del nuevo director.", imagen: "noticia1"),
            NoticiasModel(titulo: "Beca conectividad",fecha: "10 de marzo de 2022",descripcion: "Si deseas obtener por primera vez la beca conectividad y obtener una tablet con conexión a intener, da clic aquí.", imagen: "noticia2"),
            NoticiasModel(titulo: "Beca Benito Juárez",fecha: "9 de marzo", descripcion: "Te informamos que a partir del 20 de febrero ya se están realizando los pagos para el periodo febrero-mayo.", imagen: "noticia3"),
            NoticiasModel(titulo: "Asesoría de inglés-francés",fecha: "8 de marzo", descripcion: "Ahora pudes solicitar asesoría de las asignaturas de inglés y francés por medio del PSI.", imagen: "noticia4")
        
        
        ]
        
        return (list)
    }
    
    
}
