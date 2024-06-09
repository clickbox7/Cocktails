struct GlassTypeFilterModel: Decodable {

    let value: String

    enum CodingKeys: String, CodingKey {
        case value = "strGlass"
    }

}
