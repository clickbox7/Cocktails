import Foundation

struct FilterDataModel: Equatable, Identifiable {

    let id: String = UUID().uuidString
    let value: String
    let type: FilterType

}

extension FilterDataModel {

    init(from model: AlcoholicTypeFilterModel) {
        value = model.value
        type = .alcoholicType
    }

    init(from model: CategoryTypeFilterModel) {
        value = model.value
        type = .category
    }

    init(from model: GlassTypeFilterModel) {
        value = model.value
        type = .glassType
    }

}
