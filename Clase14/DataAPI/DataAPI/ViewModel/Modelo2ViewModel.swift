import Foundation

class Modelo2ViewModel: ObservableObject {
    @Published var datosModelo = Modelo2(data: [])
    
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else {
            print("URL FALLANDO")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error al solicitar los datos:", error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("No llegaron los datos")
                return
            }
            
            do {
                let users = try JSONDecoder().decode(Modelo2.self, from: data)
                print("Usuarios obtenidos:")
                
                DispatchQueue.main.async {
                    self.datosModelo = users
                }
                
            } catch {
                print("Error con la decodificación:", error.localizedDescription)
            }
            
        }
        task.resume()
            
    }
}
