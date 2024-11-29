import PlaygroundSupport

class Animal {
    var nombre: String
    
    init(nombre: String) {
        self.nombre = nombre
    }
    
    func hacerSonido() {
        print("\(nombre) hace un sonido")
    }
}

class Perro: Animal {
    func ladrar() {
        print("\(nombre) dice: ¡Guau!")
    }
}

let miPerro = Perro(nombre: "Rex")
miPerro.hacerSonido()
miPerro.ladrar()
