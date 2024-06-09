import SwiftUI

class FilterViewModel: ObservableObject {

    @Published var alcoholicTypeFilters: [FilterDataModel] = []
    @Published var categoryTypeFilters: [FilterDataModel] = []
    @Published var glassTypeFilters: [FilterDataModel] = []
    @Published var selectedFilters: [FilterDataModel] = []

    @Published var isAlcoholicTypeGroupExpanded: Bool = false
    @Published var isCategoryGroupExpanded: Bool = false
    @Published var isGlassTypeGroupExpanded: Bool = false

    private let filterService: FilterServiceProtocol

    init(filterService: FilterServiceProtocol) {
        self.filterService = filterService

        Task {
            try await fetchFilters(for: .alcoholicType)
            try await fetchFilters(for: .category)
            try await fetchFilters(for: .glassType)
        }
    }

    func fetchFilters(for type: FilterType) async throws {
        switch type {
        case .alcoholicType:
            alcoholicTypeFilters = try await filterService
                .fetchFilters(resource: FilterResponse<AlcoholicTypeFilterModel>.self, for: type)
                .result
                .map { FilterDataModel(from: $0) }
        case .category:
            categoryTypeFilters = try await filterService
                .fetchFilters(resource: FilterResponse<CategoryTypeFilterModel>.self, for: type)
                .result
                .map { FilterDataModel(from: $0) }
        case .glassType:
            glassTypeFilters = try await filterService
                .fetchFilters(resource: FilterResponse<GlassTypeFilterModel>.self, for: type)
                .result
                .map { FilterDataModel(from: $0) }
        }
    }

    func filterData() async throws -> [String] {
        guard !selectedFilters.isEmpty else { return [] }

        return try await filterService
            .filterData(with: selectedFilters)
            .map { CocktailDataModel(from: $0) }
            .map { $0.id }
    }

    func groupTitle(for type: FilterType) -> String? {
        selectedFilters.first(where: { $0.type == type })?.value
    }

    func select(_ filter: FilterDataModel) {
        if let index = selectedFilters.firstIndex(where: { $0.type == filter.type }) {
            selectedFilters.remove(at: index)
        }

        selectedFilters.append(filter)
        handleGroupExpansion(for: filter)
    }

    func handleGroupExpansion(for model: FilterDataModel) {
        withAnimation {
            switch model.type {
            case .alcoholicType:
                isAlcoholicTypeGroupExpanded = false
            case .category:
                isCategoryGroupExpanded = false
            case .glassType:
                isGlassTypeGroupExpanded = false
            }
        }
    }

    func resetFilters() {
        selectedFilters.removeAll()
        collapseGroups()
    }

    func collapseGroups() {
        isAlcoholicTypeGroupExpanded = false
        isCategoryGroupExpanded = false
        isGlassTypeGroupExpanded = false
    }

}
