//
//  PublicacionesViewController.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 05/03/22.
//


import UIKit


let lista_revistas = [
    RevistaData(publicacion: "Pulso",portada: ["Pulso283","Pulso282","pulso255","pulso254","pulso254esp"],titulo: ["Pulso 283","Pulso 282","Pulso 255","Pulso 254", "Pulso 254 expecial"], numero: ["1","2","3","4","5"]),
    RevistaData(publicacion: "Fanátika",portada: ["fanatika28","fanatika27","fanatika26"],titulo: ["Fanátika 28","Fanátika 27","Fanátika 26"], numero: ["1","2","3"]),
    RevistaData(publicacion: "Pulso académico",portada: ["pulsoacademico19","pulsoacademico18","pulsoacademico17"],titulo: ["Pulso académico 19","Pulso académico 18","Pulso académico 17"], numero: ["1","2","3"]),
   
]


class PublicacionesViewController: UIViewController{
    
    
   
    
    


    @IBOutlet weak var tablaPublicaciones: UITableView!
    //var modelPublicaciones = [PublicacionesModel]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UNAM | CCH-NAUCALPAN"
        
        fondo()
      
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

extension PublicacionesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablaPublicaciones.dequeueReusableCell(withIdentifier: "cellPublicaciones") as! PublicacionTableViewCell
        cell.cvPublicaciones.tag = indexPath.section
        cell.cvPublicaciones.reloadData()
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return lista_revistas.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return lista_revistas[section].publicacion
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .yellow
    }
    
  
    
    
}


