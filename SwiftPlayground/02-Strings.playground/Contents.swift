import PlaygroundSupport

// Multilineas
let texto = """
Este es un
texto que
tiene multiples
lineas

"""
print(texto)

// Concatenar
let texto1 = "Hola"
let texto2 = "Mundo"

print(texto1 + " " + texto2)
print(texto1 + texto2)
print(texto1, texto2)
print("Nuevo saludo:", texto1, texto2)
print("Nuevo saludo: " + texto1 + " " + texto2)
print("Nuevo saludo: \(texto1) \(texto2) desde el curso")

// Emojis
let emoji = "Hola 🦾" // control + command + space
print(emoji)

let caracter: Character = "🤯"
var saludo = "Hola"
saludo.append(caracter)
print(saludo)

print("Otro saludo", caracter)
let frase = "Otro saludo \(caracter) con emoji"
print(frase)


// Contar
print(frase.count)

let vacio = ""
if vacio.isEmpty {
    print("El campo no tiene nada")
} else {
    print("El campo tiene texto")
}

// Prefix
print(frase.prefix(4))















