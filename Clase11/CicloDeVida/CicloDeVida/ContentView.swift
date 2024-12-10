
import SwiftUI

struct ContentView: View {
    
    @State private var contenido = ""
    @State private var show = true
    
    var body: some View {
        VStack {
            if show {
                Text("Hola Mundo")
                    .padding()
                    .onAppear {
                        print("Apareció texto de bienvenida!")
                    }
                    .onDisappear {
                        print("Desapareció texto de bienvenida")
                    }
            }
            Button(action: {
                self.show.toggle()
            }) {
                Text("Desaparecer texto")
            }
            .onAppear {
                print("Apareció el botón")
            }
            TextField("Titulo del texto", text: $contenido)
                .onAppear {
                    self.contenido = "Contenido que viene desde otra vista"
                }
        }
        .onAppear {
            print("Apareció el VStack")
        }
    }
}
