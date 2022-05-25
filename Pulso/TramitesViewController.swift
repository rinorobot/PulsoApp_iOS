//
//  TramitesViewController.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 05/03/22.
//

import UIKit

class TramitesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "UNAM | CCH-NAUCALPAM"
        
       

               fondo()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
       
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

