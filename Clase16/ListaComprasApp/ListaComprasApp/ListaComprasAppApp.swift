

import SwiftUI
import SwiftData

@main
struct ListaComprasAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ListModel.self)
        }
    }
}
