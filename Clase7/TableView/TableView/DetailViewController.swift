//
//  DetailViewController.swift
//  TableView
//
//  Created by Cony Pierola on 03-12-24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var email: UILabel!
    
    var datosLista: Lista?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nombre.text = datosLista?.nombre
        email.text = datosLista?.email
    }
    

}
