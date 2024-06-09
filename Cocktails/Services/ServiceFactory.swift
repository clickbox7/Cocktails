protocol ServiceFactoryProtocol {

    var networkService: NetworkServiceProtocol { get }
    var cocktailService: CocktailServiceProtocol { get }
    var filterService: FilterServiceProtocol { get }

}

enum ServiceLocator {

    static let factory: ServiceFactoryProtocol = ServiceFactory()

}

class ServiceFactory: ServiceFactoryProtocol {

    let networkService: NetworkServiceProtocol = {
        NetworkService()
    }()

    lazy var cocktailService: CocktailServiceProtocol = {
        CocktailService(networkService: networkService)
    }()

    lazy var filterService: FilterServiceProtocol = {
        FilterService(networkService: networkService)
    }()

}
