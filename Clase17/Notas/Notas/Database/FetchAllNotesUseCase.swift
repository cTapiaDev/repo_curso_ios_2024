

import Foundation

struct FetchAllNotesUseCase {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func fetchAll() throws -> [Note] {
        try notesDatabase.fetchAll()
    }
}
