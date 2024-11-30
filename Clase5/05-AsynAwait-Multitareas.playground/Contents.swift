import Foundation

// Simular tareas asíncronas que obtienen datos de una API
func obtenerDatosAPI(id: Int) async throws -> String {
    
    try await Task.sleep(for: .seconds(id))
    print("Descargando datos de la API para el ID: \(id)...")
    
    guard id != 3 else {
        throw NSError(domain: "APIError", code: 404, userInfo: [NSLocalizedDescriptionKey: "No se pueden obtener los datos de la API"])
    }
    
    return "Datos de la API para el ID \(id)"
}

// Función que procesa los datos obtenidos
func procesarDatos(datos: String) async throws -> String {
    try await Task.sleep(for: .seconds(1))
    print("Procesando: \(datos)...")
    
    return "\(datos) procesados"
}

// Función principal
func realizarTareas() async throws {
    do {
        // LLamamos a la API para obtener los datos
        async let datos1 = obtenerDatosAPI(id: 1)
        async let datos2 = obtenerDatosAPI(id: 2)
        async let datos3 = obtenerDatosAPI(id: 4)
        
        // Esperando los resultados...
        let res1 = try await datos1
        let res2 = try await datos2
        let res3 = try await datos3
        
        // Procesar los datos
        let proceso1 = try await procesarDatos(datos: res1)
        let proceso2 = try await procesarDatos(datos: res2)
        let proceso3 = try await procesarDatos(datos: res3)
        
        print("Resultados procesados: \(proceso1), \(proceso2), \(proceso3)")
    } catch {
        print("Error al obtener datos: \(error.localizedDescription)")
    }
}


Task {
    try await realizarTareas()
}
