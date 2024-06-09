@MainActor
enum ViewModelLocator {

    static let factory: ViewModelFactory = ViewModelFactory()

}

@MainActor
class ViewModelFactory {

    let searchViewModel: SearchCocktailsViewModel = {
        SearchCocktailsViewModel(cocktailService: ServiceLocator.factory.cocktailService)
    }()


    let filterViewModel: FilterViewModel = {
        FilterViewModel(filterService: ServiceLocator.factory.filterService)
    }()

}
