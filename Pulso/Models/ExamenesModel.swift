//
//  ExamenesModel.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 12/03/22.
//

import Foundation

struct ExamenesModel{
    
    let titulo: String
    let area: String
    
    static func getList() -> [ExamenesModel]{
        let list = [
            ExamenesModel(titulo: "Cibernética y Computación I", area: "matematicas"),
                    
            ExamenesModel(titulo: "Psicología I", area: "experimentales"),
            
            ExamenesModel(titulo: "Historia de México I", area: "historia"),
            ExamenesModel(titulo: "Cálculo I", area: "matematicas"),
            ExamenesModel(titulo: "TLRID I", area: "talleres"),
            ExamenesModel(titulo: "Matemáticas I", area: "matematicas")
        
        ]
        
        return (list)
    }
    
    
}
