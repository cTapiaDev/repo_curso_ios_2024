import PlaygroundSupport

protocol Volador {
    var velocidad: Double { get set }
    func volar()
}

class Pajaro: Volador {
    var velocidad: Double
    
    init(velocidad: Double) {
        self.velocidad = velocidad
    }
    
    func volar() {
        print("El pájaro está volando a \(velocidad) km/h.")
    }
}

class Avion: Volador {
    var velocidad: Double
    var modelo: String
    
    init(velocidad: Double, modelo: String) {
        self.velocidad = velocidad
        self.modelo = modelo
    }
    
    func volar() {
        print("El avión \(modelo) está volando a \(velocidad) km/h.")
    }
}

let canario = Pajaro(velocidad: 30)
canario.volar()

let jet = Avion(velocidad: 900, modelo: "Boeing 747")
jet.volar()














