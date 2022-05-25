//
//  myPublicacionesCollectionViewCell.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 13/03/22.
//

import UIKit




class myPublicacionesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var lbPublicacion: UILabel!
    @IBOutlet var lbTitulo: UILabel!
    @IBOutlet var ivPublicacion: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    static func nib() -> UINib{
        return UINib(nibName: "myPublicacionesCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with modelPublicaciones: PublicacionesModel){
        self.lbTitulo.text = modelPublicaciones.tvPublicaciones
        self.ivPublicacion.image = UIImage(named: modelPublicaciones.ivPublicaciones)
    }

}
