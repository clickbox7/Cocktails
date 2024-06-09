import SwiftUI

class CocktailDetailsViewModel: ObservableObject {

    @Published var cocktailDataModel: CocktailDataModel

    init(cocktailDataModel: CocktailDataModel) {
        self.cocktailDataModel = cocktailDataModel
    }

}
