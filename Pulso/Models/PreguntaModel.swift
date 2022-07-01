//
//  PreguntaModel.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 20/06/22.
//

import Foundation

struct PreguntaModel{
    let correcta: String
    let linkA: String
    let linkB: String
    let linkC: String
    let linkD: String
    let linkPregunta: String
    let pregunta: String
    let respuestaA: String
    let respuestaB: String
    let respuestaC: String
    let respuestaD: String
   
    
    init(correcta:String, linkA:String,linkB:String,linkC:String,linkD:String,linkPregunta:String,pregunta:String,respuestaA:String,respuestaB:String,respuestaC:String,respuestaD:String ) {
        self.correcta = correcta
        self.linkA = linkA
        self.linkB = linkB
        self.linkC = linkC
        self.linkD = linkD
        self.linkPregunta = linkPregunta
        self.pregunta = pregunta
        self.respuestaA = respuestaA
        self.respuestaB = respuestaB
        self.respuestaC = respuestaC
        self.respuestaD = respuestaD
    }
    
}

