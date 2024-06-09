struct CategoryTypeFilterModel: Decodable {

    let value: String

    enum CodingKeys: String, CodingKey {
        case value = "strCategory"
    }

}
