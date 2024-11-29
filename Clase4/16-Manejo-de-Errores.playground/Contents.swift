import PlaygroundSupport

// Errores personalizados que podriamos tener en el ejemplo
enum ConversionError: Error {
    case monedaNoEncontrada
    case montoInvalido
}

// Diccionario con las tasas de cambios
let tasasDeCambio: [String: Double] = [
    "USD": 1.0,
    "EUR": 0.9,
    "CLP": 900.0
]

func convertir(monto: Double, a moneda: String) throws -> Double {
    // Validar que el monto sea positivo
    guard monto > 0 else {
        throw ConversionError.montoInvalido
    }
    
    // Buscar el tipo de cambio
    guard let tasa = tasasDeCambio[moneda] else {
        throw ConversionError.monedaNoEncontrada
    }
    
    return monto * tasa
}


do {
    let montoConvertido = try convertir(monto: 100, a: "EUR")
    print("Monto convertido: \(montoConvertido) EUR")
    
    let montoInvalido = try convertir(monto: -50, a: "USD")
    print("Monto convertido: \(montoInvalido) USD")
    
} catch ConversionError.monedaNoEncontrada {
    print("Error: La moneda solicitada no está disponible.")
} catch ConversionError.montoInvalido {
    print("Error: El monto debe ser mayor a 0.")
} catch {
    print("Error desconocido: \(error)")
}




















