//
//  DetalleRevista.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 23/05/22.
//

import UIKit

class DetalleRevista: UIViewController {

    @IBOutlet weak var portadaRevista: UIImageView!
    @IBOutlet weak var tituloRevista: UILabel!
    var titulo = ""
    var portada = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloRevista.text = titulo
        portadaRevista.image = UIImage(named: portada)

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
