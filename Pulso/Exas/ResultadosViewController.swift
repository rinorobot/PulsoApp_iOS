//
//  ResultadosViewController.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 24/06/22.
//

import UIKit
import Lottie

class ResultadosViewController: UIViewController{
    private var animationView: AnimationView?
    var calificacion: Float = 0.0
    var asignatura: String = ""
 

    @IBOutlet weak var finalizar: UIButton!
    @IBOutlet weak var mensaje2: UILabel!
    @IBOutlet weak var mensaje: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        fondo()
        // Do any additional setup after loading the view.
        // 2. Start AnimationView with animation name (without extension)
        mensaje.text =
        "Tu calificación es \(round(calificacion*100)/100)"
        navigationItem.hidesBackButton = true
        if(calificacion<6){
            animationView = .init(name: "sad")
            mensaje2.text = "Estudiando lo lograrás"
        }
        if(calificacion>=6&&calificacion<=8.4){
            animationView = .init(name: "try")
            mensaje2.text = "Muy bien pero puedes hacerlo mejor"
        }
        if(calificacion>8.4){
            mensaje2.text = "Excelente resultado"
            animationView = .init(name: "congrats")
        }
        
        
      
        
        animationView!.frame.size = CGSize(width: 200, height: 200)
        animationView?.center = self.view.center
        
        // 3. Set animation content mode
        
        animationView!.contentMode = .scaleAspectFill
        
        // 4. Set animation loop mode
        
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        
        animationView!.animationSpeed = 0.5
        
        view.addSubview(animationView!)
        
        // 6. Play animation
        
      
        
   animationView!.play()
        
       
    }
    
    @objc func salir(){
        
        self.navigationController?.viewControllers.removeLast(2)
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
    

    @IBAction func compartir(_ sender: Any) {
        var imagen_compartir = UIImage()
        if(calificacion<6){
            imagen_compartir = UIImage(named: "triste")!
        }
        if(calificacion>=6&&calificacion<=8.4){
            imagen_compartir = UIImage(named: "esfuerzo")!
        }
        if(calificacion>8.4){
            imagen_compartir = UIImage(named: "success")!
        }
        
 
        let mensaje = "Obtuve \(calificacion) en el examen de \(asignatura)"
        let compartir_elementos = UIActivityViewController(activityItems: [imagen_compartir,mensaje], applicationActivities: nil)
        
        self.present(compartir_elementos, animated: true)
      
        
    }
 
   
    @IBAction func finalizar(_ sender: Any) {
        
        self.navigationController?.viewControllers.removeLast(2)



        
    }
    

}
