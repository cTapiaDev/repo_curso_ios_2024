

import XCTest
@testable import Notas

var mockDatabase: [Note] = []

struct CreateNoteUseCaseMock: CreateNoteProtocol {
    func createNoteWith(title: String, text: String) throws {
        let note = Note(title: title, text: text, createdAt: .now)
        mockDatabase.append(note)
    }
}

struct FetchAllNotesUseCaseMock: FetchAllNotesProtocol {
    func fetchAll() throws -> [Note] {
        return mockDatabase
    }
}

struct UpdateNoteUseCaseMock: UpdateNoteProtocol {
    func updateNoteWith(identifier: UUID, title: String, text: String?) throws {
        if let index = mockDatabase.firstIndex(where: { $0.identifier == identifier }) {
            mockDatabase[index].title = title
            mockDatabase[index].text = text
        }
    }
}

struct RemoveNoteUseCaseMock: RemoveNoteProtocol {
    func removeNoteWith(identifier: UUID) throws {
        if let index = mockDatabase.firstIndex(where: { $0.identifier == identifier }) {
            mockDatabase.remove(at: index)
        }
    }
}

final class ViewModelTest: XCTestCase {
    
    var viewModel: NoteViewModel!

    override func setUpWithError() throws {
        viewModel = NoteViewModel(createNoteUseCase: CreateNoteUseCaseMock(),
                                  fetchAllNotesUseCase: FetchAllNotesUseCaseMock(),
                                  updateNoteUseCase: UpdateNoteUseCaseMock(),
                                  removeNoteUseCase: RemoveNoteUseCaseMock())
    }

    override func tearDownWithError() throws {
        mockDatabase = []
    }
    
    func testCreateNote() {
        let title = "Test title"
        let text = "Test text"
        
        viewModel.createNoteWith(title: title, text: text)
        
        XCTAssertEqual(viewModel.notes.count, 1)
        XCTAssertEqual(viewModel.notes.first?.title, title)
        XCTAssertEqual(viewModel.notes.first?.text, text)
    }
    
    func testCreateThreeNote() {
        let title = "Test title"
        let text = "Test text"
        
        let title2 = "Test 2 title"
        let text2 = "Test 2 text"
        
        let title3 = "Test 3 title"
        let text3 = "Test 3 text"
        
        viewModel.createNoteWith(title: title, text: text)
        viewModel.createNoteWith(title: title2, text: text2)
        viewModel.createNoteWith(title: title3, text: text3)
        
        XCTAssertEqual(viewModel.notes.count, 3)
        
        XCTAssertEqual(viewModel.notes.first?.title, title)
        XCTAssertEqual(viewModel.notes.first?.text, text)
        
        XCTAssertEqual(viewModel.notes[1].title, title2)
        XCTAssertEqual(viewModel.notes[1].text, text2)
        
        XCTAssertEqual(viewModel.notes[2].title, title3)
        XCTAssertEqual(viewModel.notes[2].text, text3)
    }
    
    
    func testUpdateNote() {
        let title = "Test title"
        let text = "Test text"
        
        viewModel.createNoteWith(title: title, text: text)
        
        let newTitle = "new title"
        let newText = "new text"
        
        if let identifier = viewModel.notes.first?.identifier {
            viewModel.updateNoteWith(identifier: identifier, newTitle: newTitle, newText: newText)
            
            XCTAssertEqual(viewModel.notes.first?.title, newTitle)
            XCTAssertEqual(viewModel.notes.first?.text, newText)
        } else {
            XCTFail("La nota no fue encontrada")
        }
    }
    
    
    func testRemoveNote() {
        let title = "Test title"
        let text = "Test text"
        
        viewModel.createNoteWith(title: title, text: text)
        
        if let identifier = viewModel.notes.first?.identifier {
            viewModel.removeNoteWith(identifier: identifier)
            
            XCTAssertTrue(viewModel.notes.isEmpty)
        } else {
            XCTFail("La nota no fue encontrada")
        }
    }

}
