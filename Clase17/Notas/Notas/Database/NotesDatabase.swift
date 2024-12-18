

import Foundation
import SwiftData

enum DatabaseError: Error {
    case errorInsert
    case errorFetch
    case errorUpdate
    case errorNote
}

protocol NotesDatabaseProtocol {
    func insert(note: Note) throws
    func fetchAll() throws -> [Note]
}


class NotesDatabase: NotesDatabaseProtocol {
    static let shared: NotesDatabase = NotesDatabase()
    
    @MainActor
    var container: ModelContainer = setupContainer(inMemory: false)
    
    private init() {}
    
    @MainActor
    static func setupContainer(inMemory: Bool) -> ModelContainer {
        do {
            let container = try ModelContainer(for: Note.self, configurations: ModelConfiguration(isStoredInMemoryOnly: inMemory))
            
            container.mainContext.autosaveEnabled = true
            
            return container
        } catch {
            print("Error: \(error.localizedDescription)")
            fatalError("La base de datos no fue creada")
        }
    }
    
    
    @MainActor
    func insert(note: Note) throws {
        container.mainContext.insert(note)
        
        do {
            try container.mainContext.save()
        } catch {
            print("Error: \(error.localizedDescription)")
            throw DatabaseError.errorInsert
        }
    }
    
    @MainActor
    func fetchAll() throws -> [Note] {
        let fetchDescriptor = FetchDescriptor<Note>(sortBy: [SortDescriptor<Note>(\.createdAt)])
        
        do {
            return try container.mainContext.fetch(fetchDescriptor)
        } catch {
            print("Error: \(error.localizedDescription)")
            throw DatabaseError.errorFetch
        }
    }
}
