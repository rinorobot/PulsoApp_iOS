//
//  PublicacionTableViewCell.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 22/05/22.
//

import UIKit

class PublicacionTableViewCell: UITableViewCell {

    @IBOutlet weak var cvPublicaciones: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cvPublicaciones.delegate = self
        cvPublicaciones.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
       
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tag: \(cvPublicaciones.tag)")
        print("Row: \(indexPath.row)")
        print("Has seleccionado \(lista_revistas[cvPublicaciones.tag].titulo[indexPath.row])")
        let story = UIStoryboard(name: "Main", bundle: nil)
        let detalle = story.instantiateViewController(withIdentifier: "detalle") as! DetalleRevista
        
        if let index = cvPublicaciones.indexPathsForSelectedItems{
            detalle.portada = lista_revistas[cvPublicaciones.tag].portada[indexPath.row]
            detalle.titulo = lista_revistas[cvPublicaciones.tag].titulo[indexPath.row]
        }
        
        self.window?.rootViewController?.present(detalle, animated: true, completion: nil)
  
       
        
    }
    
    
    
    
    

}

extension PublicacionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lista_revistas[cvPublicaciones.tag].portada.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvPublicaciones.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! PublicacionesCollectionViewCell
        cell.portada.image = UIImage(named: lista_revistas[cvPublicaciones.tag].portada[indexPath.row])
        cell.titulo.text = lista_revistas[cvPublicaciones.tag].titulo[indexPath.row]
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    
   
    
   
    
    
}


