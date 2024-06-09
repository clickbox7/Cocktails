protocol FilterServiceProtocol {

    func fetchFilters<T: Decodable>(resource: T.Type, for type: FilterType) async throws -> T

    func filterData(with filters: [FilterDataModel]) async throws -> [CocktailModel]

}
