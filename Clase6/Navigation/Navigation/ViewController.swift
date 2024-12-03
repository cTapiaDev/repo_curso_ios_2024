//
//  ViewController.swift
//  Navigation
//
//  Created by Cony Pierola on 02-12-24.
//

import UIKit

class ViewController: UIViewController {
    
    let holaMundo = "Hola Mundo!"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            let destino = segue.destination as? SecondViewController
            destino?.saludo = holaMundo
        }
    }
    

}

