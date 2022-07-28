//
//  ExamenesViewController.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 05/03/22.
//

import UIKit
import FirebaseDatabase
import Network

class ExamenesViewController: UIViewController {

    
    @IBOutlet weak var tvExamenes: UITableView!
    var databaseRef: DatabaseReference?
    var a_i = UIActivityIndicatorView()
   
    var keys = [String]()
    var exas = [ExamenModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fondo()
        if #available(iOS 13.0, *) {
            a_i.style = .large
        } else {
            // Fallback on earlier versions
        }
        a_i.color = .red
        a_i.hidesWhenStopped = true
        a_i.center = self.view.center
        a_i.startAnimating()
        self.view.addSubview(a_i)
        if InternetStatus.instance.internetType != .none {
            
            cargarExamenes()
        }
        if InternetStatus.instance.internetType == .none{
           
            self.a_i.stopAnimating()
            let alert = UIAlertController(title: "No hay conexión", message: "Sin internet no se pueden cargar los exámenes", preferredStyle: .alert)
            let boton = UIAlertAction(title: "Ok", style: .default) { alert in
                self.a_i.stopAnimating()
            }
            alert.addAction(boton)
            self.present(alert, animated:true)
        }
     
      
     
        
        tvExamenes.dataSource = self
        tvExamenes.delegate = self
        
        tvExamenes.register(UINib(nibName: "ExamenesTableViewCell", bundle: nil), forCellReuseIdentifier: "cellExamenes")
        
        tvExamenes.register(UINib(nibName: "ExamenesTableViewCell", bundle: nil), forCellReuseIdentifier: "cellExamenes")
        
        
        navigationItem.title = "UNAM | CCH-NAUCALPAM"
        if #available(iOS 13.0, *) {
            let infoBtn = UIBarButtonItem(image: UIImage(systemName: "info")!,style: .plain, target: self, action: #selector(irInformacion))
            navigationItem.rightBarButtonItem = infoBtn
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
      @objc func irInformacion(){
          let story = UIStoryboard(name: "Main", bundle: nil)
          let infoVC = story.instantiateViewController(withIdentifier: "info") as! Info
       
          
          self.present(infoVC, animated: true, completion: nil)
      }
    
    
    func cargarExamenes(){
        databaseRef = Database.database().reference().child("examenes")
        
        databaseRef?.observe(.childAdded){[weak self](snapshot) in
            let key = snapshot.key
       guard let value = snapshot.value as? [String : Any] else {return}
       if let area = value["area"] as? String, let mensaje = value["mensaje"] as? String, let nombre_examen = value["nombre_examen"] as? String{
             let examenes  = ExamenModel(area: area, mensaje: mensaje, nombre_examen: nombre_examen,preguntas: "",key:key)
               
               self!.exas.append(examenes)
               
                if let row = self?.exas.count{
                    let indexPath = IndexPath(row: row-1, section: 0)
                    self?.tvExamenes.insertRows(at: [indexPath], with: .automatic)
                    self?.a_i.stopAnimating()
                }
                   
             }
            
         }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let detalle = story.instantiateViewController(withIdentifier: "examen") as! PreguntaDetalle
        if let indexPath = tvExamenes.indexPathForSelectedRow{
            detalle.nombre_examen = exas[indexPath.row].nombre_examen
            detalle.key = exas[indexPath.row].key
            
          tvExamenes.deselectRow(at: indexPath, animated: true)
        }
        
       
        self.navigationController?.pushViewController(detalle, animated: true)
        
        //self.present(detalle, animated: true, completion: nil)
    }

}




// MARK: - UITableViewDataSource

extension ExamenesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return ExamenesModel.getList().count
        exas.count
    }
    
 
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExamenes", for: indexPath) as? ExamenesTableViewCell
        
     
        cell?.vAplicar.layer.cornerRadius = 10
       
        cell?.tvExamen.text = exas[indexPath.row].nombre_examen
        cell?.descripcion.text = exas[indexPath.row].mensaje
        cell?.semestre.text = exas[indexPath.row].area
    
      
      
        if(exas[indexPath.row].area.elementsEqual("Matemáticas")){
            cell?.ivExamenes.image = UIImage(named: "mates")
        }
      
        else if(exas[indexPath.row].area.elementsEqual("Experimentales")){
            cell?.ivExamenes.image = UIImage(named: "expe")
        }
        
        else if(exas[indexPath.row].area.elementsEqual("Talleres")){
            cell?.ivExamenes.image = UIImage(named: "lite")
        }
        
        else if(exas[indexPath.row].area.elementsEqual("Historia")){
            cell?.ivExamenes.image = UIImage(named: "histo")
        }
        else if(exas[indexPath.row].area.elementsEqual("Idiomas")){
            cell?.ivExamenes.image = UIImage(named: "idiomas")
        }
        
     
        cell?.ivExamenes.layer.cornerRadius = 10
       
        
        return cell!
    }
    
  
    
  
    
   

        
        
      
   
    
}



extension ExamenesViewController: UITableViewDelegate{
    
}

