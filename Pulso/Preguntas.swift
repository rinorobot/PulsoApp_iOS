//
//  Preguntas.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 17/05/22.
//

import UIKit

class Preguntas: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fondo()

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

}
