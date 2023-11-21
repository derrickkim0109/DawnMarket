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
        appMainQuickMenuInfoView()
            .onTapGesture {
                viewModel.showToastByDebounce()
            }
    }

    private func appMainQuickMenuInfoView() -> some View {
        VStack(alignment: .center, spacing: 0) {
            KFImage(item.makeImageURL())
                .placeholder {
                    ProgressView()
                }
                .retry(maxCount: 3, interval: .seconds(5))
                .resizable()
                .frame(width: 52, height: 52)

            Spacer()

            Text(item.quickMenuName)
                .font(
                    .pretendard(
                        size: 12,
                        type: .medium
                    )
                )
                .foregroundStyle(Color.appDisplayClassTextColor)

            Spacer()
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    AppMainQuickMenuCellView(item: AppMainQuickMenuFetchItemModel.completedMock)
}
