import PlaygroundSupport

func procesarReserva(nombre: String?, fechaLlegada: String?, noches: Int?) {
    // Validar que el nombre no sea nulo
    guard let nombre = nombre, !nombre.isEmpty else {
        print("Error: Debes proporcionar un nombre válido.")
        return
    }
    
    // Validar la fecha de Llegada
    guard let fechaLlegada = fechaLlegada, !fechaLlegada.isEmpty else {
        print("Error: Debes proporcionar una fecha de llegada válida.")
        return
    }
    
    // Validar la cantidad de noches
    guard let noches = noches, noches > 0 else {
        print("Error: El número de noches debe ser mayor a 0.")
        return
    }
    
    print("Reserva confirmada para \(nombre). Fecha de llegada: \(fechaLlegada), por: \(noches) noches.")
}

procesarReserva(nombre: "Carlos", fechaLlegada: "2024-12-01", noches: 3)
procesarReserva(nombre: nil, fechaLlegada: "2024-12-01", noches: 3)
procesarReserva(nombre: "Tamara", fechaLlegada: nil, noches: 3)
procesarReserva(nombre: "Gabriel", fechaLlegada: "2024-12-01", noches: 0)


