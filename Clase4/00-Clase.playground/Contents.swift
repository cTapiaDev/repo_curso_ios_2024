import PlaygroundSupport

class Persona {
    // Variables
    private var nombre: String
    private var edad: Int
    
    // Constructor
    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }
    
    // Método
    func presentarse() -> String {
        return "Hola, mi nombre es \(nombre) y tengo \(edad) años."
    }
}

// Instanciar nuestra clase - crear un objeto
let persona = Persona(nombre: "Jose", edad: 30)
print(persona.presentarse())
