

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Error en el archivo local: \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Error en la carga del archivo: \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Error en la decodificación del archivo: \(file)")
        }
        
        return loaded
        
    }
}
