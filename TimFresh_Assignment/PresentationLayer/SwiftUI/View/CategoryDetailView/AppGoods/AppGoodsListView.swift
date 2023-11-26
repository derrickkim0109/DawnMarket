//
//  AppGoodsListView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI

struct AppGoodsListView: View {
    @EnvironmentObject var viewModel: CategoryDetailViewModel

    var body: some View {
        LazyVGrid(columns: getGridItemSize(), spacing: 0, pinnedViews: [.sectionHeaders]) {
            Section(header: appGoodsListHeaderView()) {
                ForEach(viewModel.fetchedAppGoodsInfoList) { item in
                    AppGoodsCellView(item: item)
                        .environmentObject(viewModel)
                        .onTapGesture {
                            viewModel.showToastByDebounce()
                        }
                }
            }

            if viewModel.hasNext() {
                bottomProgressView()
                bottomProgressView()
                    .onAppear {
                        viewModel.fetchAppGoodsInfo()
                    }
            }
        }
    }

    private func getGridItemSize() -> [GridItem] {
        let gridItems: [GridItem] = [
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0)
        ]
        return gridItems
    }

    private func appGoodsListHeaderView() -> some View {
        AppGoodsListStickyHeaderView()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Rectangle()
                    .foregroundColor(.white)
            )
            .environmentObject(viewModel)
    }

    private func bottomProgressView() -> some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}
