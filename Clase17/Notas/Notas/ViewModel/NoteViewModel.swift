

import Foundation
import Observation

@Observable
class NoteViewModel {
    
    var notes: [Note]
    
    var createNoteUseCase: CreateNoteProtocol
    var fetchAllNotesUseCase: FetchAllNotesProtocol
    var updateNoteUseCase: UpdateNoteProtocol
    var removeNoteUseCase: RemoveNoteProtocol
    
    init(notes: [Note] = [],
         createNoteUseCase: CreateNoteProtocol = CreateNoteUseCase(),
         fetchAllNotesUseCase: FetchAllNotesProtocol = FetchAllNotesUseCase(),
         updateNoteUseCase: UpdateNoteProtocol = UpdateNoteUseCase(),
         removeNoteUseCase: RemoveNoteProtocol = RemoveNoteUseCase()) {
        self.notes = notes
        self.createNoteUseCase = createNoteUseCase
        self.fetchAllNotesUseCase = fetchAllNotesUseCase
        self.updateNoteUseCase = updateNoteUseCase
        self.removeNoteUseCase = removeNoteUseCase
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
//        if let index = notes.firstIndex(where: { $0.identifier == identifier }) {
//            let updateNote = Note(identifier: identifier, title: newTitle, text: newText, createdAt: notes[index].createdAt)
//            notes[index] = updateNote
//        }
        
        do {
            try updateNoteUseCase.updateNoteWith(identifier: identifier, title: newTitle, text: newText)
            fetchAllNotes()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
    }
    
    func removeNoteWith(identifier: UUID) {
//        notes.removeAll(where: { $0.identifier == identifier })
        
        do {
            try removeNoteUseCase.removeNoteWith(identifier: identifier)
            fetchAllNotes()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    
}
