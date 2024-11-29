import PlaygroundSupport

struct Libro {
    var titulo: String
    var autor: String
    var numeroPag: Int
    
    // Método
    func descripcion() -> String {
        return "El libro \(titulo) fue escrito por \(autor) y tiene \(numeroPag) páginas"
    }
}

// Instanciar un libro
let libro = Libro(titulo: "Fuego y Sangre", autor: "George R. R. Martin", numeroPag: 860)
print(libro.descripcion())
