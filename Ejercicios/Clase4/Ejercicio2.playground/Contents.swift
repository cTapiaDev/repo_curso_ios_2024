import Foundation

enum PosiblesErrores: Error {
    case UsuarioNoEncontrado
    case contraseniaIncorrecta
}

let usuarios = [
    "usuario1": "pass123",
    "usuario2": "pass456"
]

func verificacionUsuario(_ usuario: String, _ pass: String) throws {
    guard let passCorrecta = usuarios[usuario] else {
        throw PosiblesErrores.UsuarioNoEncontrado
    }
    guard pass == passCorrecta else {
        throw PosiblesErrores.contraseniaIncorrecta
    }
    print("¡Bienvenido \(usuario)!")
}

func loginUsuarios() {
    let usuario = "usuari"
    let pass = "pass1"
    
    do {
        try verificacionUsuario(usuario, pass)
    } catch PosiblesErrores.UsuarioNoEncontrado {
        print("ERROR: Usuario no encontrado")
    } catch PosiblesErrores.contraseniaIncorrecta {
        print("ERROR: Contraseña incorrecta")
    } catch {
        print("ERROR: \(error.localizedDescription)")
    }
}

loginUsuarios()
