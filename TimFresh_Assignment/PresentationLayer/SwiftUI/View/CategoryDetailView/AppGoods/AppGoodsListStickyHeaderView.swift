//
//  AppGoodsListStickyHeaderView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI

struct AppGoodsListStickyHeaderView: View {
    @EnvironmentObject var viewModel: CategoryDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Text("\(viewModel.fetchedAppGoodsInfoList.count)")
                    .font(.pretendard(size: 13, type: .extraBold))
                    .foregroundStyle(Color.black900)

                Text("건의 검색결과")
                    .font(.pretendard(size: 13, type: .regular))
                    .foregroundStyle(Color.black800)
            }
            .padding(.leading, 16)

            Divider()
                .frame(maxWidth: .infinity)

            LazyHStack(alignment: .firstTextBaseline) {
                ForEach(SearchValueType.allCases, id: \.rawValue) { item in
                    HStack(spacing: 2) {
                        Text("•")
                            .foregroundStyle(viewModel.selectedSearchValue != item ? Color.gray400 : Color.blue800)

                        Text("\(item.rawValue)")
                            .font(.pretendard(size: 13, type: .regular))
                            .foregroundStyle(viewModel.selectedSearchValue != item ? Color.gray600 : Color.black900)
                    }
                    .onTapGesture {
                        viewModel.didSelectSearchValue(item)
                    }
                    .onAppear {
                        viewModel.fetchAppGoodsInfo()
                    }
                }
            }
            .padding(.leading, 16)
        }
        .padding([.top, .bottom], 18)
    }
}
