
import Foundation

class Modelo1ViewModel: ObservableObject {
    @Published var datosModelo: [Modelo1] = []
    
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
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
                let users = try JSONDecoder().decode([Modelo1].self, from: data)
                print("Usuarios obtenidos:")
                
                DispatchQueue.main.async {
                    self.datosModelo = users
                }
                
                for user in users {
                    print("\(user.name) - \(user.email)")
                }
            } catch {
                print("Error con la decodificación:", error.localizedDescription)
            }
            
        }
        task.resume()
            
    }
}
