
import SwiftUI

struct ContentView: View {
    
//    @State private var x = ""
//    var x1 = 2
//    
//    func suma() -> Int {
//        var x2 = 2
//        x2 = 4
//        return x2
//    }
    
    @State private var x = ""
    @State private var show = true
    @State private var numero = 0
    
    @State private var numeroMoneda = 123
    @State private var numeroMoneda2 = "0"
    
    
    
    var body: some View {
        VStack {
            Text(x)
                .font(.largeTitle)
            
            HStack {
                Button(action: {
                    show.toggle()
                    if show {
                        numero -= 1
                    } else {
                        numero += 1
                    }
                }) {
                    if show {
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                    } else {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                    }
                    Text(String(numero))
                        .bold()
                }
                Button(action: {
                    numeroMoneda = numeroMoneda + Int(numeroMoneda2)!
                }) {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.yellow)
                        .font(.largeTitle)
                }
                Text(String(numeroMoneda))
                    .bold()
            }
            
            TextField("Titulo", text: $x)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Divisa", text: $numeroMoneda2)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            vista2(x: $x)
            vista3(x: $x)
            
        }
        .padding()
    }
}




struct vista2: View {
    
    @Binding var x: String
    
    var body: some View {
        Text(x)
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}


struct vista3: View {
    
    @Binding var x: String
    
    var body: some View {
        Button(action: {
            x = "Nuevo titulo desde vista 3"
        }) {
            Text("Cambiar titulo")
        }
    }
    
}
