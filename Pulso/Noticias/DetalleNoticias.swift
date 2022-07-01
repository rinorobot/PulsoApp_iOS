//
//  DetalleNoticias.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 18/05/22.
//

import UIKit
import WebKit

class DetalleNoticias: UIViewController {
    
   
    
    var titulo_detalle: String = ""
    var fecha_detalle: String = ""
    var descripcion_detalle: String = ""
    var imagen_detalle: String = ""
    var url_detalle: String = ""
  

   
    @IBOutlet weak var webview: WKWebView!
    
    
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var descripcion: UITextView!
    
  
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fondo()
        
        
        
        titulo.text = titulo_detalle
        descripcion.text = descripcion_detalle
        fecha.text = fecha_detalle
        

        
        
    let url = URL(string:url_detalle)
        
        webview.load(URLRequest(url: url!))
        webview.allowsBackForwardNavigationGestures = true
      /*  let noticias = NoticiasModel.getList()[index ?? 0]
        
        titulo.text = noticias.titulo
        descripcion.text = noticias.descripcion
        imagen.image = UIImage(named: noticias.imagen)*/

        // Do any additional setup after loading the view.
    }
    
    func fondo(){
        let background = UIImage(named: "final_fondo")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
imageView.contentMode =  .scaleToFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
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
