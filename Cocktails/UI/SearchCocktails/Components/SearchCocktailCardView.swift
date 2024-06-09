import SwiftUI
import Kingfisher

struct SearchCocktailCardView: View {

    private let imageSize: CGFloat = 75
    private let cornerRadius: CGFloat = 16
    private let spacing: CGFloat = 8

    private let model: CocktailDataModel

    init(model: CocktailDataModel) {
        self.model = model
    }

    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            KFImage(model.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(cornerRadius / 2)

            VStack(alignment: .leading, spacing: .zero) {
                Text(model.name)
                    .font(.system(.headline, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(model.ingredients)
                    .font(.system(.subheadline, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

}
