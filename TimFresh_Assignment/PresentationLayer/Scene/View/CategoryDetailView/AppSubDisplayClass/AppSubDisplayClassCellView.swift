//
//  AppSubDisplayClassCellView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI

struct AppSubDisplayClassCellView: View {
    @ObservedObject var viewModel: CategoryDetailViewModel
    let item: AppSubDisplayClassInfoFetchItemModel

    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .foregroundStyle(Color.gray100)

            HStack(spacing: 0) {
                Divider()
                    .foregroundStyle(Color.gray100)
                    .frame(width: 1)

                appSubDisplayClassTitleView()
            }
        }
    }
}

extension AppSubDisplayClassCellView {
    private func appSubDisplayClassTitleView() -> some View {
        HStack {
            Text("\(item.subDisplayClassName)")
                .font(.pretendard(size: 14, type: .regular))
                .foregroundStyle(
                    viewModel.selectedSubCategory != item ? Color.gray700 : Color.black900
                )
                .multilineTextAlignment(.leading)
                .frame(
                    minWidth: 120,
                    alignment: .leading
                )
        }
        .padding(10)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }
}
