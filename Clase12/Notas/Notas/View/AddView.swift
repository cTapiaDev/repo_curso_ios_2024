

import SwiftUI

struct AddView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @ObservedObject var model: ViewModel
    
    var body: some View {
        VStack {
            Text(model.updateItem != nil ? "Editar nota" : "Agregar nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccionar fecha", selection: $model.fecha)
            Spacer()
            Button(action: {
                if model.updateItem != nil {
                    model.editData(context: context)
                } else {
                    model.saveData(context: context)
                }
            }) {
                Label(
                    title: { Text("Guardar").foregroundColor(.white).bold() },
                    icon: { Image(systemName: "plus").foregroundColor(.white) }
                )
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(model.nota == "" ? Color.gray : Color.blue)
            .cornerRadius(8)
            .disabled(model.nota == "" ? true : false)
        }
        .padding()
    }
}
