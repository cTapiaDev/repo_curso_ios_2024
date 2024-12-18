

import SwiftUI

struct Home: View {
    
    var viewModel: NoteViewModel = .init()
    @State var showCreateNote: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(value: note) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .foregroundStyle(.primary)
                            Text(note.getText)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button(action: {
                        showCreateNote.toggle()
                    }, label: {
                        Label("Crear Nota", systemImage: "square.and.pencil")
                            .labelStyle(TitleAndIconLabelStyle())
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                }
            }
            .navigationTitle("Notas")
            .navigationDestination(for: Note.self, destination: { note in
                UpdateNoteView(viewModel: viewModel, identifier: note.identifier, title: note.title, text: note.getText)
            })
            .fullScreenCover(isPresented: $showCreateNote, content: {
                CreateNoteView(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    Home(viewModel: .init(notes: [
        .init(title: "Swift iOS", text: "Texto de la nota 1", createdAt: .now),
        .init(title: "Swift iOS 2", text: "Texto de la nota 2", createdAt: .now),
    ]))
}
