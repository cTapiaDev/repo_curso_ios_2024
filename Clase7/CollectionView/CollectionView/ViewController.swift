//
//  ViewController.swift
//  CollectionView
//
//  Created by Cony Pierola on 03-12-24.
//

import UIKit

struct Lista {
    let nombre: String
    let email: String
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var coleccion: UICollectionView!
    
    var lista = [Lista]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coleccion.delegate = self
        coleccion.dataSource = self
        
        let lista1 = Lista(nombre: "Cony", email: "cony@gmail.com")
        let lista2 = Lista(nombre: "Carlos", email: "carlos@gmail.com")
        let lista3 = Lista(nombre: "Joaquin", email: "joaquin@gmail.com")
        let lista4 = Lista(nombre: "Melody", email: "melody@gmail.com")
        let lista5 = Lista(nombre: "Theo", email: "theo@gmail.com")
        let lista6 = Lista(nombre: "Cony", email: "cony@gmail.com")
        let lista7 = Lista(nombre: "Carlos", email: "carlos@gmail.com")
        let lista8 = Lista(nombre: "Joaquin", email: "joaquin@gmail.com")
        let lista9 = Lista(nombre: "Melody", email: "melody@gmail.com")
        let lista10 = Lista(nombre: "Theo", email: "theo@gmail.com")
        
        lista.append(lista1)
        lista.append(lista2)
        lista.append(lista3)
        lista.append(lista4)
        lista.append(lista5)
        lista.append(lista6)
        lista.append(lista7)
        lista.append(lista8)
        lista.append(lista9)
        lista.append(lista10)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lista.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = coleccion.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! CeldaCollectionViewCell
        let list = lista[indexPath.row]
        cell.nombre.text = list.nombre
        cell.imagen.image = UIImage(systemName: "person.crop.circle.fill")
        return cell
    }


}

