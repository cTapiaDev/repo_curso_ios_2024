

import SwiftUI
import SwiftData

@main
struct ComprasAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ListModel.self)
        }
    }
}
