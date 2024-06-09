struct AlcoholicTypeFilterModel: Decodable {

    let value: String

    enum CodingKeys: String, CodingKey {
        case value = "strAlcoholic"
    }

}
