enum FilterType {

    case alcoholicType
    case category
    case glassType

    var query: String {
        switch self {
        case .alcoholicType:
            "a"
        case .category:
            "c"
        case .glassType:
            "g"
        }
    }

}
