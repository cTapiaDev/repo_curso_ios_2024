import PlaygroundSupport

class Archivo {
    func abrir() {
        print("Archivo abierto.")
    }
    
    func cerrar() {
        print("Archivo cerrado.")
    }
    
    func leer() {
        print("Leyendo datos del archivo...")
    }
}

func procesarArchivo() {
    let archivo = Archivo()
    archivo.abrir()
    defer {
        archivo.cerrar()
    }
    archivo.leer()
}

procesarArchivo()
