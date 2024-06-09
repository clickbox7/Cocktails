import SwiftUI

@MainActor
class AppRouter: ObservableObject {

    @Published var stack: [Route] = []

    func rootView() -> some View {
        SearchCocktailsView(viewModel: ViewModelLocator.factory.searchViewModel)
    }

    @ViewBuilder @MainActor
    func destination(for route: Route) -> some View {
        switch route {
        case .details(let model):
            detailsView(model: model)
        case .filter:
            filterView()
        case .filterResults(let itemIds):
            filterResultView(itemIds: itemIds)
        }
    }

    func detailsView(model: CocktailDataModel) -> some View {
        let viewModel = CocktailDetailsViewModel(cocktailDataModel: model)
        return CocktailDetailsView(viewModel: viewModel)
    }

    func filterView() -> some View {
        return FilterView(viewModel: ViewModelLocator.factory.filterViewModel)
    }

    func filterResultView(itemIds: [String]) -> some View {
        let viewModel = ViewModelLocator.factory.filterResultsViewModel
        viewModel.set(items: itemIds)
        return FilterResultView(viewModel: viewModel)
    }

    func push(to view: Route) {
        stack.append(view)
    }

    func pop() {
        stack.removeLast()
    }

}
