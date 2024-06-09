import XCTest
@testable import Cocktails

final class SearchCocktailsViewModelTests: XCTestCase {

    var cocktailService: CocktailServiceMock!
    var viewModel: SearchCocktailsViewModel!

    @MainActor 
    override func setUp() {
        super.setUp()

        cocktailService = CocktailServiceMock()
        viewModel = SearchCocktailsViewModel(cocktailService: cocktailService)
    }

    override func tearDown() {
        super.tearDown()
    }

    @MainActor
    func testQueryingItems() async throws {
        try await viewModel.queryItems()
        let mocks = MockData
            .cocktails
            .map { CocktailDataModel(from: $0) }

        XCTAssertEqual(viewModel.searchItems, mocks)
    }

    func testFetchingRandomItem() async throws {
        let item = try await viewModel.fetchRandomItem()
        let mock = CocktailDataModel(from: MockData.cocktails[0])

        XCTAssertEqual(item, mock)
    }

}
