//
//  Sustancias.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 28/06/22.
//

import UIKit
import PDFKit
class Sustancias: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let path = Bundle.main.url(forResource: "sustancias", withExtension: "pdf") else { return }

        let pdfView = PDFView(frame: self.view.bounds)
            pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(pdfView)
            
         
            pdfView.autoScales = true
       
            pdfView.document = PDFDocument(url: path)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
