//
//  AppMainQuickMenuListView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct AppMainQuickMenuListView: View {
    @EnvironmentObject var viewModel: CategoryViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("기획전 / 이벤트")
                .font(
                    .pretendard(
                        size: 13,
                        type: .bold
                    )
                )
                .padding(.leading, 20)

            LazyVGrid(columns: getGridItemSize()) {
                ForEach(viewModel.fetchedAppMainQuickMenuList) { item in
                    AppMainQuickMenuCellView(item: item)
                        .environmentObject(viewModel)
                }
            }
        }
    }

    private func getGridItemSize() -> [GridItem] {
        let fourDividedWidth = (UIScreen.main.bounds.width - 50) / 5

        let gridItems: [GridItem] = [
            GridItem(.fixed(fourDividedWidth)),
            GridItem(.fixed(fourDividedWidth)),
            GridItem(.fixed(fourDividedWidth)),
            GridItem(.fixed(fourDividedWidth)),
            GridItem(.fixed(fourDividedWidth))
        ]

        return gridItems
    }
}
