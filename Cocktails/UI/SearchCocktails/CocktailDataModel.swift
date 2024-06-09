import Foundation

struct CocktailDataModel: Hashable, Identifiable {

    let id: String
    let name: String
    let image: URL?
    let alcoholicType: String
    let category: String
    let glassType: String
    let modifiedAt: String
    let instructions: String
    let ingredients: String

} 

extension CocktailDataModel {

    init(from model: CocktailModel) {
        id = model.id
        name = model.name
        image = URL(string: model.image)
        alcoholicType = model.alcoholicType ?? "N/A"
        category = model.category ?? "N/A"
        glassType = model.glassType ?? "N/A"
        modifiedAt = model.modifiedAt?.date?.modifiedAt ?? "N/A"
        instructions = model.instructions ?? "N/A"
        ingredients = [
            model.ingredientOne,
            model.ingredientTwo,
            model.ingredientThree,
            model.ingredientFour,
            model.ingredientFive,
            model.ingredientSix,
            model.ingredientSeven,
            model.ingredientEight,
            model.ingredientNine,
            model.ingredientTen,
            model.ingredientEleven,
            model.ingredientTwelve,
            model.ingredientThirteen,
            model.ingredientFourteen,
            model.ingredientFifteen
        ]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined(separator: ", ")
    }

}
