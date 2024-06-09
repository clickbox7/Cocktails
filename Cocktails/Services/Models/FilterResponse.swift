struct FilterResponse<T: Decodable>: Decodable {

    let result: [T]

    enum CodingKeys: String, CodingKey {
        case result = "drinks"
    }

}
