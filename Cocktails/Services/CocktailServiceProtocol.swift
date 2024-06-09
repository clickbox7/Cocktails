import Combine

protocol CocktailServiceProtocol {

    func queryItems(with filter: String) async throws -> [CocktailModel]

    func fetchDetails(for id: String) async throws -> [CocktailModel]

    func fetchRandom() async throws -> [CocktailModel]

}
