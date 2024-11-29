import PlaygroundSupport

// Protocolo
protocol Conducible {
    var velocidad: Double { get set }
    func arrancar()
    func detener()
}

class Vehiculo {
    var marca: String
    
    init(marca: String) {
        self.marca = marca
    }
    
    func detener() {
        print("El vehículo \(marca) se ha detenido.")
    }
}

class Auto: Vehiculo, Conducible {
    var velocidad: Double
    
    init(marca: String, velocidad: Double) {
        self.velocidad = velocidad
        super.init(marca: marca)
    }
    
    func arrancar() {
        print("El auto \(marca) está arrancando a una velocidad de \(velocidad) km/h.")
    }
    
    override func detener() {
        //super.detener()
        print("El auto \(marca) efectivamente se detuvo.")
    }
}


class Moto: Vehiculo, Conducible {
    var velocidad: Double
    
    init(marca: String, velocidad: Double) {
        self.velocidad = velocidad
        super.init(marca: marca)
    }
    
    func arrancar() {
        print("La moto \(marca) está arrancando a una velocidad de \(velocidad) km/h.")
    }
}


let miAuto = Auto(marca: "Tesla", velocidad: 120)
miAuto.arrancar()
miAuto.detener()

print(" ")

let miMoto = Moto(marca: "Harley", velocidad: 80)
miMoto.arrancar()
miMoto.detener()

























