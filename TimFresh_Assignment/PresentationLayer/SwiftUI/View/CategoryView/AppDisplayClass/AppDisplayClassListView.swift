//
//  AppDisplayClassListView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct AppDisplayClassListView: View {
    @EnvironmentObject var viewModel: CategoryViewModel

    var body: some View {
        LazyVGrid(columns: getGridItemSize(), spacing: 10) {
            ForEach(viewModel.fetchedAppDisplayClassList) { item in
                AppDisplayClassCellView(item: item)
                    .environmentObject(viewModel)
            }
        }
    }

    private func getGridItemSize() -> [GridItem] {
        let fourDividedWidth = (UIScreen.main.bounds.width - 20) / 4

        let gridItems: [GridItem] = [
          GridItem(.fixed(fourDividedWidth)),
          GridItem(.fixed(fourDividedWidth)),
          GridItem(.fixed(fourDividedWidth)),
          GridItem(.fixed(fourDividedWidth))
        ]

        return gridItems
    }
}
