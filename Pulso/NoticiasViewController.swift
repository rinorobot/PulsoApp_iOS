//
//  NoticiasViewController.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 05/03/22.
//
import UIKit



class NoticiasViewController: UIViewController {
    
    
    @IBOutlet weak var tvNoticias: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UNAM | CCH-NAUCALPAN"
        fondo()
       
        
        setupNavigationBarItems()
        
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
            detalle.index = index
            
            
            
            
            tvNoticias.deselectRow(at: indexPath, animated: true)
        }
        
        self.present(detalle, animated: true, completion: nil)
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
  
    
   private func setupNavigationBarItems(){
     
       
        
       
       navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
      
       
    }
    
 
}



// MARK: - UITableViewDataSource

extension NoticiasViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoticiasModel.getList().count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellNoticias", for: indexPath) as? NoticiasTableViewCell
        
        let noticias = NoticiasModel.getList()[indexPath.row]
        
        cell?.tituloNoticias.text = noticias.titulo
        cell?.fechaNoticias.text = noticias.fecha
        cell?.descNoticias.text = noticias.descripcion
        cell?.imagenNoticias.image = UIImage(named: noticias.imagen)
        
        return cell!
        
    }
    
    
}

extension NoticiasViewController: UITableViewDelegate{
    
}
