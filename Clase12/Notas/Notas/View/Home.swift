

import SwiftUI

struct Home: View {
    
    @Environment(\.managedObjectContext) var context
    
    @StateObject var model = ViewModel()
    @FetchRequest(entity: Notas.entity(), sortDescriptors: [NSSortDescriptor(key: "fecha", ascending: true)], animation: .spring()) var results: FetchedResults<Notas>
    
//    @FetchRequest(entity: Notas.entity(), sortDescriptors: [], predicate: NSPredicate(format: "nota CONTAINS 'IMPORTANTE'", Date() as CVarArg), animation: .spring()) var results: FetchedResults<Notas>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(results) { item in
                    VStack(alignment: .leading) {
                        Text(item.nota ?? "Sin Nota")
                            .font(.title3)
                            .bold()
                        Text(item.fecha ?? Date(), style: .date)
                    }
                    .contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            model.sendData(item: item)
                        }) {
                            Label(
                                title: { Text("Editar") },
                                icon: { Image(systemName: "pencil") }
                            )
                        }
                        
                        Button(action: {
                            model.deleteData(item: item, context: context)
                        }) {
                            Label(
                                title: { Text("Eliminar") },
                                icon: { Image(systemName: "trash") }
                            )
                        }
                    }))
                }
            }
            .navigationTitle("Notas")
            .toolbar {
                Button(action: {
                    model.show.toggle()
                }) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
            .sheet(isPresented: $model.show, content: {
                AddView(model: model)
            })
        }
    }
}
