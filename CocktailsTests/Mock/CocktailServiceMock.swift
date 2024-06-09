import Foundation
@testable import Cocktails

class CocktailServiceMock: CocktailServiceProtocol {

    func queryItems(with filter: String) async throws -> [Cocktails.CocktailModel] {
        MockData.cocktails
    }

    func fetchDetails(for id: String) async throws -> [Cocktails.CocktailModel] {
        MockData.cocktails
    }

    func fetchRandom() async throws -> [Cocktails.CocktailModel] {
        MockData.cocktails
    }

}
