

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    @State private var texto = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Texto", text: $texto)
                
                Button("Abrir Modal") {
                    show.toggle()
                }
                .sheet(isPresented: $show) {
                    VentanaModal(texto: texto)
                }
                
                
                NavigationLink(destination: SegundaVista()) {
                    Text("Segunda Vista")
                }
                
                .navigationTitle("Navegación")
                    .toolbar {
                        HStack {
                            NavigationLink(destination: SegundaVista()) {
                                Image(systemName: "plus")
                            }
                            NavigationLink(destination: TerceraVista()) {
                                Image(systemName: "camera")
                            }
                        }
                    }
            }.padding(.all)
        }
    }
}
