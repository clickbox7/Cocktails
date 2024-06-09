import Foundation
@testable import Cocktails

class FilterServiceMock: FilterServiceProtocol {

    func fetchFilters<T: Decodable>(
        resource: T.Type,
        for type: Cocktails.FilterType
    ) async throws -> T where T : Decodable {
        let response: Data

        switch type {
        case .alcoholicType:
            response = Data(MockData.alcoholicTypeFiltersJson.utf8)
        case .category:
            response = Data(MockData.categoryTypeFiltersJson.utf8)
        case .glassType:
            response = Data(MockData.glassTypeFiltersJson.utf8)
        }

        return try JSONDecoder().decode(resource, from: response)
    }

    func filterData(with filters: [Cocktails.FilterDataModel]) async throws -> [Cocktails.CocktailModel] {
        MockData.cocktails
    }

}
