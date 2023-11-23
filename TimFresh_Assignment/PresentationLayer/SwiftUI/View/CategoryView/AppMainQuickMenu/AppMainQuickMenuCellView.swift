//
//  AppMainQuickMenuCellView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Kingfisher

struct AppMainQuickMenuCellView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: CategoryViewModel

    let item: AppMainQuickMenuFetchItemModel

    var body: some View {
        AppMainQuickMenuInfoView()
            .onTapGesture {
                viewModel.showToastByDebounce()
            }
    }

    @ViewBuilder
    private func AppMainQuickMenuInfoView() -> some View {
        VStack(alignment: .center, spacing: 0) {
            AppMainQuickMenuImageView()

            Spacer()

            AppMainQuickMenuTitleView()
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }

    @ViewBuilder
    private func AppMainQuickMenuImageView() -> some View {
        KFImage(item.makeImageURL())
            .placeholder {
                ProgressView()
            }
            .retry(maxCount: 3, interval: .seconds(5))
            .resizable()
            .frame(height: 52)
    }

    @ViewBuilder
    private func AppMainQuickMenuTitleView() -> some View {
        Text(item.quickMenuName)
            .font(.pretendard(size: 12, type: .medium))
            .foregroundStyle(Color.black700)
    }
}
