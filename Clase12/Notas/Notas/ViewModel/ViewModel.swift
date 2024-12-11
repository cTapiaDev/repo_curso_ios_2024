
import Foundation
import SwiftUI
import CoreData
import Combine

class ViewModel: ObservableObject {
    
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    
    @Published var updateItem: Notas!
    
    // CoreData
    
    func saveData(context: NSManagedObjectContext) {
        let newNota = Notas(context: context)
        newNota.nota = nota
        newNota.fecha = fecha
        
        do {
            try context.save()
            print("Nota guardada")
            show.toggle()
        } catch let error as NSError {
            print("No se pudo guardar:", error.localizedDescription)
        }
    }
    
    func deleteData(item: Notas, context: NSManagedObjectContext) {
        context.delete(item)
//        try! context.save()
        
        do {
            try context.save()
            print("Nota eliminada")
        } catch let error as NSError {
            print("La nota no se pudo eliminar:", error.localizedDescription)
        }
    }
    
    
    func sendData(item: Notas) {
        updateItem = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext) {
        updateItem.fecha = fecha
        updateItem.nota = nota
        
        do {
            try context.save()
            print("Nota editada")
            show.toggle()
        } catch let error as NSError {
            print("La nota no pudo ser editada:", error.localizedDescription)
        }
    }
    
    
}
