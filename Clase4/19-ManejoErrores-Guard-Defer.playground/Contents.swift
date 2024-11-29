import PlaygroundSupport

enum TransaccionError: Error {
    case cuentaInvalida
    case montoInvalido
}


class TransaccionBancaria {
    var estado: String = "Iniciada"
    
    func iniciar() {
        estado = "En proceso"
        print("Transacción iniciada...")
    }
    
    func confirmar() {
        estado = "Confirmada"
        print("Transacción confirmada exitosamente.")
    }
    
    func cancelar() {
        estado = "Cancelada"
        print("Transacción cancelada debido a un error")
    }
    
    func transferirFondos(de cuentaOrigen: String, a cuentaDestino: String, monto: Double) throws {
        guard monto > 0 else {
            throw TransaccionError.montoInvalido
        }
        print("Transfiriendo \(monto) desde \(cuentaOrigen) a \(cuentaDestino)")
        
        if cuentaDestino.isEmpty {
            throw TransaccionError.cuentaInvalida
        }
    }
}

func realizarTransaccion() {
    let transaccion = TransaccionBancaria()
    transaccion.iniciar()
    
    defer {
        if transaccion.estado == "En proceso" {
            transaccion.cancelar()
        }
    }
    
    do {
        try transaccion.transferirFondos(de: "Cuenta123", a: "", monto: 200.00)
        transaccion.confirmar()
    } catch TransaccionError.montoInvalido {
        print("Error: El monto debe ser mayor a 0.")
    } catch TransaccionError.cuentaInvalida {
        print("Error: La cuenta de destino no es valida.")
    } catch {
        print("Error inesperado: \(error)")
    }

}

realizarTransaccion()













