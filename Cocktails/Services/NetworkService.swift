import Foundation

class NetworkService: NetworkServiceProtocol {

    private enum NetworkServiceError: Error {

        case malformedURL

    }

    private enum Constants: String {

        case search = "s"
        case lookup = "i"
        case list

    }

    private let host = "https://www.thecocktaildb.com"

    func get<T>(
        resource: T.Type,
        path: String,
        id: String?,
        searchQuery: String?,
        filtersQuery: [(String, String)]?,
        filterListQuery: String?
    ) async throws -> T where T : Decodable {
        var query: [(String, String)] = []

        if let searchQuery = searchQuery {
            query.append((Constants.search.rawValue, searchQuery))
        }

        if let id = id {
            query.append((Constants.lookup.rawValue, id))
        }

        if let filtersQuery = filtersQuery {
            filtersQuery.forEach { filterQuery in
                query.append(filterQuery)
            }
        }

        if let filterListQuery = filterListQuery {
            query.append((filterListQuery, Constants.list.rawValue))
        }

        let request = try makeRequest(host: host, path: path, query: query)

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoded = try JSONDecoder().decode(resource, from: data)

        return decoded
    }

    private func makeRequest(host: String, path: String, query: [(String, String)]) throws -> URLRequest {
        guard
            let url = URL(string: host),
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        else { throw NetworkServiceError.malformedURL }

        components.path = path
        components.queryItems = query.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }

        guard let componentsUrl = components.url else { throw NetworkServiceError.malformedURL }

        let request = URLRequest(url: componentsUrl)
        return request
    }

}
