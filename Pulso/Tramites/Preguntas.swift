//
//  Preguntas.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 30/06/22.
//

import UIKit

class Preguntas: UIViewController {

    @IBOutlet weak var fondoVIew: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fondoVIew.backgroundColor = UIColor(patternImage: UIImage(named: "final_fondo")!)
     
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
