import PlaygroundSupport

let numeros = [1, 2, 3, 4, 5, 6]

let numerosFiltradosYMultiplicados = numeros
    .map { $0 * 3 } // Multiplicamos cada elemento por 3
    .filter { $0 % 2 == 0 } // Filtramos los pares

print(numerosFiltradosYMultiplicados)

// Funciones de orden superior anidadas
let resultado = numeros
    .map { $0 * 2 }
    .filter { $0 > 5 }
    .reduce(0) { $0 + $1 }

print(resultado)


// Ordenar y Filtrar
struct Persona {
    var nombre: String
    var edad: Int
}

let personas = [
    Persona(nombre: "Maite", edad: 30),
    Persona(nombre: "Julieta", edad: 25),
    Persona(nombre: "Calipso", edad: 28)
]

let personasOrdenadas = personas
    .sorted { $0.edad < $1.edad } // Ordenamos por edad
    .filter { $0.edad >= 28 }

for persona in personasOrdenadas {
    print("\(persona.nombre), \(persona.edad) años")
}


// Closure para ordenar Cadenas
let frutas = ["manzana", "platano", "kiwi", "uva"]
let frutasOrdenadas = frutas.sorted { $0 < $1 }
print(frutasOrdenadas)



// Closure con Parámetros Opcionales
let sumarOpcionales: (Int?, Int?) -> Int? = { a, b in
    guard let a = a, let b = b else { return nil }
    return a + b
}

let result = sumarOpcionales(10, nil)
print(result ?? "No se pudo realizar la suma")
