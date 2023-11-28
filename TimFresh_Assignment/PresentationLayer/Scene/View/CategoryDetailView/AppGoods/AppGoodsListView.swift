//
//  AppGoodsListView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI
import Combine

struct AppGoodsListView: View {
    @EnvironmentObject var viewModel: CategoryDetailViewModel
    @State private var isLoading: Bool = false
    @State private var cancellable = Set<AnyCancellable>()

    var body: some View {
        LazyVGrid(columns: getGridItemSize(), spacing: 0, pinnedViews: [.sectionHeaders]) {
            Section(header: appGoodsListHeaderView()) {
                ForEach(viewModel.fetchedAppGoodsInfoList) { item in
                    AppGoodsCellView(item: item)
                        .environmentObject(viewModel)
                        .onTapGesture {
                            viewModel.showToastByDebounce("개발 예정")
                        }
                }
            }

            if viewModel.hasNext() {
                bottomProgressView()
                bottomProgressView()
                    .onAppear {
                        viewModel.loadAppGoodsInfo()
                    }
            }
        }
    }
}

extension AppGoodsListView {
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
        .frame(height: isLoading ? 0 : 10)
        .onAppear {
            Timer.publish(every: 3, on: .main, in: .common)
                .autoconnect()
                .receive(on: DispatchQueue.main)
                .sink { _ in
                    withAnimation {
                        isLoading = true
                    }
                }.store(in: &cancellable)
        }
        .hiddenConditionally(isHidden: isLoading)
    }
}
