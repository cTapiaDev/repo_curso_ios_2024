
import Foundation

class PostViewModel: ObservableObject {
    @Published var authenticated = 0
    
//    init() {
//        login(email: "eve.holt@reqres.in", password: "cityslicka")
//    }
    
    init() {
//        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int {
//            authenticated = sesion
//        } else {
//            authenticated = 0
//        }
        
        if let retrievedToken = KeychainHelper.shared.retrieveToken() {
            print("Token recuperado: \(retrievedToken)")
            authenticated = 1
        } else {
            print("No se encontró el token correcto")
            authenticated = 0
        }
    }
    
    func login(email: String, password: String) {
        guard let url = URL(string:"https://reqres.in/api/login") else { return }
        let parametros = ["email": email, "password": password]
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
            do {
                let datos = try JSONDecoder().decode(PostModel.self, from: data)
                if !datos.token.isEmpty {
                    DispatchQueue.main.async {
                        print(datos.token)
//                        self.authenticated = 1
//                        UserDefaults.standard.setValue(1, forKey: "sesion")
                        if KeychainHelper.shared.saveToken(datos.token) {
                            print("Token guardado en Keychain")
                            self.authenticated = 1
                        }
                    }
                }
            } catch let error as NSError {
                print("Error al hacer POST:", error.localizedDescription)
                DispatchQueue.main.async {
                    self.authenticated = 2
                }
            }
            
        }.resume()
    }
}

class KeychainHelper {
    static let shared = KeychainHelper()
    private init() {}
    
    func saveToken(_ token: String) -> Bool {
        let data = Data(token.utf8)
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "authToken",
            kSecValueData as String: data
        ]
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    func retrieveToken() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "authToken",
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        if status == errSecSuccess, let data = result as? Data {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}


