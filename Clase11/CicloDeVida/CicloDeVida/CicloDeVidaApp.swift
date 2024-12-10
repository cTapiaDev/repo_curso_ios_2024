
import SwiftUI

@main
struct CicloDeVidaApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        inicio()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { (phase) in
            switch phase {
            case .active:
                print("Está activo")
            case .inactive:
                print("Está inactivo")
            case .background:
                print("Está en el background")
            @unknown default:
                fatalError("algo salió mal")
            }
        }
    }
    
    func inicio() {
        print("Es el primero en ejecutarse")
    }
}
