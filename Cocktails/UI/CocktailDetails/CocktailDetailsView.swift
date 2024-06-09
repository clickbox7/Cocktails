import SwiftUI
import Kingfisher

struct CocktailDetailsView: View {

    private let defaultPadding: CGFloat = 8
    private let imageHeight: CGFloat = 250

    @EnvironmentObject private var router: AppRouter

    @ObservedObject private var viewModel: CocktailDetailsViewModel

    init(viewModel: CocktailDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: defaultPadding) {
                        KFImage(viewModel.cocktailDataModel.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width, height: imageHeight)
                            .contentShape(.rect)
                            .clipped()

                        Text(viewModel.cocktailDataModel.name)
                            .font(.system(.title, weight: .bold))
                            .padding(.horizontal, defaultPadding)

                        VStack(alignment: .leading, spacing: defaultPadding) {
                            infoView(for: viewModel.cocktailDataModel)

                            Text("\(BundleLocalizables.lastModified.rawValue): \(viewModel.cocktailDataModel.modifiedAt)")
                                .font(.system(.caption2, weight: .bold))
                                .padding(.horizontal, defaultPadding)
                        }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    router.pop()
                }) {
                    Image(systemName: BundleImage.back.rawValue)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }

    private func infoView(for model: CocktailDataModel) -> some View {
        Group {
            Text("\(BundleLocalizables.categoryTypeTitle.rawValue): \(model.category)")

            Text("\(BundleLocalizables.glassTypeTitle.rawValue): \(model.glassType)")

            Text("\(BundleLocalizables.alcoholicTypeTitle.rawValue): \(model.alcoholicType)")

            Text("\(BundleLocalizables.ingredients.rawValue): \(model.ingredients)")

            Text("\(BundleLocalizables.instructions.rawValue): \(model.instructions)")
        }
        .font(.system(.footnote, weight: .medium))
        .padding(.horizontal, defaultPadding)
    }

}
