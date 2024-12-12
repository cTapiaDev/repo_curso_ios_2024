
import SwiftUI
import CoreData

struct TareasView: View {
    
    @Environment(\.managedObjectContext) var context
//    @FetchRequest(entity: Tareas.entity(), sortDescriptors: []) var tareas: FetchedResults<Tareas>

    var tareas: FetchRequest<Tareas>
    init(meta: Metas) {
        self.meta = meta
        tareas = FetchRequest<Tareas>(entity: Tareas.entity(), sortDescriptors: [], predicate: NSPredicate(format: "idMeta == %@", meta.id!))
    }
    
    var meta: Metas
    
    var body: some View {
        VStack {
            List {
                ForEach(tareas.wrappedValue) { tarea in
                    NavigationLink(destination: FotoView(tarea: tarea)) {
                        VStack (alignment: .leading) {
                            Text(tarea.tarea ?? "")
                                .font(.title2)
                        }
                    }
                }
            }
            NavigationLink(destination: AddTareasView(meta: meta)) {
                Image(systemName: "plus")
            }
        }
        .navigationTitle(meta.titulo ?? "")
    }
}
