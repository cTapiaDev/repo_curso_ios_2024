
import SwiftUI
import CoreData

struct AddTareasView: View {
    
    @Environment(\.managedObjectContext) var context
    @ObservedObject var model = TareasViewModel()
    
    var meta : Metas
    
    var body: some View {
        VStack {
            TextField("tarea", text: $model.tarea)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                model.saveData(context: context, meta: meta)
            }) {
                Text("Guardar")
            }

        }
        .padding()
    }
}
