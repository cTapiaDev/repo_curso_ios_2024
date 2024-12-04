//
//  ViewController.swift
//  CiclodeVida
//
//  Created by Cony Pierola on 03-12-24.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("loadView - el primero en ejecutar mientras carga el viewController.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad - se ejecuta una vez que cargó nuestra vista.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewWillAppear - cuando la vista aparecerá")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear - cuando la vista ya apareció")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("viewWillDisappear - cuando la vista a desaparecer")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewDidDisappear - cuando la vista ya desapareció")
    }


}

