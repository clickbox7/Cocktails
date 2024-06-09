protocol NetworkServiceProtocol {

    func get<T: Decodable>(
        resource: T.Type,
        path: String,
        id: String?,
        searchQuery: String?,
        filtersQuery: [(String, String)]?,
        filterListQuery: String?
    ) async throws -> T

}
