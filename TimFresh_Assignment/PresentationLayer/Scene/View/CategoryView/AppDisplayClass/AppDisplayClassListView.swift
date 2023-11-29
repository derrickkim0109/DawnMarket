//
//  AppDisplayClassListView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct AppDisplayClassListView: View {
    @ObservedObject var viewModel: CategoryViewModel

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
