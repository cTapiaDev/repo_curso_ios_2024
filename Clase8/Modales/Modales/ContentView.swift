

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color.orange.edgesIgnoringSafeArea(.all)
            VStack {
                Button("Abrir Modal") {
                    show.toggle()
                }.sheet(isPresented: $show) {
                    Text("Ventana Modal")
                        .presentationDetents([.medium, .large, .small])
                }
            }
        }
    }
}

extension PresentationDetent {
    static let small = Self.height(200)
}
