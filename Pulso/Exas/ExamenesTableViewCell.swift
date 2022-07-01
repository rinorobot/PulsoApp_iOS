//
//  ExamenesTableViewCell.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 12/03/22.
//

import UIKit

class ExamenesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var base: UIView!
    
    @IBOutlet weak var ivExamenes: UIImageView!
    
    @IBOutlet weak var tvExamen: UILabel!
    
    @IBOutlet weak var semestre: UILabel!
    
    @IBOutlet weak var vAplicar: UIView!
   
    @IBOutlet weak var descripcion: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
