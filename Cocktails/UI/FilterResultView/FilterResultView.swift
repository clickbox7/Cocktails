import SwiftUI

struct FilterResultView: View {

    private let cellHeight: CGFloat = 75

    @EnvironmentObject private var coordinator: AppRouter

    @ObservedObject private var viewModel: FilterResultViewModel

    init(viewModel: FilterResultViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            ForEach(viewModel.presentableItems) { item in
                SearchCocktailCardView(model: item)
                    .frame(maxWidth: .infinity)
                    .contentShape(.rect)
                    .frame(height: cellHeight)
                    .onTapGesture {
                        coordinator.push(to: .details(model: item))
                    }
            }
            .listRowSeparator(.hidden, edges: .all)
        }
        .listStyle(.plain)
        .listRowSpacing(.zero)
        .navigationTitle("\(BundleLocalizables.totalResults.rawValue): \(viewModel.presentableItems.count)")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    coordinator.pop()
                }) {
                    Image(systemName: BundleImage.back.rawValue)
                }
            }
        }
        .onDisappear(perform: viewModel.cancelFetchingTask)
    }

}
