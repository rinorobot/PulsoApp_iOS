//
//  NoticiasViewController.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 05/03/22.
//
import UIKit
import FirebaseDatabase
import Network



class NoticiasViewController: UIViewController {
    
    @IBOutlet weak var mensaje_internet: UITextView!
    
    @IBOutlet weak var tvNoticias: UITableView!
    var databaseRef: DatabaseReference?
    var notis = [NewsModel]()
    var a_i = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        var _ = InternetStatus.instance
        navigationItem.title = "UNAM | CCH-NAUCALPAN"
        
        
        if #available(iOS 13.0, *) {
            let infoBtn = UIBarButtonItem(image: UIImage(systemName: "info")!,style: .plain, target: self, action: #selector(irInformacion))
            navigationItem.rightBarButtonItem = infoBtn
        } else {
            // Fallback on earlier versions
        }
        
       
      

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
            cargarDatos()
       
      
  
  
   }
    
    @objc func irInformacion(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let infoVC = story.instantiateViewController(withIdentifier: "info") as! Info
     
        
        self.present(infoVC, animated: true, completion: nil)
    }
    
    
    
   
    
  
    
  
    
    
    func cargarDatos(){
        
   if InternetStatus.instance.internetType != .none {
         mensaje_internet.visiblity(gone: true)
         databaseRef = Database.database().reference().child("noticias")
         databaseRef?.observe(.childAdded){[weak self](snapshot) in
            
                guard let value = snapshot.value as? [String : Any] else {return}
            
                if let titulo = value["titulo"] as? String, let fecha = value["fecha"] as? String, let descripcion = value["descripcion"] as? String, let imagen = value["imagen"] as? String, let url = value["url"] as? String{
                    let noticias  = NewsModel(titulo: titulo, fecha: fecha, descripcion: descripcion, imagen: imagen,url:url)
                    
                    
                    self!.notis.append(noticias)
                    
                    if let row = self?.notis.count{
                        let indexPath = IndexPath(row: row-1, section: 0)
                        self?.tvNoticias.insertRows(at: [indexPath], with: .automatic)
                        self?.a_i.stopAnimating()
                    }
                  }
        }
        
   }
        
        if InternetStatus.instance.internetType == .none{
            self.a_i.stopAnimating()
        }
     
   
        
            
          tvNoticias.dataSource = self
           tvNoticias.delegate = self
           tvNoticias.register(UINib(nibName: "NoticiasTableViewCell", bundle: nil), forCellReuseIdentifier: "cellNoticias")
           
           tvNoticias.register(UINib(nibName: "NoticiasTableViewCell", bundle: nil), forCellReuseIdentifier: "cellNoticias")
    }
    
    
    
 
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let detalle = story.instantiateViewController(withIdentifier: "story") as! DetalleNoticias
        if let indexPath = tvNoticias.indexPathForSelectedRow{
            let index = indexPath.row
          
            
            detalle.titulo_detalle = notis[index].titulo
            detalle.imagen_detalle = notis[index].imagen
            detalle.descripcion_detalle = notis[index].descripcion
            detalle.fecha_detalle = notis[index].fecha
            detalle.url_detalle = notis[index].url
          
            
            
            
            
            tvNoticias.deselectRow(at: indexPath, animated: true)
        }
        
        self.present(detalle, animated: true, completion: nil)
    }
    
   
  
    

    
   
    
 
}



// MARK: - UITableViewDataSource

extension NoticiasViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
       
        return notis.count
    }
    
  
  
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNoticias", for: indexPath) as? NoticiasTableViewCell
      //  cell?.cv.layer.cornerRadius = 10
       // cell?.marco.layer.cornerRadius = 10
        let noticias = notis[indexPath.row]
        cell?.tituloNoticias.text = noticias.titulo
        cell?.fechaNoticias.text = noticias.fecha
        cell?.descNoticias.text = noticias.descripcion
        let url = URL(string: noticias.imagen)
        if let data = try? Data(contentsOf: url!){
      //  cell?.imagenNoticias.layer.cornerRadius = 10
          
        cell?.imagenNoticias.image = UIImage(data: data)
        
        }else{
          
            cell?.imagenNoticias.image = UIImage(named: "logo_color_nau")
        }
        return cell!
    }
    
    
    
    
}



extension NoticiasViewController: UITableViewDelegate{
    
}




