
import XCTest
@testable import Notas

final class NotasTests: XCTestCase {

    func testNoteInitialization() {
        let title = "Test title"
        let text = "Test text"
        let date = Date()
        
        let note = Note(title: title, text: text, createdAt: date)
        
        XCTAssertEqual(note.title, title, "El título no es igual al del Test")
        XCTAssertEqual(note.text, text)
        XCTAssertEqual(note.createdAt, date)
    }

}
