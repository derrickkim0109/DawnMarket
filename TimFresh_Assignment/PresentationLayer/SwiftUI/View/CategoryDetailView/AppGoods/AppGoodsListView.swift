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
            Section(header: AppGoodsListHeaderView()) {
                ForEach(viewModel.fetchedAppGoodsInfoList) { item in
                    AppGoodsCellView(item: item)
                        .environmentObject(viewModel)
                        .onTapGesture {

                        }
                        .onAppear {
                           
                        }
                }
                .padding([.leading, .trailing], 16)
            }
        }
    }

    private func getGridItemSize() -> [GridItem] {
        let gridItems: [GridItem] = [
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
        ]
        return gridItems
    }

    @ViewBuilder
    private func AppGoodsListHeaderView() -> some View {
        AppGoodsListStickyHeaderView()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Rectangle()
                    .foregroundColor(.white)
            )
            .environmentObject(viewModel)
    }
}
