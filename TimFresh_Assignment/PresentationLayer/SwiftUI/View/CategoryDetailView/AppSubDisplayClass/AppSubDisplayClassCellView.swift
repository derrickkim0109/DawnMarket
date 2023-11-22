//
//  AppSubDisplayClassCellView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI

struct AppSubDisplayClassCellView: View {
    @EnvironmentObject var viewModel: CategoryDetailViewModel
    let item: AppSubDisplayClassInfoFetchItemModel

    var body: some View {
        VStack(spacing: 0) {
            Divider()

            HStack(spacing: 0) {
                Divider()
                    .frame(width: 1)

                HStack {
                    Text("\(item.subDisplayClassName)")
                        .font(.pretendard(size: 14, type: .regular))
                        .foregroundStyle(
                            viewModel.selectedSubCategory != item ? .unSelectedCategoryText : .selectedCategoryText)
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
            
            Divider()
        }
    }
}
