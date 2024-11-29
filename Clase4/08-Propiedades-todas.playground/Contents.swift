import PlaygroundSupport

class Auto {
    var marca: String      // Propiedad almacenada
    var modelo: String     // Propiedad almacenada
    let anio: Int          // Propiedad almacenada inmutable
    
    // Propiedad computada
    var descripcion: String {
        return "\(marca) \(modelo) (\(anio))"
    }
    
    // Propiedad lazy
    lazy var historialMantenimiento: [String] = {
        print("Cargando el historial...")
        return ["Cambio de aceite", "Revisión de frenos"]
    } ()
    
    init(marca: String, modelo: String, anio: Int) {
        self.marca = marca
        self.modelo = modelo
        self.anio = anio
    }
}

let miAuto = Auto(marca: "Tesla", modelo: "Cybertruck", anio: 2022)
print(miAuto.descripcion)

print(" ")
print("Historial")
print(miAuto.historialMantenimiento)
print("--------------")
print(miAuto.historialMantenimiento)
