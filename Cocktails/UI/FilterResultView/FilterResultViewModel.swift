import SwiftUI

class FilterResultViewModel: ObservableObject {

    private let debounce: UInt64 = 100_000_000

    @Published var presentableItems: [CocktailDataModel] = []

    private let cocktailService: CocktailServiceProtocol
    private let itemIds: [String]

    private var fetchingDataTask: Task<Void, Error>?

    init(cocktailService: CocktailServiceProtocol, itemIds: [String]) {
        self.itemIds = itemIds
        self.cocktailService = cocktailService

        fetchingDataTask = Task {
            try await fetchModels(for: itemIds)
        }
    }

    func startFetchingTask() {
        fetchingDataTask = Task {
            try await fetchModels(for: itemIds)
        }
    }

    func cancelFetchingTask() {
        fetchingDataTask?.cancel()
    }

    private func fetchModels(for ids: [String]) async throws {
        try await ids.asyncForEach { id in
            try await Task.sleep(nanoseconds: debounce)
            guard let model = try await cocktailService
                .fetchDetails(for: id)
                .first else { return }

            await MainActor.run {
                presentableItems.append(CocktailDataModel(from: model))
            }
        }
    }

}
