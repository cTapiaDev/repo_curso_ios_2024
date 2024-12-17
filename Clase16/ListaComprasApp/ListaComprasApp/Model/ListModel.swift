
import Foundation
import SwiftData

@Model
final class ListModel {
    @Attribute(.unique) var id: String
    var titulo: String
    var fecha: Date
    var completado: Bool
    var presupuesto: String
    var total: Float
    
    @Relationship(deleteRule: .cascade)
    var relationArticulos: [ArticulosModel]
    
    init(id: String = UUID().uuidString, titulo: String = "", fecha: Date = .now, completado: Bool = false, presupuesto: String = "", total: Float = 0, relationArticulos: [ArticulosModel] = []) {
        self.id = id
        self.titulo = titulo
        self.fecha = fecha
        self.completado = completado
        self.presupuesto = presupuesto
        self.total = total
        self.relationArticulos = relationArticulos
    }
}
