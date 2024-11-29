import PlaygroundSupport

func incrementar(valor: inout Int) {
    valor += 1 // Se modifica el valor de la variable externa
}

var numero = 1
incrementar(valor: &numero)
print(numero)
