enum Route {

    case details(model: CocktailDataModel)
    case filter
    case filterResults(itemIds: [String])

}

extension Route: Hashable {}
