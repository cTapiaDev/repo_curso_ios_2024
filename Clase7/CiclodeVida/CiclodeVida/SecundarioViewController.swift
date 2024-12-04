//
//  SecundarioViewController.swift
//  CiclodeVida
//
//  Created by Cony Pierola on 03-12-24.
//

import UIKit

class SecundarioViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("loadView - el primero en ejecutar mientras carga el viewController - segunda vista.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad - se ejecuta una vez que cargó nuestra vista - segunda vista.")
    }

}
