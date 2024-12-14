

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var login: PostViewModel
    
    @StateObject var users = Modelo1ViewModel()
    
    var body: some View {
        NavigationView {
            if users.datosModelo.isEmpty {
                ProgressView()
            } else {
                List(users.datosModelo, id: \.id) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                        Text(item.address.geo.lat)
                    }
                }
                .navigationTitle("Usuarios")
                .toolbar {
                    Button(action: {
                        UserDefaults.standard.removeObject(forKey: "sesion")
                        login.authenticated = 0
                    }) {
                        Text("Salir")
                    }
                    
                    NavigationLink(destination: Home2()) {
                        Text("Siguiente")
                    }
                }
            }
            
        }
    }
}
