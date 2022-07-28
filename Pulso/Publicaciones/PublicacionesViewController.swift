//
//  PublicacionesViewController.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 05/03/22.
//


import UIKit
import FirebaseDatabase
import PDFKit
import Network







class PublicacionesViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var collectionViewCell: UICollectionView!
    

    var databaseRef: DatabaseReference?
    
   
   var publicaciones = [ReviewModel]()
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
      
        if InternetStatus.instance.internetType == .none {
            let alert = UIAlertController(title: "No hay conexión", message: "Sin internet no se pueden cargar las publicaciones", preferredStyle: .alert)
            let boton = UIAlertAction(title: "Ok", style: .default) { alert in
                self.a_i.stopAnimating()
            }
            alert.addAction(boton)
            self.present(alert, animated:true)
        }  else if InternetStatus.instance.internetType == .cellular {
            let alert = UIAlertController(title: "Confirme por favor", message: "Solo hay conexión a internet por datos celulares para descargar las publicaciones", preferredStyle: .alert)
            let boton1 = UIAlertAction(title: "Continuar", style: .default) { alert in
                self.descargar()
            }
            let boton2 = UIAlertAction(title: "Cancelar", style: .cancel)
            alert.addAction(boton1)
            alert.addAction(boton2)
            self.present(alert, animated:true)
        }
        else {
            self.descargar()
        }
        
        
        
        
      collectionViewCell.delegate = self
        collectionViewCell.dataSource = self
      
        
    }
    
  
    @objc func irInformacion(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let infoVC = story.instantiateViewController(withIdentifier: "info") as! Info
     
        
        self.present(infoVC, animated: true, completion: nil)
    }
    
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return publicaciones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
       
        return publicaciones[section].portada.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "revistaCell", for: indexPath) as! PublicacionesCollectionViewCell
        
        let url = URL(string: publicaciones[indexPath.section].portada[indexPath.row])
        let data = try? Data(contentsOf: url!)
      
        
        cell.portada.image = UIImage(data: data!)
        cell.titulo.text = publicaciones[indexPath.section].titulo[indexPath.row]
        cell.titulo.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width*0.3, height: collectionView.frame.width*0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "revistaHeader", for: indexPath) as! RevistaCollectionReusableView
        header.headerTitle.text = publicaciones[indexPath.section].publicacion
       header.backgroundColor = .red
        return header
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let detalle = story.instantiateViewController(withIdentifier: "detalle") as! DetalleRevista
        
        if let index = collectionViewCell.indexPathsForSelectedItems{
            detalle.portada = publicaciones[indexPath.section].portada[indexPath.row]
            detalle.titulo = publicaciones[indexPath.section].titulo[indexPath.row]
            detalle.url = publicaciones[indexPath.section].url[indexPath.row]
            
        }
        
        self.collectionViewCell.window?.rootViewController!.present(detalle, animated: true, completion: nil)
    }
    
    
    
    
  
    
  
    
   func descargar(){
       self.view.addSubview(a_i)
      
     
     
          
        databaseRef = Database.database().reference().child("revistas")
      databaseRef?.observe(.childAdded){[weak self](snapshot) in
         //   let key = snapshot.key
            guard let value = snapshot.value as? [String : Any] else {return}
          print("value:\(value)")
      if let publicacion = value["publicacion"] as? String, let portada = value["portada"] as? [String], let titulo = value["titulo"] as? [String], let numero = value["numero"] as? [String], let url = value["url"] as? [String]{
          let todas_publicaciones  = ReviewModel(publicacion: publicacion, portada: portada, titulo: titulo, numero: numero,url:url)
          self?.publicaciones.append(todas_publicaciones)
        
           self?.collectionViewCell.reloadData()
          self?.a_i.stopAnimating()
           }
        }
       
     
    }
    
    
    
   
    
   
 
    
   
    


}


