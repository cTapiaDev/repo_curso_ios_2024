import Foundation

struct Tarea {
    var nombre: String
    var vencimiento: Date
    var prioridad: Int
    var estado: String
}

let formatter = DateFormatter()
formatter.dateFormat = "dd/MM/yyyy"

let tareas: [Tarea] = [
    Tarea(nombre: "Comprar comida", vencimiento: formatter.date(from: "01/12/2024")!, prioridad: 1, estado: "Pendiente"),
    Tarea(nombre: "Revisar correos", vencimiento: formatter.date(from: "28/11/2024")!, prioridad: 2, estado: "Completa"),
    Tarea(nombre: "Lavar el auto", vencimiento: formatter.date(from: "05/12/2024")!, prioridad: 3, estado: "Pendiente"),
    Tarea(nombre: "Estudiar Swift", vencimiento: formatter.date(from: "23/12/2024")!, prioridad: 1, estado: "Pendiente"),
    Tarea(nombre: "Leer", vencimiento: formatter.date(from: "02/12/2024")!, prioridad: 2, estado: "Pendiente")
]

let completarTarea: (Tarea) -> Tarea = { tarea in
    var tareaCompleta = tarea
    tareaCompleta.estado = "Completa"
    return tareaCompleta
}

// Filtrar tareas pendientes
let tareasPendientes = tareas.filter { $0.estado == "Pendiente" }

// Ordenar las tareas pendientes por fecha de vencimiento
let tareasOrdenadasPorFecha = tareasPendientes.sorted { $0.vencimiento < $1.vencimiento }

// Filtrar tareas de alta prioridad
let tareasAltaPrioridad = tareasPendientes.filter { $0.prioridad == 1 }

// Actualizar estado de las tareas a "Completa"
let tareasCompletadas = tareasOrdenadasPorFecha.map(completarTarea)




// Mostrar tareas ordenadas por fecha
print("Tareas ordenadas por fecha de vencimiento:")
for tarea in tareasOrdenadasPorFecha {
    print("\(tarea.nombre) - Vencimiento: \(formatter.string(from: tarea.vencimiento)) - Prioridad: \(tarea.prioridad) - Estado: \(tarea.estado)")
}

print(" ")

// Mostrar tareas de alta prioridad
print("Tareas de alta prioridad")
for tarea in tareasAltaPrioridad {
    print("\(tarea.nombre) - Vencimiento: \(formatter.string(from: tarea.vencimiento)) - Prioridad: \(tarea.prioridad) - Estado: \(tarea.estado)")
}

print(" ")

// Mostrar tareas completas
print("Tareas completas")
for tarea in tareasCompletadas {
    print("\(tarea.nombre) - Vencimiento: \(formatter.string(from: tarea.vencimiento)) - Prioridad: \(tarea.prioridad) - Estado: \(tarea.estado)")
}





















