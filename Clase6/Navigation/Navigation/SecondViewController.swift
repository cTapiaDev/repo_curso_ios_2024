//
//  SecondViewController.swift
//  Navigation
//
//  Created by Cony Pierola on 02-12-24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var res: UILabel!
    var saludo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        res.text = saludo
        // Do any additional setup after loading the view.
    }
    

    @IBAction func regresar(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
}
