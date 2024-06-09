import XCTest
@testable import Cocktails

final class FilterViewModelTests: XCTestCase {

    var filterService: FilterServiceMock!
    var viewModel: FilterViewModel!

    override func setUp() {
        super.setUp()

        filterService = FilterServiceMock()
        viewModel = FilterViewModel(filterService: filterService)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetchingAlcoholicTypeFilters() async throws {
        try await viewModel.fetchFilters(for: .alcoholicType)
        let mock = MockData
            .alcoholicTypeFilters
        XCTAssertEqual(viewModel.alcoholicTypeFilters.count, mock.count)
    }

    func testFetchingCategoryTypeFilters() async throws {
        try await viewModel.fetchFilters(for: .category)
        let mock = MockData
            .categoryTypeFilters
        XCTAssertEqual(viewModel.categoryTypeFilters.count, mock.count)
    }

    func testFilterSelection() {
        viewModel.select(MockData.alcoholicTypeFilters[0])
        XCTAssertEqual(viewModel.selectedFilters.count, 1)
    }

    func testSameTypeFilterSelection() {
        viewModel.select(MockData.alcoholicTypeFilters[0])
        viewModel.select(MockData.alcoholicTypeFilters[1])
        XCTAssertEqual(viewModel.selectedFilters.count, 1)
    }

    func testFilteringData() async throws {
        viewModel.selectedFilters.append(MockData.alcoholicTypeFilters[0])
        let cocktails = try await viewModel.filterData()
        let mocks = MockData
            .cocktails
            .map { CocktailDataModel(from: $0).id}
        XCTAssertEqual(cocktails, mocks)
    }

}
