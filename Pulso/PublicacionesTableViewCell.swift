//
//  PublicacionesTableViewCell.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 13/03/22.
//

import UIKit

class PublicacionesTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
   
    
    
    static let identifier = "PublicacionesTableViewCell"
    
    static func nib() -> UINib{
        
        return UINib(nibName: "PublicacionesTableViewCell", bundle: nil)
    }
    
    func configure(with publicacionesModel: [PublicacionesModel]){
        self.publicacionesModel = publicacionesModel
        publicacionesCollectionView.reloadData()
    }
    
    @IBOutlet var publicacionesCollectionView: UICollectionView!
    
    var publicacionesModel = [PublicacionesModel]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        publicacionesCollectionView.register(myPublicacionesCollectionViewCell.nib(), forCellWithReuseIdentifier: myPublicacionesCollectionViewCell.identifier)
        
        
        publicacionesCollectionView.delegate = self
        publicacionesCollectionView.dataSource = self


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Collectionview
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return publicacionesModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCVPublicaciones = collectionView.dequeueReusableCell(withReuseIdentifier: myPublicacionesCollectionViewCell.identifier, for: indexPath) as! myPublicacionesCollectionViewCell
        
        cellCVPublicaciones.configure(with: publicacionesModel[indexPath.row])
        return cellCVPublicaciones
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
}
