import PlaygroundSupport

// Ejercicio 3
class Conexion {
    func abrir() {
        print("Abriendo conexión...")
    }
    
    func cerrar() {
        print("Cerrando conexión...")
    }
    
}

func validarNumero(numero: Int) {
    guard numero > 0 else {
        print("El número no es positivo, se finaliza flujo.")
        return
    }

    let conexion = Conexion()
    conexion.abrir()
    defer {
        conexion.cerrar()
    }

    print("El número \(numero) es positivo.")
}

validarNumero(numero: -3)
print("-------")
validarNumero(numero: 5)
