import PlaygroundSupport

class PuntoClass {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

var punto1 = PuntoClass(x: 1, y: 2)
var punto2 = punto1

print("Clase")
print("---------------")
print("Punto1.x antes:", punto1.x)
punto2.x = 5
print("Punto1.x despues:", punto1.x)

print(" ")

struct PuntoStruct {
    var x: Int
    var y: Int
}

var punto3 = PuntoStruct(x: 1, y: 2)
var punto4 = punto3

print("Estructura")
print("---------------")
print("Punto3.x antes:", punto3.x)
punto4.x = 5
print("Punto3.x despues:", punto3.x)
