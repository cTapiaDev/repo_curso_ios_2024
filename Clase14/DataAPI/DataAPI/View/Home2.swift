
import SwiftUI

struct Home2: View {
    
    @StateObject var users = Modelo2ViewModel()
    
    var body: some View {
        if users.datosModelo.data.isEmpty {
            ProgressView()
        } else {
            List(users.datosModelo.data, id: \.id) { item in
                NavigationLink(destination: DetalleView(id: item.id)) {
                    HStack {
                        Image(systemName: "persona.fill")
                            .data(url: URL(string: item.avatar)!)
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(item.first_name)
                                .font(.title)
                            Text(item.email)
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("USERS CON IMAGENES")
            }
        }
    }
}


extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}

