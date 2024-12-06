

import SwiftUI

struct ContentView: View {
    
    let imagen = Imagenes(image: Image("deadpool"))
    
    var body: some View {
        VStack {
            ShareLink("Compartir", item: "Un texto")
            ShareLink("Compartir Imagen", item: imagen, preview: SharePreview("Imagen", image: imagen.image))
        }
        .padding()
    }
}

struct Imagenes: Transferable {
    var image: Image
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
}
