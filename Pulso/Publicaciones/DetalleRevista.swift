//
//  DetalleRevista.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 23/05/22.
//

import UIKit
import PDFKit
class DetalleRevista: UIViewController {

  
    @IBOutlet weak var tituloRevista: UILabel!
    var titulo: String = ""
    var portada: String = ""
    var url: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pdfUrl = URL(string: url)
        tituloRevista.text = titulo
        let pdfView = PDFView(frame: self.view.bounds)
            pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(pdfView)
            
          
            pdfView.autoScales = true
       
        if let pdfUrl = pdfUrl {
            pdfView.document = PDFDocument(url: pdfUrl)
        }
        
      
      

        // Do any additional setup after loading the view.
    }
    

  

}
