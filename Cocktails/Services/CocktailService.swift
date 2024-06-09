class CocktailService: CocktailServiceProtocol {

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func queryItems(with searchQuery: String = "") async throws -> [CocktailModel] {
        try await networkService.get(
            resource: CocktailResponse.self,
            path: ApiPath.search.rawValue,
            id: nil,
            searchQuery: searchQuery,
            filtersQuery: nil, 
            filterListQuery: nil)
        .result
    }

    func fetchDetails(for id: String) async throws -> [CocktailModel] {
        try await networkService.get(
            resource: CocktailResponse.self,
            path: ApiPath.lookup.rawValue,
            id: id,
            searchQuery: nil,
            filtersQuery: nil, 
            filterListQuery: nil)
        .result
    }

    func fetchRandom() async throws -> [CocktailModel] {
        try await networkService.get(
            resource: CocktailResponse.self,
            path: ApiPath.random.rawValue,
            id: nil,
            searchQuery: nil,
            filtersQuery: nil, 
            filterListQuery: nil)
        .result
    }

}
