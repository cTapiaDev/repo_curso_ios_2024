import PlaygroundSupport

class Auto {
    var marca: String
    var velocidad: Int = 0
    
    init(marca: String) {
        self.marca = marca
    }
    
    func acelerar() {
        velocidad += 10
        print("El auto \(marca) aceleró a \(velocidad) km/h.")
    }
}

let miAuto = Auto(marca: "Ford")
miAuto.acelerar()
miAuto.acelerar()
