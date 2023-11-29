//
//  AppMainQuickMenuListView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct AppMainQuickMenuListView: View {
    @ObservedObject var viewModel: CategoryViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            appMainQuickMenuHeaderView()

            LazyVGrid(columns: getGridItemSize()) {
                ForEach(viewModel.fetchedAppMainQuickMenuList) { item in
                    AppMainQuickMenuCellView(
                        viewModel: viewModel,
                        item: item
                    )
                    .padding([.top, .bottom], 5)
                }
            }
        }
        .padding([.leading, .trailing], 16)
    }
}

extension AppMainQuickMenuListView {
    private func appMainQuickMenuHeaderView() -> some View {
        Text("기획전 / 이벤트")
            .font(.pretendard(size: 13, type: .bold))
            .foregroundStyle(Color.black900)
    }

    private func getGridItemSize() -> [GridItem] {
        let gridItems: [GridItem] = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]

        return gridItems
    }
}

#Preview {
    let container = CategoryDIContainer()
    let viewModel = container.categoryViewDependencies(categoryRouter: container.categoryRouter())
    viewModel.viewWillAppear()

    return AppMainQuickMenuListView(viewModel: viewModel)
}
