//
//  ReviewModel.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 17/06/22.
//

import Foundation

struct ReviewModel{
    let publicacion: String
    let portada: [String]
    let titulo: [String]
    let numero: [String]
    let url: [String]
    
    init(publicacion: String,portada: [String],titulo: [String],numero:[String],url: [String]){
        self.publicacion = publicacion
        self.portada = portada
        self.titulo = titulo
        self.numero = numero
        self.url = url
    }
    
}

