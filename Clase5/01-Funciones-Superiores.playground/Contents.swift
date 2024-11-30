import PlaygroundSupport

// Función map
let numeros = [1, 2, 3, 4, 5]
let numerosMultiplicados = numeros.map { $0 * 2 }
print("Map:", numerosMultiplicados)


// Función filter
let numeros2 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let numerosPares = numeros2.filter { $0 % 2 == 0 }
print("Filter:", numerosPares)

// Función reduce
let suma = numeros.reduce(0) { $0 + $1 }
print("Reduce:", suma)

// Función sorted
let numeros3 = [5, 10, 6, 2, 0, 8, 28]
let numerosOrdenados = numeros3.sorted { $0 < $1 }
print("Sorted:", numerosOrdenados)

// Función flatMap
let numeros4 = [[1, 2], [3, 4], [5, 6]]
let nuevaLista = numeros4.flatMap { $0 }
print("FlatMap:", nuevaLista)

// Función forEach
numeros.forEach { numero in
    print("Número:", numero)
}



