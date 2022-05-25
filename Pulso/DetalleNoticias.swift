//
//  DetalleNoticias.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 18/05/22.
//

import UIKit

class DetalleNoticias: UIViewController {
    
    var index: Int? = nil
    
    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var descripcion: UITextView!
    
    @IBOutlet weak var imagen: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let noticias = NoticiasModel.getList()[index ?? 0]
        
        titulo.text = noticias.titulo
        descripcion.text = noticias.descripcion
        imagen.image = UIImage(named: noticias.imagen)

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
