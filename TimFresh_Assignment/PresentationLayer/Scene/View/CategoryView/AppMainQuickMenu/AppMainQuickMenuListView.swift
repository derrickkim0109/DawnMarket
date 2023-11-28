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
        VStack(alignment: .leading, spacing: 8) {
            appMainQuickMenuHeaderView()

            LazyVGrid(columns: getGridItemSize()) {
                ForEach(viewModel.fetchedAppMainQuickMenuList) { item in
                    AppMainQuickMenuCellView(item: item)
                        .environmentObject(viewModel)
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
