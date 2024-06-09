import SwiftUI

struct SearchCocktailsView: View {
    
    private let cellHeight: CGFloat = 75
    private let defaultPadding: CGFloat = 2

    @EnvironmentObject private var router: AppRouter

    @ObservedObject private var viewModel: SearchCocktailsViewModel
    
    init(viewModel: SearchCocktailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.searchItems) { item in
                SearchCocktailCardView(model: item)
                    .frame(maxWidth: .infinity)
                    .contentShape(.rect)
                    .frame(height: cellHeight)
                    .onTapGesture {
                        router.push(to: .details(model: item))
                    }
            }
            .listRowSeparator(.hidden, edges: .all)
        }
        .listStyle(.plain)
        .listRowSpacing(.zero)
        .navigationTitle(BundleLocalizables.searchTitle.rawValue)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    Task {
                        guard let randomItem = try await viewModel.fetchRandomItem() else { return }
                        router.push(to: .details(model: randomItem))
                    }
                }, label: {
                    Text(BundleLocalizables.feelingLucky.rawValue)
                        .font(.system(size: defaultPadding * 7, weight: .medium))
                        .foregroundStyle(Color.white)
                        .padding(defaultPadding * 2)
                        .background(Color.blue)
                        .clipShape(.rect(cornerRadius: defaultPadding))
                })
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    router.push(to: .filter)
                }, label: {
                    Image(systemName: BundleImage.filter.rawValue)
                })
                .tint(.blue)
            }
        }
        .searchable(text: $viewModel.filter)
        .onChange(of: viewModel.filter) { _, newValue in
            Task {
                try await viewModel.queryItems(with: newValue)
            }
        }
    }

}
