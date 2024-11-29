import PlaygroundSupport

struct Producto {
    var nombre: String
    var precio: Double
    var enStock: Bool
    
    func estaDisponible() -> String {
        return enStock ? "\(nombre) está disponible por $\(precio)" : "\(nombre) no está en stock"
    }
}

let producto1 = Producto(nombre: "iPhone 14", precio: 999.99, enStock: true)
let producto2 = Producto(nombre: "MacBook Air", precio: 1200.00, enStock: false)

print(producto1.estaDisponible())
print(producto2.estaDisponible())
