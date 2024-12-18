

import Foundation
import Observation

@Observable
class NoteViewModel {
    
    var notes: [Note]
    
    var createNoteUseCase: CreateNoteUseCase
    var fetchAllNotesUseCase: FetchAllNotesUseCase
    
    init(notes: [Note] = [],
         createNoteUseCase: CreateNoteUseCase = CreateNoteUseCase(),
         fetchAllNotesUseCase: FetchAllNotesUseCase = FetchAllNotesUseCase()) {
        self.notes = notes
        self.createNoteUseCase = createNoteUseCase
        self.fetchAllNotesUseCase = fetchAllNotesUseCase
        fetchAllNotes()
    }
    
    func createNoteWith(title: String, text: String) {
//        let note: Note = .init(title: title, text: text, createdAt: .now)
//        notes.append(note)
        
        do {
            try createNoteUseCase.createNoteWith(title: title, text: text)
            fetchAllNotes()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func fetchAllNotes() {
        do {
            notes = try fetchAllNotesUseCase.fetchAll()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func updateNoteWith(identifier: UUID, newTitle: String, newText: String?) {
        if let index = notes.firstIndex(where: { $0.identifier == identifier }) {
            let updateNote = Note(identifier: identifier, title: newTitle, text: newText, createdAt: notes[index].createdAt)
            notes[index] = updateNote
        }
    }
    
    func removeNoteWith(identifier: UUID) {
        notes.removeAll(where: { $0.identifier == identifier })
    }
    
    
}
