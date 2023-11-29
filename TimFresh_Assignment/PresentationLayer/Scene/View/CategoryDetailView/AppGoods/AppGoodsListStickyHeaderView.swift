//
//  AppGoodsListStickyHeaderView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI

struct AppGoodsListStickyHeaderView: View {
    @ObservedObject var viewModel: CategoryDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            headerTitleView()

            Divider()
                .foregroundStyle(Color.gray200)
                .frame(maxWidth: .infinity)

            allSearchCaseView()
        }
        .padding([.top, .bottom], 18)
    }
}

extension AppGoodsListStickyHeaderView {
    private func headerTitleView() -> some View {
        HStack(spacing: 0) {
            Text("\(viewModel.pagination?.totalElements ?? 0)")
                .font(.pretendard(size: 13, type: .bold))
                .foregroundStyle(Color.black900)

            Text("건의 검색결과")
                .font(.pretendard(size: 13, type: .regular))
                .foregroundStyle(Color.black800)
        }
        .padding(.leading, 16)
    }

    private func allSearchCaseView() -> some View {
        LazyHStack(alignment: .firstTextBaseline) {
            ForEach(SearchValueType.allCases, id: \.rawValue) { item in
                HStack(spacing: 2) {
                    Text("•")
                        .foregroundStyle(
                            viewModel.selectedSearchValue != item ? Color.gray300 : Color.blue700
                        )

                    Text("\(item.rawValue)")
                        .font(.pretendard(size: 13, type: .regular))
                        .foregroundStyle(
                            viewModel.selectedSearchValue != item ? Color.gray500 : Color.black900
                        )
                }
                .onTapGesture {
                    viewModel.didSelectSearchValue(item)
                }
            }
        }
        .padding(.leading, 16)
    }
}
