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
        LazyVGrid(columns: getGridItemSize(), spacing: 16) {
            ForEach(viewModel.fetchedAppDisplayClassList) { item in
                AppDisplayClassCellView(item: item)
                    .environmentObject(viewModel)
            }
        }
    }

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
