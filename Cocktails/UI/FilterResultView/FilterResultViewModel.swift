import SwiftUI

class FilterResultViewModel: ObservableObject {

    private let debounceInNanoseconds: UInt64 = 100_000_000

    @Published var presentableItems: [CocktailDataModel] = []

    private let cocktailService: CocktailServiceProtocol

    private var fetchingDataTask: Task<Void, Error>?

    private var itemIds: [String] = []

    init(cocktailService: CocktailServiceProtocol) {
        self.cocktailService = cocktailService
    }

    func set(items: [String]) {
        guard itemIds != items else { return }

        itemIds.removeAll()
        itemIds = items
        startFetchingTask(for: items)
    }

    func startFetchingTask(for items: [String]) {
        fetchingDataTask = Task {
            await MainActor.run {
                presentableItems.removeAll()
            }

            try await fetchModels(for: items)
        }
    }

    func cancelFetchingTask() {
        fetchingDataTask?.cancel()
    }

    private func fetchModels(for ids: [String]) async throws {
        try await ids.asyncForEach { id in
            try await Task.sleep(nanoseconds: debounceInNanoseconds)
            guard let model = try await cocktailService
                .fetchDetails(for: id)
                .first else { return }

            await MainActor.run {
                presentableItems.append(CocktailDataModel(from: model))
            }
        }
    }

}
