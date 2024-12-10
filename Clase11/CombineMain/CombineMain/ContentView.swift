
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contador = Modelo()
    
    @State private var titulo = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(titulo)
                .font(.title)
            Text("Contador (ObservedObject) = \(contador.contador)")
            Button("Sumar contador") {
                contador.contador += 1
            }
            
            Button("titulo") {
                titulo = "Nuevo titulo"
            }
            
            Spacer()
            vista2()
            Spacer()
            vista3()
            Spacer()
            vista4()
            Spacer()
            vista5()
            Spacer()
        }
        .padding()
    }
}



struct vista2: View {
    
    @ObservedObject var contador = Modelo()
    
    var body: some View {
        VStack {
            Text("Contador vista 2 (ObservedObject) = \(contador.contador)")
            Button("Sumar contador") {
                contador.contador += 1
            }
        }
    }
}


struct vista3: View {
    
    @StateObject var contador = Modelo()
    
    var body: some View {
        VStack {
            Text("Contador vista 3 (StateObject) = \(contador.contador)")
            Button("Sumar contador") {
                contador.contador += 1
            }
        }
    }
}


struct vista4: View {
    
    @EnvironmentObject var contador: Modelo
    
    var body: some View {
        VStack {
            Text("Contador vista 4 (EnvironmentObject) = \(contador.contador)")
            Button("Sumar contador") {
                contador.contador += 1
            }
        }
    }
}


struct vista5: View {
    
    @EnvironmentObject var contador: Modelo
        
    var body: some View {
        VStack {
            Text("Contador vista 5 (EnvironmentObject) = \(contador.contador)")
            Button("Sumar contador") {
                contador.contador += 1
            }
        }
    }
}
