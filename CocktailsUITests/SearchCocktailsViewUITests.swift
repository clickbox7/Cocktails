import XCTest
@testable import Cocktails

final class SearchCocktailsViewUITests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearchFieldInput() {
        let app = XCUIApplication()
        app.launch()

        let searchField = app.searchFields["Search"]
        searchField.tap()
        searchField.typeText("A1")

        XCTAssertEqual(app.searchFields.element.value as? String,  "A1")
    }

}
