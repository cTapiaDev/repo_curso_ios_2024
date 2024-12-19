
import XCTest
@testable import Notas

@MainActor
final class ViewModelIntegrationTest: XCTestCase {
    var sut: NoteViewModel!

    override func setUpWithError() throws {
        let database = NotesDatabase.shared
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        let createNoteUseCase = CreateNoteUseCase(notesDatabase: database)
        let fetchAllNotesUseCase = FetchAllNotesUseCase(notesDatabase: database)
        
        sut = NoteViewModel(createNoteUseCase: createNoteUseCase, fetchAllNotesUseCase: fetchAllNotesUseCase)
    }

    override func tearDownWithError() throws {
       
    }
    
    func testCreateNote() {
        sut.createNoteWith(title: "Nota 1", text: "Texto de la nota 1")
        
        let note = sut.notes.first
        
        XCTAssertNotNil(note)
        XCTAssertEqual(note?.title, "Nota 1")
        XCTAssertEqual(note?.text, "Texto de la nota 1")
        XCTAssertEqual(sut.notes.count, 1, "Debería existir solo una nota en la DB")
    }
    
    func testCreateTwoNote() {
        sut.createNoteWith(title: "Nota 3", text: "Texto de la nota 3")
        sut.createNoteWith(title: "Nota 2", text: "Texto de la nota 2")
        
        let note3 = sut.notes.first
        let note2 = sut.notes.last
        
        XCTAssertNotNil(note3)
        XCTAssertEqual(note3?.title, "Nota 3")
        XCTAssertEqual(note3?.text, "Texto de la nota 3")
        
        XCTAssertNotNil(note2)
        XCTAssertEqual(note2?.title, "Nota 2")
        XCTAssertEqual(note2?.text, "Texto de la nota 2")
        
        XCTAssertEqual(sut.notes.count, 2, "Deberían existir solo dos notas en la DB")
    }
    
    func testFetchAllNotes() {
        sut.createNoteWith(title: "Buscar 1", text: "nueva nota encontrada 1")
        sut.createNoteWith(title: "Buscar 2", text: "nueva nota encontrada 2")
        
        let note = sut.notes[0]
        let note2 = sut.notes[1]
        
        XCTAssertEqual(sut.notes.count, 2, "Deberiamos tener dos notas en la base de datos")
        
        XCTAssertEqual(note.title, "Buscar 1")
        XCTAssertEqual(note.text, "nueva nota encontrada 1")
        
        XCTAssertEqual(note2.title, "Buscar 2")
        XCTAssertEqual(note2.text, "nueva nota encontrada 2")
    }
    
    
}
