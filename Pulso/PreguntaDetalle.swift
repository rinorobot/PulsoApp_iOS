//
//  PreguntaDetalle.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 15/03/22.
//

import UIKit

class PreguntaDetalle: ViewController {
    
    var index: Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

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
