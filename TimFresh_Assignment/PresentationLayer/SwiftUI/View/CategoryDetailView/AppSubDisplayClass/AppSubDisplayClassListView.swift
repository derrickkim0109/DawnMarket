//
//  AppSubDisplayClassListView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI

struct AppSubDisplayClassListView: View {
    @EnvironmentObject var viewModel: CategoryDetailViewModel

    var body: some View {
        VStack(spacing: 0) {
            LazyVGrid(columns: getGridItemSize(), spacing: 0) {
                ForEach(viewModel.fetchedAppSubDisplayClassInfoList) { item in
                    AppSubDisplayClassCellView(item: item)
                        .environmentObject(viewModel)
                        .onTapGesture {
                            viewModel.didSelectSubCategory(item)
                        }
                }
            }
            .onAppear {
                viewModel.fetchAppDisplayBySubClass()
            }

            Divider()
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.gray100)
        }
    }

    private func getGridItemSize() -> [GridItem] {
        let gridItems: [GridItem] = [
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0)
        ]
        return gridItems
    }
}
