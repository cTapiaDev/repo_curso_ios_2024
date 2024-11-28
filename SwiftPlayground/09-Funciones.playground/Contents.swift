import PlaygroundSupport

func saludo(nombre: String) {
    print("Hola", nombre)
}

func suma(valor1: Int, valor2: Int) -> Int {
    return valor1 + valor2
}

saludo(nombre: "Juan")
let val1 = 20
let val2 = 30

let res = suma(valor1: val1, valor2: val2)
print(res)

