import PlaygroundSupport

class Archivo {
    var nombre: String
    
    init(nombre: String) {
        self.nombre = nombre
        print("Archivo \(nombre) abierto.")
    }
    
    deinit {
        print("Archivo \(nombre) cerrado.")
    }
}

var archivo: Archivo? = Archivo(nombre: "documento.txt")
archivo = nil
