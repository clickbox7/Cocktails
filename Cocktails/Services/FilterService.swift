class FilterService: FilterServiceProtocol {

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchFilters<T: Decodable>(resource: T.Type, for type: FilterType) async throws -> T {
        try await networkService.get(
            resource: T.self,
            path: ApiPath.list.rawValue,
            id: nil,
            searchQuery: nil,
            filtersQuery: nil,
            filterListQuery: type.query)
    }

    func filterData(with filters: [FilterDataModel]) async throws -> [CocktailModel] {
        let query = filters.map { ($0.type.query, $0.value )}

        return try await networkService.get(
            resource: CocktailResponse.self,
            path: ApiPath.filter.rawValue,
            id: nil,
            searchQuery: nil,
            filtersQuery: query,
            filterListQuery: nil)
        .result
    }

}
