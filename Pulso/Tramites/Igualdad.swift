//
//  Igualdad.swift
//  Pulso
//
//  Created by Salvador Gómez Moya on 29/06/22.
//

import UIKit
import WebKit
class Igualdad: UIViewController, WKUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myWebView:WKWebView = WKWebView(frame: CGRect(x:0, y:0, width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
              myWebView.uiDelegate = self
              self.view.addSubview(myWebView)
              
              
              //1. Load web site into my web view
              let myURL = URL(string: "https://coordinaciongenero.unam.mx/")
              let myURLRequest:URLRequest = URLRequest(url: myURL!)
              myWebView.load(myURLRequest)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
