import SwiftUI

struct FilterView: View {

    private let defaultPadding: CGFloat = 2
    private let buttonHeight: CGFloat = 45

    private let impactFeedback = UIImpactFeedbackGenerator()

    @EnvironmentObject private var router: AppRouter

    @ObservedObject private var viewModel: FilterViewModel

    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack(spacing: defaultPadding * 4) {
                filterView(
                    title: viewModel.groupTitle(for: .alcoholicType) ?? BundleLocalizables.alcoholicTypeTitle.rawValue,
                    items: viewModel.alcoholicTypeFilters,
                    isExpanded: $viewModel.isAlcoholicTypeGroupExpanded)

                filterView(
                    title: viewModel.groupTitle(for: .category) ?? BundleLocalizables.categoryTypeTitle.rawValue,
                    items: viewModel.categoryTypeFilters,
                    isExpanded: $viewModel.isCategoryGroupExpanded)

                filterView(
                    title: viewModel.groupTitle(for: .glassType) ?? BundleLocalizables.glassTypeTitle.rawValue,
                    items: viewModel.glassTypeFilters,
                    isExpanded: $viewModel.isGlassTypeGroupExpanded)

                buttonView(title: BundleLocalizables.filter.rawValue) {
                    Task {
                        let itemIds = try await viewModel.filterData()
                        router.push(to: .filterResults(itemIds: itemIds))
                    }
                }
                .disabled(viewModel.selectedFilters.isEmpty)

                buttonView(title: BundleLocalizables.reset.rawValue) {
                    viewModel.resetFilters()
                }
                .disabled(viewModel.selectedFilters.isEmpty)
            }
            .padding(.horizontal, defaultPadding * 8)
        }
        .padding(.bottom, defaultPadding * 4)
        .navigationTitle(BundleLocalizables.filtersTitle.rawValue)
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
        .onDisappear {
            viewModel.collapseGroups()
        }
    }

    private func filterView(title: String, items: [FilterDataModel], isExpanded: Binding<Bool>) -> some View {
        GroupBox {
            DisclosureGroup(
                isExpanded: isExpanded,
                content: {
                    ForEach(items) { item in
                        Divider()
                            .padding(.vertical, defaultPadding)

                        HStack {
                            Text(item.value)

                            Spacer()
                        }
                        .contentShape(.rect)
                        .foregroundColor(.blue)
                        .font(.system(size: defaultPadding * 7, weight: .medium))
                        .onTapGesture {
                            viewModel.select(item)
                            impactFeedback.impactOccurred()
                        }
                    }
                },
                label: {
                    Text(title)
                        .font(.system(size: defaultPadding * 9, weight: .bold))
                }
            )
        }
        .tint(.blue)
    }

    private func buttonView(title: String, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .contentShape(.rect)
                .font(.system(size: defaultPadding * 8, weight: .regular))
                .foregroundStyle(Color.white)
                .padding(.horizontal, defaultPadding * 8)
                .frame(maxWidth: .infinity)
                .frame(height: buttonHeight)
                .background(viewModel.selectedFilters.isEmpty ? .gray : .blue)
                .cornerRadius(defaultPadding * 8)
        })
    }

}
