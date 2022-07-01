//
//  Comprobante.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 28/06/22.
//

import UIKit

class Comprobante: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let foreground = UIImageView()
        foreground.translatesAutoresizingMaskIntoConstraints = false
        foreground.image = UIImage(named: "comprobante_ios")
        view.addSubview(foreground)


        foreground.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        foreground.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        foreground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        foreground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

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
