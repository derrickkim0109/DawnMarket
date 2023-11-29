//
//  AppSubDisplayClassListView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI

struct AppSubDisplayClassListView: View {
    @ObservedObject var viewModel: CategoryDetailViewModel

    var body: some View {
        VStack(spacing: 0) {
            LazyVGrid(columns: getGridItemSize(), spacing: 0) {
                ForEach(viewModel.fetchedAppSubDisplayClassInfoList) { item in
                    AppSubDisplayClassCellView(
                        viewModel: viewModel,
                        item: item
                    )
                    .onTapGesture {
                        viewModel.didSelectSubCategory(item)
                    }
                }
            }
            .onAppear {
                viewModel.loadAppDisplayBySubClass()
            }

            Divider()
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.gray100)
        }
    }
}

extension AppSubDisplayClassListView {
    private func getGridItemSize() -> [GridItem] {
        let gridItems: [GridItem] = [
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0)
        ]
        return gridItems
    }
}
