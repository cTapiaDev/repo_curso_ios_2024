import PlaygroundSupport

let num1 = "20ssss"
let num2 = 20

//let suma = Int(num1)! + num2
//print(suma)

if let val1 = Int(num1) {
    let suma = val1 + num2
    print("Resultado:", suma)
} else {
    print("Escribe un numero valido")
}
