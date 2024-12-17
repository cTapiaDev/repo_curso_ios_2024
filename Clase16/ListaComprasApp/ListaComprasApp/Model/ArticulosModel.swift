

import Foundation
import SwiftData

@Model
final class ArticulosModel {
    @Attribute(.unique) var articulo: String
    var precio: Float
    var idList: String
    
    @Relationship(inverse: \ListModel.relationArticulos)
    var relationList: ListModel?
    
    init(articulo: String, precio: Float, idList: String) {
        self.articulo = articulo
        self.precio = precio
        self.idList = idList
    }
}
