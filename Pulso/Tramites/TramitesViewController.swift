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
        if #available(iOS 13.0, *) {
            let infoBtn = UIBarButtonItem(image: UIImage(systemName: "info")!,style: .plain, target: self, action: #selector(irInformacion))
            navigationItem.rightBarButtonItem = infoBtn
        } else {
            // Fallback on earlier versions
        }
      

               fondo()
        
       
       
    }
    
    @objc func irInformacion(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let infoVC = story.instantiateViewController(withIdentifier: "info") as! Info
     
        
        self.present(infoVC, animated: true, completion: nil)
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

