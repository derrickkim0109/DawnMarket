//
//  AppMainQuickMenuCellView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Kingfisher

struct AppMainQuickMenuCellView: View {
    @ObservedObject private var viewModel: CategoryViewModel
    private let item: AppMainQuickMenuFetchItemModel

    init(viewModel: CategoryViewModel, item: AppMainQuickMenuFetchItemModel) {
        self.viewModel = viewModel
        self.item = item
    }

    var body: some View {
        appMainQuickMenuInfoView()
            .onTapGesture {
                viewModel.showToastByDebounce()
            }
    }
}

extension AppMainQuickMenuCellView {
    private func appMainQuickMenuInfoView() -> some View {
        VStack(spacing: 5) {
            appMainQuickMenuImageView()
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
            .frame(width: 52, height: 52)
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

#Preview {
    let container = CategoryDIContainer()
    let viewModel = container.categoryViewDependencies(categoryRouter: container.categoryRouter())

    return AppMainQuickMenuCellView(viewModel: viewModel, item: .completedMock)
}
