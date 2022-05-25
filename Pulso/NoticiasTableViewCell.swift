//
//  NoticiasTableViewCell.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 09/03/22.
//

import UIKit

class NoticiasTableViewCell: UITableViewCell {

    @IBOutlet weak var tituloNoticias: UILabel!
    
    @IBOutlet weak var fechaNoticias: UILabel!
    
    @IBOutlet weak var descNoticias: UILabel!
    
    @IBOutlet weak var imagenNoticias: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        tituloNoticias.font = UIFont.boldSystemFont(ofSize: 20)
        descNoticias.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
