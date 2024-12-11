

import SwiftUI
import CoreData

struct Home: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Metas.entity(), sortDescriptors: []) var metas: FetchedResults<Metas>
    
    @ObservedObject var model = MetasViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(metas) { meta in
                        NavigationLink(destination: TareasView(meta: meta)) {
                            VStack(alignment: .leading) {
                                Text(meta.titulo ?? "")
                                    .font(.title2)
                                Text(meta.desc ?? "")
                                    .font(.headline)
                            }
                        }
                    }
                    .onDelete { (IndexSet) in
                        let borrarMeta = metas[IndexSet.first!]
                        model.deleteData(item: borrarMeta, context: context)
                    }
                }
                NavigationLink(destination: AddMetaView()) {
                    Image(systemName: "note")
                }
            }
            .navigationTitle("Metas")
        }
    }

}
