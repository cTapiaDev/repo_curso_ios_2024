import PlaygroundSupport

// Función generica para intercambiar valores
func intercambiar<T>(_ a: inout T, _ b: inout T) {
    
    let temp = a
    a = b
    b = temp
}

var num1 = 10, num2 = 20
intercambiar(&num1, &num2)
print("num1: \(num1), num2: \(num2)")
