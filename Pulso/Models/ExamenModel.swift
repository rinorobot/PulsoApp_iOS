//
//  ExamenModel.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 20/06/22.
//

import Foundation


struct ExamenModel{
    let area: String
    let mensaje: String
    let nombre_examen: String
    let preguntas: String
    let key: String
    
    init(area:String, mensaje:String,nombre_examen:String,preguntas:String,key:String) {
        self.area = area
        self.mensaje = mensaje
        self.nombre_examen = nombre_examen
        self.preguntas = preguntas
        self.key = key
    }
    
}
