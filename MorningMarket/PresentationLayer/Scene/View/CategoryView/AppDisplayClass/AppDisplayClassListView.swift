//
//  AppDisplayClassListView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct AppDisplayClassListView: View {
    @ObservedObject private var viewModel: CategoryViewModel

    init(viewModel: CategoryViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        LazyVGrid(columns: getGridItemSize(), spacing: 16) {
            ForEach(viewModel.fetchedAppDisplayClassList) { item in
                AppDisplayClassCellView(
                    viewModel: viewModel,
                    item: item
                )
            }
        }
    }
}

extension AppDisplayClassListView {
    private func getGridItemSize() -> [GridItem] {
        let gridItems: [GridItem] = [
          GridItem(.flexible(), spacing: 13),
          GridItem(.flexible(), spacing: 13),
          GridItem(.flexible(), spacing: 13),
          GridItem(.flexible(), spacing: 13)
        ]

        return gridItems
    }
}

#Preview {
    let container = CategoryDIContainer()
    let viewModel = container.categoryViewDependencies(categoryRouter: container.categoryRouter())
    viewModel.viewWillAppear()
    
    return AppDisplayClassListView(viewModel: viewModel)
}
