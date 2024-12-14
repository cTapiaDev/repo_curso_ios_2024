

import Foundation
import SwiftData

@Model
final class ListModel {
    var titulo: String
    var fecha: Date
    var completado: Bool
    var presupuesto: String
    var total: Float
    
    init(titulo: String = "", fecha: Date = .now, completado: Bool = false, presupuesto: String = "", total: Float = 0) {
        self.titulo = titulo
        self.fecha = fecha
        self.completado = completado
        self.presupuesto = presupuesto
        self.total = total
    }
}
