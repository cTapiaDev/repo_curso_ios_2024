import PlaygroundSupport

// Opcionales
var numero: Int? = nil
//numero = 29
print(numero ?? "Sin valor")

// Binding
if let edad = numero {
    print("La edad es", edad)
} else {
    print("Sin valor")
}

func edad(edad: Int?) {
    guard let age = edad else {
        print("Escribe tu edad")
        return
    }
    print("Mi edad es", age)
}

edad(edad: numero)
