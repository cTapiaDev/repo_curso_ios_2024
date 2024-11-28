import PlaygroundSupport

let numero = 7

switch numero {
case 1:
    print("Uno")
case 2:
    print("Dos")
case 3:
    print("Tres")
case 4...10:
    print("Entre Cuatro y Diez")
default:
    print("No es ninguno de los números")
}

let dia = "jueves"
switch dia {
case "sabado":
    print("Hoy es dia de series")
case "lunes", "martes", "miercoles", "jueves", "viernes":
    print("Toca ir al trabajo")
case "domingo":
    print("Dia de gameplays")
default:
    print("Ingresa un dia valido")
}
