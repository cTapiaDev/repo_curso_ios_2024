
import SwiftUI
import SwiftData

@main
struct WishListDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Wish.self)
    }
}
