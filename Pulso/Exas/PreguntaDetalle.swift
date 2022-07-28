//
//  PreguntaDetalle.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 15/03/22.
//

import UIKit
import FirebaseDatabase





class PreguntaDetalle: UIViewController{
    
   
  
    @IBOutlet weak var fondo_pregunta: UIView!
    var key: String = ""
    var nombre_examen: String = ""
    var databaseRef: DatabaseReference?
    var lista_preguntas = [PreguntaModel]()
    var index: Int = 0
    var correctas: Int = 0
    var incorrectas: Int = 0
    var lista_correstas = [Int]()
    var lista_incorrestas = [Int]()
    var a_i = UIActivityIndicatorView()
    
    @IBOutlet weak var asignatura: UILabel!
    
    @IBOutlet weak var num_pregunta: UILabel!
    
    @IBOutlet weak var progreso: UIProgressView!
    
    @IBOutlet weak var pregunta: UITextView!
    
    @IBOutlet weak var img_pregunta: UIImageView!
    
    @IBOutlet weak var preguntaA: UIButton!
    
    @IBOutlet weak var img_preguntaA: UIImageView!
    
    @IBOutlet weak var preguntaB: UIButton!
    
    @IBOutlet weak var img_preguntaB: UIImageView!
    
    @IBOutlet weak var preguntaC: UIButton!
    
    @IBOutlet weak var img_preguntaC: UIImageView!
    
    
    @IBOutlet weak var img_preguntaD: UIImageView!
    @IBOutlet weak var preguntaD: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if #available(iOS 13.0, *) {
            a_i.style = .large
        } else {
            // Fallback on earlier versions
        }
        a_i.color = .red
        a_i.hidesWhenStopped = true
        a_i.center = self.view.center
        
     
       
        fondo_pregunta.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 50)
        
        
        
        databaseRef = Database.database().reference().child("examenes").child(key).child("preguntas")
        
        
        
        databaseRef?.observe(.childAdded){[weak self](snapshot) in
          // let key = snapshot.key
            
       guard let value = snapshot.value as? [String : Any] else {return}
           
            if let correcta = value["correcta"] as? String, let linkA = value["linkA"] as? String,let linkB = value["linkB"] as? String,let linkC = value["linkC"] as? String,let linkD = value["linkD"] as? String,let linkPregunta = value["linkPregunta"] as? String,let pregunta = value["pregunta"] as? String,let respuestaA = value["respuestaA"] as? String,let respuestaB = value["respuestaB"] as? String,let respuestaC = value["respuestaC"] as? String,let respuestaD = value["respuestaD"] as? String{
             
                let preguntas  = PreguntaModel(correcta: correcta, linkA: linkA, linkB: linkB, linkC: linkC, linkD: linkD, linkPregunta: linkPregunta, pregunta: pregunta, respuestaA: respuestaA, respuestaB: respuestaB, respuestaC: respuestaC, respuestaD: respuestaD)
                  
                  self!.lista_preguntas.append(preguntas)
                
                  }
            
            self?.asignatura.text = self?.nombre_examen
            
            self?.progreso.progress = 0.1
           
          
            self?.pregunta.text = self?.lista_preguntas[0].pregunta
            self?.num_pregunta.text = "Pregunta 1"
            self?.preguntaA.setTitle("A) "+(self?.lista_preguntas[0].respuestaA ?? "Sin respuesta") , for: .normal)
            self?.preguntaB.setTitle("B) "+(self?.lista_preguntas[0].respuestaB ?? "Sin respuesta") , for: .normal)
            self?.preguntaC.setTitle("C) "+(self?.lista_preguntas[0].respuestaC ?? "Sin respuesta") , for: .normal)
            self?.preguntaD.setTitle("D) "+(self?.lista_preguntas[0].respuestaD ?? "Sin respuesta") , for: .normal)
            
          
            
            
          
            
            if(self?.lista_preguntas[0].linkPregunta == ""){
                self?.img_pregunta.visiblity(gone: true)
            }else{
                self?.img_pregunta.visiblity(gone: false)
                let url = URL(string: self!.lista_preguntas[0].linkPregunta)
                if let data = try? Data(contentsOf: url!){
                    self?.img_pregunta.image  = UIImage(data: data)
                
                }else{
                  
                    self?.img_pregunta.image = UIImage(named: "logo_color_nau")
                }
            }
            if(self?.lista_preguntas[0].linkA == ""){
                self?.img_preguntaA.visiblity(gone: true)
            }
            if(self?.lista_preguntas[0].linkB == ""){
                self?.img_preguntaB.visiblity(gone: true)
            }
            if(self?.lista_preguntas[0].linkC == ""){
                self?.img_preguntaC.visiblity(gone: true)
            }
            if(self?.lista_preguntas[0].linkD == ""){
                self?.img_preguntaD.visiblity(gone: true)
            }
           
            
         }

      
      
        
    }
    
    
    @IBAction func touchA(_ sender: Any) {
        
    
        
        
        if(index<lista_preguntas.count-1){
            if(lista_preguntas[index].correcta == "1"){
                correctas = correctas + 1
                lista_correstas.append(index)
            }else{
                incorrectas = incorrectas + 1
               lista_incorrestas.append(index)
            }
            mostrarDatos()
        }else{
            if(lista_preguntas[index].correcta == "1"){
                correctas = correctas + 1
                lista_correstas.append(index)
            }else{
                incorrectas = incorrectas + 1
               lista_incorrestas.append(index)
            }
            let story = UIStoryboard(name: "Main", bundle: nil)
            let resultados = story.instantiateViewController(withIdentifier: "resultados") as! ResultadosViewController
            
            let buenas = Float(correctas)
            let total = Float(lista_preguntas.count)
            
            let calif: Float = buenas/total
            resultados.asignatura = nombre_examen
            resultados.calificacion = calif*10
           // self.present(resultados, animated: true, completion: nil)
            self.navigationController?.pushViewController(resultados, animated: true)

        }
        
   
    }
    
    
    
    @IBAction func touchB(_ sender: Any) {
        if(index<lista_preguntas.count-1){
            if(lista_preguntas[index].correcta == "2"){
                correctas = correctas + 1
                lista_correstas.append(index)
            }else{
                incorrectas = incorrectas + 1
                lista_incorrestas.append(index)
            }
            mostrarDatos()
        }else{
            if(lista_preguntas[index].correcta == "2"){
                correctas = correctas + 1
                lista_correstas.append(index)
            }else{
                incorrectas = incorrectas + 1
               lista_incorrestas.append(index)
            }
            let story = UIStoryboard(name: "Main", bundle: nil)
            let resultados = story.instantiateViewController(withIdentifier: "resultados") as! ResultadosViewController
            let buenas = Float(correctas)
            let total = Float(lista_preguntas.count)
            
            let calif: Float = buenas/total
            
            resultados.calificacion = calif*10
            resultados.asignatura = nombre_examen
           // self.present(resultados, animated: true, completion: nil)
            self.navigationController?.pushViewController(resultados, animated: true)

        }
    }
    
    
    @IBAction func touchC(_ sender: Any) {
        if(index<lista_preguntas.count-1){
            if(lista_preguntas[index].correcta == "3"){
                correctas = correctas + 1
                lista_correstas.append(index)
            }else{
                incorrectas = incorrectas + 1
               lista_incorrestas.append(index)
            }
            mostrarDatos()
        }else{
            if(lista_preguntas[index].correcta == "3"){
                correctas = correctas + 1
                lista_correstas.append(index)
            }else{
                incorrectas = incorrectas + 1
               lista_incorrestas.append(index)
            }
            let story = UIStoryboard(name: "Main", bundle: nil)
            let resultados = story.instantiateViewController(withIdentifier: "resultados") as! ResultadosViewController
            let buenas = Float(correctas)
            let total = Float(lista_preguntas.count)
            
            let calif: Float = buenas/total
            
            resultados.calificacion = calif*10
            resultados.asignatura = nombre_examen
           // self.present(resultados, animated: true, completion: nil)
            self.navigationController?.pushViewController(resultados, animated: true)

        }
    }
    
  
    @IBAction func touchD(_ sender: Any) {
        if(index<lista_preguntas.count-1){
            if(lista_preguntas[index].correcta == "4"){
                correctas = correctas + 1
                lista_correstas.append(index)
            }else{
                incorrectas = incorrectas + 1
               lista_incorrestas.append(index)
            }
            mostrarDatos()
        }else{
            if(lista_preguntas[index].correcta == "4"){
                correctas = correctas + 1
                lista_correstas.append(index)
            }else{
                incorrectas = incorrectas + 1
               lista_incorrestas.append(index)
            }
            let story = UIStoryboard(name: "Main", bundle: nil)
            let resultados = story.instantiateViewController(withIdentifier: "resultados") as! ResultadosViewController
            resultados.calificacion = Float(index/lista_preguntas.count)*10
            let buenas = Float(correctas)
            let total = Float(lista_preguntas.count)
            
            let calif: Float = buenas/total
            
            resultados.calificacion = calif*10
            resultados.asignatura = nombre_examen
           // self.present(resultados, animated: true, completion: nil)
            self.navigationController?.pushViewController(resultados, animated: true)

        }
    }
    
    
    func mostrarDatos(){
        
        index = index + 1
       
       
        
        
        let indexF = Float(index)
        let total = Float(lista_preguntas.count)
        
        let porcentaje: Float = indexF/total
        progreso.progress = porcentaje+0.1
        pregunta.text = lista_preguntas[index].pregunta
        num_pregunta.text = "Pregunta \(index+1)"
        preguntaA.setTitle("A) "+(lista_preguntas[index].respuestaA) , for: .normal)
        preguntaB.setTitle("B) "+(lista_preguntas[index].respuestaB) , for: .normal)
        preguntaC.setTitle("C) "+(lista_preguntas[index].respuestaC) , for: .normal)
        preguntaD.setTitle("D) "+(lista_preguntas[index].respuestaD) , for: .normal)
        
       
        
        if(lista_preguntas[index].linkPregunta == ""){
            
            img_pregunta.visiblity(gone: true)
        }else{
            img_pregunta.visiblity(gone: false)
           
            let url = URL(string: lista_preguntas[index].linkPregunta)
            if let data = try? Data(contentsOf: url!){
               img_pregunta.image  = UIImage(data: data)
            
            }else{
              
               img_pregunta.image = UIImage(named: "logo_color_nau")
            }
           
              
             
           
        }
        if(lista_preguntas[index].linkA == ""){
            img_preguntaA.visiblity(gone: true)
        }else{
            img_preguntaA.visiblity(gone: false)
            let url = URL(string: lista_preguntas[index].linkA)
            if let data = try? Data(contentsOf: url!){
               img_preguntaA.image  = UIImage(data: data)
            
            }else{
              
               img_preguntaA.image = UIImage(named: "logo_color_nau")
            }
           
        }
        if(lista_preguntas[index].linkB == ""){
            img_preguntaB.visiblity(gone: true)
            
        }else{
            img_preguntaB.visiblity(gone: false)
            let url = URL(string: lista_preguntas[index].linkB)
            if let data = try? Data(contentsOf: url!){
               img_preguntaB.image  = UIImage(data: data)
            
            }else{
              
               img_preguntaB.image = UIImage(named: "logo_color_nau")
            }
        }
        if(lista_preguntas[index].linkC == ""){
            img_preguntaC.visiblity(gone: true)
        }else{
            img_preguntaC.visiblity(gone: false)
            let url = URL(string: lista_preguntas[index].linkC)
            if let data = try? Data(contentsOf: url!){
               img_preguntaC.image  = UIImage(data: data)
            
            }else{
              
               img_preguntaC.image = UIImage(named: "logo_color_nau")
            }
        }
        if(lista_preguntas[index].linkD == ""){
           img_preguntaD.visiblity(gone: true)
        }else{
            img_preguntaD.visiblity(gone: false)
            let url = URL(string: lista_preguntas[index].linkD)
            if let data = try? Data(contentsOf: url!){
               img_preguntaD.image  = UIImage(data: data)
            
            }else{
              
               img_preguntaD.image = UIImage(named: "logo_color_nau")
            }
        }
       
        
        
    }
    
    

    
    

}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func visiblity(gone: Bool, dimension: CGFloat = 0.0, attribute: NSLayoutConstraint.Attribute = .height) -> Void {
        
        if gone == true{
            if let constraint = (self.constraints.filter{$0.firstAttribute == attribute}.first) {
                constraint.constant = gone ? 0.0 : dimension
                self.layoutIfNeeded()
                self.isHidden = gone
            }
        }
        
        if gone == false{
            if let constraint = (self.constraints.filter{$0.firstAttribute == attribute}.first) {
                constraint.constant = true ? 200.0 : dimension
                self.layoutIfNeeded()
                self.isHidden = gone
            }
        }
    }
}



