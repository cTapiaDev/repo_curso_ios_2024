import Foundation

// Función asíncrona simple
func tarea(id: Int) async {
    print("Iniciando tarea \(id)...")
    let delay = UInt64(id)
    await Task.sleep(delay * 1_000_000_000)
    print("Tarea \(id) completa.")
}

Task {
    async let tarea1: () = tarea(id: 1)
    async let tarea2: () = tarea(id: 2)
    async let tarea3: () = tarea(id: 3)
    
    await tarea1
    await tarea2
    await tarea3
    
    print("Todas las tareas están completas.")
}
