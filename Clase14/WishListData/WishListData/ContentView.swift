import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing: Bool = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title2.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationTitle("WishList")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                
                if wishes.isEmpty != true {
                    ToolbarItem(placement: .bottomBar) {
                        Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                    }
                }
            }
            .alert("Create a wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                
                Button {
                    modelContext.insert(Wish(title: title))
                    title = ""
                } label: {
                    Text("Save")
                }
            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist", systemImage: "heart.circle", description: Text("No wishes yet. Add one to get started."))
                }
            }
        }
    }
}

#Preview("List with Sample Data") {
    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(Wish(title: "Aprender SwiftData"))
    container.mainContext.insert(Wish(title: "Comprar un nuevo iPhone"))
    container.mainContext.insert(Wish(title: "Aprender a bailar bachata"))
    container.mainContext.insert(Wish(title: "Viajar por Europa"))
    container.mainContext.insert(Wish(title: "Terminar la prueba intermedia"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
