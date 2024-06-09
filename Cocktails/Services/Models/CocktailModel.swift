struct CocktailResponse: Decodable {

    let result: [CocktailModel]

    enum CodingKeys: String, CodingKey {
        case result = "drinks"
    }

}

struct CocktailModel: Decodable {

    let id: String
    let name: String
    let image: String
    let alcoholicType: String?
    let category: String?
    let glassType: String?
    let modifiedAt: String?
    let instructions: String?
    let ingredientOne: String?
    let ingredientTwo: String?
    let ingredientThree: String?
    let ingredientFour: String?
    let ingredientFive: String?
    let ingredientSix: String?
    let ingredientSeven: String?
    let ingredientEight: String?
    let ingredientNine: String?
    let ingredientTen: String?
    let ingredientEleven: String?
    let ingredientTwelve: String?
    let ingredientThirteen: String?
    let ingredientFourteen: String?
    let ingredientFifteen: String?

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case image = "strDrinkThumb"
        case category = "strCategory"
        case glassType = "strGlass"
        case alcoholicType = "strAlcoholic"
        case modifiedAt = "dateModified"
        case instructions = "strInstructions"
        case ingredientOne = "strIngredient1"
        case ingredientTwo = "strIngredient2"
        case ingredientThree = "strIngredient3"
        case ingredientFour = "strIngredient4"
        case ingredientFive = "strIngredient5"
        case ingredientSix = "strIngredient6"
        case ingredientSeven = "strIngredient7"
        case ingredientEight = "strIngredient8"
        case ingredientNine = "strIngredient9"
        case ingredientTen = "strIngredient10"
        case ingredientEleven = "strIngredient11"
        case ingredientTwelve = "strIngredient12"
        case ingredientThirteen = "strIngredient13"
        case ingredientFourteen = "strIngredient14"
        case ingredientFifteen = "strIngredient15"
    }

}
