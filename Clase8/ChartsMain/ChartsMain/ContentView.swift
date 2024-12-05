
import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        VStack {
            Chart(datosGanancias) { item in
//                BarMark(x: .value("Dia", item.dia), y: .value("Ganancia", item.precio))
//                    .foregroundStyle(by: .value("Dia", item.dia))
                
//                LineMark(x: .value("Dia", item.dia), y: .value("Ganancia", item.precio))

                
//                AreaMark(x: .value("Dia", item.dia), y: .value("Ganancia", item.precio))
                
                RectangleMark(x: .value("Dia", item.dia), y: .value("Ganancia", item.precio))
            }
        }
        .padding()
    }
}

struct Datos: Identifiable {
    var id = UUID()
    var dia: String
    var precio: Double
}

var datosGanancias: [Datos] = [
    Datos(dia: "Lunes", precio: 3200.00),
    Datos(dia: "Martes", precio: 4200.00),
    Datos(dia: "Miercoles", precio: 3000.00),
    Datos(dia: "Jueves", precio: 2000.00),
    Datos(dia: "Viernes", precio: 1400.00),
]
