import PlaygroundSupport

// Closure básico
let saludoClosure = {
    print("Hola Mundo!")
}

saludoClosure()




// Closure con sintaxis simplificada
let multiplicacionClosure: (Int, Int) -> Int = { $0 * $1 } // 0 representa al primer parametro y 1 al segundo.

let resultado = multiplicacionClosure(4, 6)
print(resultado)




// Closure como parámetro en funciones
func ordenarNumeros(_ numeros: [Int], usando closure: (Int, Int) -> Bool) -> [Int] {
    return numeros.sorted(by: closure)
}

let numeros = [5, 3, 8, 9, 10, 6, 12]
let numerosOrdenados = ordenarNumeros(numeros) { $0 < $1 }
print(numerosOrdenados)




// Closure con captura de valores
func crearContador() -> () -> Int {
    var contador = 0
    let incrementoClosure: () -> Int = {
        contador += 1
        return contador
    }
    return incrementoClosure
}

let contador = crearContador()
print(contador())
print(contador())
print(contador())
