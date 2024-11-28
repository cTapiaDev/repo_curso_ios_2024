import PlaygroundSupport

// Arrays
var nombres = ["Jose", "Valeria", "Pedro", "Maria"]

print(nombres)
print(nombres[0])
print(nombres.count)
print(nombres[1].count)
nombres.append("Daniela")
print(nombres)
print(nombres.count)
nombres.remove(at: 0)
print(nombres)

// Tuplas
var usuario = ("Carlos", 29, 1234562334, true)

print(usuario)
print(usuario.0)
let (nombre, edad, telefono, bool) = usuario

print(telefono)
