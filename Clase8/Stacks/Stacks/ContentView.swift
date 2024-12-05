

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
//            Text("Hello World").font(.caption2)
//            Text("Hola Mundo").font(.headline)
//            Text("Hola Mundo").font(.largeTitle)
            Color.blue.edgesIgnoringSafeArea(.all)
            HStack() {
                Image("deadpool")
                    .resizable()
                    .frame(width: 130, height: 180, alignment: .center)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Señor Pool")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("Calle #21 sur")
                        .foregroundColor(.white)
                        .font(.title)
                        .italic()
                }
            }
        }
    }
}


