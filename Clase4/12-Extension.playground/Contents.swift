import PlaygroundSupport

extension String {
    func invertido() -> String {
        return String(self.reversed())
    }
}

let saludo = "Hola Mundo desde curso iOS!"
let saludoInvertido = saludo.invertido()

print(saludoInvertido)
