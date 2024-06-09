import Combine
import SwiftUI

class SearchCocktailsViewModel: ObservableObject {

    @Published var filter: String = ""
    @Published var searchItems: [CocktailDataModel] = []

    private let cocktailService: CocktailServiceProtocol

    private var disposables: Set<AnyCancellable> = []

    init(cocktailService: CocktailServiceProtocol) {
        self.cocktailService = cocktailService

        Task {
            try await queryItems()
        }
    }

    @MainActor
    func queryItems(with filter: String = "") async throws {
        searchItems = try await cocktailService
            .queryItems(with: filter)
            .map { CocktailDataModel(from: $0) }
    }

    @MainActor
    func fetchRandomItem() async throws -> CocktailDataModel? {
        guard let model =  try await cocktailService.fetchRandom().first else { return nil }

        return CocktailDataModel(from: model)
    }

}
