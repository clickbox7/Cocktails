@testable import Cocktails

struct MockData {

    static let cocktails: [CocktailModel] = [
        CocktailModel(
            id: "TestId",
            name: "TestName",
            image: "",
            alcoholicType: "",
            category: "",
            glassType: "",
            modifiedAt: "N/A",
            instructions: "",
            ingredientOne: "",
            ingredientTwo: "",
            ingredientThree: "",
            ingredientFour: "",
            ingredientFive: "",
            ingredientSix: "",
            ingredientSeven: "",
            ingredientEight: "",
            ingredientNine: "",
            ingredientTen: "",
            ingredientEleven: "",
            ingredientTwelve: "",
            ingredientThirteen: "",
            ingredientFourteen: "",
            ingredientFifteen: ""
        )
    ]

    static let alcoholicTypeFilters: [FilterDataModel] = [
        FilterDataModel(value: "Alcoholic", type: .alcoholicType),
        FilterDataModel(value: "Non Alcoholic", type: .alcoholicType),
        FilterDataModel(value: "Optional Alcoholic", type: .alcoholicType)
    ]

    static let categoryTypeFilters: [FilterDataModel] = [
        FilterDataModel(value: "Ordinary Drink", type: .category),
        FilterDataModel(value: "Cocktail", type: .category),
        FilterDataModel(value: "Shake", type: .category),
        FilterDataModel(value: "Other / Unknown", type: .category),
        FilterDataModel(value: "Cocoa", type: .category),
        FilterDataModel(value: "Shot", type: .category),
        FilterDataModel(value: "Coffee / Tea", type: .category),
        FilterDataModel(value: "Homemade Liqueur", type: .category),
        FilterDataModel(value: "Punch / Party Drink", type: .category),
        FilterDataModel(value: "Beer", type: .category),
        FilterDataModel(value: "Soft Drink", type: .category),

    ]

    static let alcoholicTypeFiltersJson = """
    {
        "drinks": [
            {
                "strAlcoholic": "Alcoholic"
            },
            {
                "strAlcoholic": "Non alcoholic"
            },
            {
                "strAlcoholic": "Optional alcohol"
            }
        ]
    }
    """

    static let categoryTypeFiltersJson = """
            {
            "drinks": [
            {
            "strCategory": "Ordinary Drink"
            },
            {
            "strCategory": "Cocktail"
            },
            {
            "strCategory": "Shake"
            },
            {
            "strCategory": "Other / Unknown"
            },
            {
            "strCategory": "Cocoa"
            },
            {
            "strCategory": "Shot"
            },
            {
            "strCategory": "Coffee / Tea"
            },
            {
            "strCategory": "Homemade Liqueur"
            },
            {
            "strCategory": "Punch / Party Drink"
            },
            {
            "strCategory": "Beer"
            },
            {
            "strCategory": "Soft Drink"
            }
            ]
            }
            """

    static let glassTypeFiltersJson = """
    {
    "drinks": [
        {
            "strGlass": "Highball glass"
        },
        {
            "strGlass": "Cocktail glass"
        },
        {
            "strGlass": "Old-fashioned glass"
        },
        {
            "strGlass": "Whiskey Glass"
        },
        {
            "strGlass": "Collins glass"
        },
        {
            "strGlass": "Pousse cafe glass"
        },
        {
            "strGlass": "Champagne flute"
        },
        {
            "strGlass": "Whiskey sour glass"
        },
        {
            "strGlass": "Cordial glass"
        },
        {
            "strGlass": "Brandy snifter"
        },
        {
            "strGlass": "White wine glass"
        },
        {
            "strGlass": "Nick and Nora Glass"
        },
        {
            "strGlass": "Hurricane glass"
        },
        {
            "strGlass": "Coffee mug"
        },
        {
            "strGlass": "Shot glass"
        },
        {
            "strGlass": "Jar"
        },
        {
            "strGlass": "Irish coffee cup"
        },
        {
            "strGlass": "Punch bowl"
        },
        {
            "strGlass": "Pitcher"
        },
        {
            "strGlass": "Pint glass"
        },
        {
            "strGlass": "Copper Mug"
        },
        {
            "strGlass": "Wine Glass"
        },
        {
            "strGlass": "Beer mug"
        },
        {
            "strGlass": "Margarita/Coupette glass"
        },
        {
            "strGlass": "Beer pilsner"
        },
        {
            "strGlass": "Beer Glass"
        },
        {
            "strGlass": "Parfait glass"
        },
        {
            "strGlass": "Mason jar"
        },
        {
            "strGlass": "Margarita glass"
        },
        {
            "strGlass": "Martini Glass"
        },
        {
            "strGlass": "Balloon Glass"
        },
        {
            "strGlass": "Coupe Glass"
        }
    ]
}
"""

}
