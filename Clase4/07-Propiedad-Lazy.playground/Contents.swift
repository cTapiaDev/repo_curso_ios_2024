import PlaygroundSupport

struct Persona {
    var nombre: String
    
    lazy var biografia: String = {
        print("Cargando biografía...")
        return "Hola, mi nombre es \(nombre)..."
    } ()
}

var persona = Persona(nombre: "Maite")
print(persona.biografia)
print("------------------")
print(persona.biografia)
