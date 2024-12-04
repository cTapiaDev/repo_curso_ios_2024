//
//  ViewController.swift
//  TableView
//
//  Created by Cony Pierola on 03-12-24.
//

import UIKit

struct Lista {
    let nombre: String
    let email: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabla: UITableView!
    
    var lista = [Lista]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.delegate = self
        tabla.dataSource = self
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .blue
        appearance.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 20.0),
            .foregroundColor: UIColor.white
        ]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let lista1 = Lista(nombre: "Cony", email: "cony@gmail.com")
        let lista2 = Lista(nombre: "Juan", email: "juan@gmail.com")
        let lista3 = Lista(nombre: "Pedro", email: "pedro@gmail.com")
        let lista4 = Lista(nombre: "Carlos", email: "carlos@gmail.com")
        let lista5 = Lista(nombre: "Joaquin", email: "joaquin@gmail.com")
        
        lista.append(lista1)
        lista.append(lista2)
        lista.append(lista3)
        lista.append(lista4)
        lista.append(lista5)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabla.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let list = lista[indexPath.row]
        cell.textLabel?.text = list.nombre
        cell.detailTextLabel?.text = list.email
        cell.imageView?.image = UIImage(systemName: "person.crop.circle.fill")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "enviar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            if let id = tabla.indexPathForSelectedRow {
                let fila = lista[id.row]
                var destino = segue.destination as? DetailViewController
                destino?.datosLista = fila
            }
        }
    }
    
    


}

