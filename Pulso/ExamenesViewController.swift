//
//  ExamenesViewController.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 05/03/22.
//

import UIKit

class ExamenesViewController: UIViewController {

    @IBOutlet weak var tvExamenes: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fondo()
        
        tvExamenes.dataSource = self
        tvExamenes.delegate = self
        
        tvExamenes.register(UINib(nibName: "ExamenesTableViewCell", bundle: nil), forCellReuseIdentifier: "cellExamenes")
        
        tvExamenes.register(UINib(nibName: "ExamenesTableViewCell", bundle: nil), forCellReuseIdentifier: "cellExamenes")
        
        
        navigationItem.title = "UNAM | CCH-NAUCALPAM"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
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




// MARK: - UITableViewDataSource

extension ExamenesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExamenesModel.getList().count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellExamenes", for: indexPath) as? ExamenesTableViewCell
        
        let examenes = ExamenesModel.getList()[indexPath.row]
        
        cell?.tvExamen.text = examenes.titulo
        
        if(examenes.area.elementsEqual("matematicas")){
            cell?.ivExamenes.image = UIImage(named: "matematicas")
        }
        
        else if(examenes.area.elementsEqual("experimentales")){
            cell?.ivExamenes.image = UIImage(named: "ciencia")
        }
        
        else if(examenes.area.elementsEqual("talleres")){
            cell?.ivExamenes.image = UIImage(named: "literatura")
        }
        
        else if(examenes.area.elementsEqual("historia")){
            cell?.ivExamenes.image = UIImage(named: "historia")
        }
        
     
        
       
        
        return cell!
    }
    
    
}

extension ExamenesViewController: UITableViewDelegate{
    
}

