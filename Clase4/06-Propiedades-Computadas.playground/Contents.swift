import PlaygroundSupport

class Rectangulo {
    var largo: Double
    var ancho: Double
    
    init(largo: Double, ancho: Double) {
        self.largo = largo
        self.ancho = ancho
    }
    
    var area: Double {
        return largo * ancho
    }
}

let rectangulo = Rectangulo(largo: 5.0, ancho: 3.0)
print("El área del rectángulo es: \(rectangulo.area)")
