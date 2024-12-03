//
//  ViewController.swift
//  HolaUIKit
//
//  Created by Cony Pierola on 02-12-24.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hola UIKit")
    }
    
    
    @IBAction func alerta(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alerta", message: "Mensaje de la alerta", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Aceptar", style: .default) {_ in
            print("Botón ejecutado")
        }
        
        alert.addAction(ok)
        present(alert, animated: true, completion: {
            print("Alerta presentada")
        })
    }
    

}

