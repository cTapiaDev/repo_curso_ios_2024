
import Foundation
import CoreData

class MetasViewModel: ObservableObject {
    @Published var titulo = ""
    @Published var desc = ""
    
    func saveData(context: NSManagedObjectContext) {
        let newMeta = Metas(context: context)
        newMeta.titulo = titulo
        newMeta.desc = desc
        newMeta.id =  UUID().uuidString
        
        do {
            try context.save()
            print("Meta guardada")
        } catch let error as NSError {
            print("Meta no guardada:", error.localizedDescription)
        }
    }
    
    
    func deleteData(item: Metas, context: NSManagedObjectContext) {
        context.delete(item)
        
        do {
            try context.save()
            print("Meta eliminada")
        } catch let error as NSError {
            print("La meta no se puede eliminar:", error.localizedDescription)
        }
    }
}
