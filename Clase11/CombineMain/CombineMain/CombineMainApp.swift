

import SwiftUI

@main
struct CombineMainApp: App {
    
    var modelo = Modelo()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelo)
        }
    }
}
