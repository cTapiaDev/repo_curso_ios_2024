

import XCTest

final class NotasUITests: XCTestCase {

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"]/*@START_MENU_TOKEN@*/.staticTexts["Crear Nota"]/*[[".otherElements[\"Crear Nota\"]",".buttons[\"Crear Nota\"].staticTexts[\"Crear Nota\"]",".staticTexts[\"Crear Nota\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("Nueva nota del curso")
        
        let textoTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        textoTextView.tap()
        textoTextView.typeText("Este texto pertenece a la nueva nota que se está creando automaticamente por medio del test UI, vamos a ver cuanto se tarda en escribirlo.")
        
        app.navigationBars["Nueva Nota"].buttons.matching(identifier: "createnote_button_identifier").element.tap()
    }
    
    
    func testRemoveNote() throws {
        
        let app = XCUIApplication()
        app.launch()
        app.toolbars["Toolbar"].staticTexts["Crear Nota"].tap()
        
        let collectionViewsQuery = app.collectionViews
        
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_title_identifier").element
        titleTextView.tap()
        titleTextView.typeText("Nota que vamos a eliminar")
        
        let textoTextView = collectionViewsQuery.textViews.matching(identifier: "createnote_text_identifier").element
        textoTextView.tap()
        textoTextView.typeText("Esta es la descripción de la nota que estamos a punto de eliminar, a no ser que no sea la primera.")
        
        app.navigationBars["Nueva Nota"].buttons.matching(identifier: "createnote_button_identifier").element.tap()
        
        let firstNote = collectionViewsQuery.cells.element(boundBy: 0)
        firstNote.tap()
        app.buttons["Eliminar Nota"].tap()
        
    }

}
