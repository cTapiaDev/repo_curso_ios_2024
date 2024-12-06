
import SwiftUI

enum Rutas: Hashable {
    case Ruta2
    case Ruta3
}


struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            Text("Primera Vista")
                .navigationTitle("Primera")
            
            NavigationLink("Segunda Vista", value: Rutas.Ruta2)
            NavigationLink("Tercera Vista", value: Rutas.Ruta3)
            
                .navigationDestination(for: Rutas.self) { ruta in
                    switch ruta {
                    case .Ruta2:
                        SegundaVista(texto: "Hola Segunda Vista")
                    case .Ruta3:
                        TerceraVista(texto: "Hola Tercera Vista")
                    }
                    
                }
            
            
            
//            NavigationLink("Segunda Vista", value: Rutas.Ruta2)
//                .navigationDestination(for: String.self) { value in
//                    SegundaVista(texto: value)
//                }
//            NavigationLink("Tercera Vista", value: Rutas.Ruta3)
//                .navigationDestination(for: Int.self) { item in
//                    TerceraVista(texto: "Mensaje: \(item)")
//                }
        }
    }
}
