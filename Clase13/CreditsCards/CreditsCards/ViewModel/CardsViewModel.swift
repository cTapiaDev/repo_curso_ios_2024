

import Foundation
import CoreData

class CardsViewModel: ObservableObject {
    
    var limit: Int = 16
    
    @Published var addCardView = false
    @Published var updateItem = Cards()
    
    @Published var name = ""
    @Published var credit = ""
    @Published var type = ""
    @Published var number: String = "" {
        didSet {
            if number.count > limit {
                number = String(number.prefix(limit))
            }
         }
    }
    
    
    
    func saveCard(context: NSManagedObjectContext, completion: @escaping(_ done: Bool) -> Void) {
        
        if name.isEmpty || number.isEmpty || credit.isEmpty {
            completion(false)
        } else {
            let newCard = Cards(context: context)
            newCard.number = number
            newCard.name = name
            newCard.type = type
            newCard.id = UUID()
            newCard.credit = Int16(credit) ?? 0
            
            do {
                try context.save()
                print("Elemento guardado")
                completion(true)
            } catch let error as NSError {
                print("No se guardó el elemento:", error.localizedDescription)
                completion(false)
            }
        }
        
    }
    
    
    func senditem(item: Cards) {
        updateItem = item
        name = item.name ?? ""
        number = item.number ?? ""
        credit = "\(item.credit)"
        type = item.type ?? ""
        addCardView.toggle()
    }
}
