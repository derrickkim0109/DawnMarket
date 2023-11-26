//
//  AppMainQuickMenuCellView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Kingfisher

struct AppMainQuickMenuCellView: View {
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
            appMainQuickMenuImageView()

            Spacer()

            appMainQuickMenuTitleView()
        }
    }

    private func appMainQuickMenuImageView() -> some View {
        KFImage(item.makeImageURL())
            .placeholder {
                ProgressView()
            }
            .retry(maxCount: 3, interval: .seconds(5))
            .onFailure({ error in
                viewModel.setupFetchError(error.errorDescription ?? "")
            })
            .resizable()
            .frame(height: 52)
            .showErrorAlert(
                isPresented: $viewModel.showErrorAlert,
                message: viewModel.viewModelError
            )
    }

    private func appMainQuickMenuTitleView() -> some View {
        Text(item.quickMenuName)
            .font(.pretendard(size: 12, type: .medium))
            .foregroundStyle(Color.black700)
    }
}
