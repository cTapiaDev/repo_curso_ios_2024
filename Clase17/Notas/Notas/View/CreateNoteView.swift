

import SwiftUI

struct CreateNoteView: View {
    
    var viewModel: NoteViewModel
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text("*Título"), axis: .vertical)
                        .accessibilityIdentifier("createnote_title_identifier")
                    TextField("", text: $text, prompt: Text("*Texto"), axis: .vertical)
                        .accessibilityIdentifier("createnote_text_identifier")
                } footer: {
                    Text("* El título es obligatorio")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cerrar")
                    }
                }
                ToolbarItem {
                    Button {
                        viewModel.createNoteWith(title: title, text: text)
                        dismiss()
                    } label: {
                        Text("Crear Nota")
                            .bold()
                            .accessibilityIdentifier("createnote_button_identifier")
                    }
                }
            }
            .navigationTitle("Nueva Nota")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CreateNoteView(viewModel: .init())
}
