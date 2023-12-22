//
//  AppDisplayClassCellView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Kingfisher

struct AppDisplayClassCellView: View {
    @ObservedObject private var viewModel: CategoryViewModel
    private let item: AppDisplayClassInfoFetchItemModel

    init(
        viewModel: CategoryViewModel,
        item: AppDisplayClassInfoFetchItemModel
    ) {
        self.viewModel = viewModel
        self.item = item
    }

    var body: some View {
        NavigationLink {
            viewModel.nextScreen(item)
                .onDisappear {
                    viewModel.dismiss()
                }
        } label: {
            appDisplayClassCellInfoView()
        }
    }
}

extension AppDisplayClassCellView {
    private func appDisplayClassCellInfoView() -> some View {
        VStack(alignment: .center, spacing: 0) {
            appDisplayClassImageView()

            Text(item.displayClassName)
                .font(.pretendard( size: 12, type: .medium))
                .foregroundStyle(Color.gray900)
        }
    }

    private func appDisplayClassImageView() -> some View {
        KFImage(item.makeImageURL())
            .placeholder {
                ProgressView()
            }
            .retry(maxCount: 3, interval: .seconds(5))
            .onFailure({ error in
                viewModel.setupFetchError(error.errorDescription ?? "")
            })
            .resizable()
            .frame(width: 72, height: 70)
            .showErrorAlert(
                isPresented: $viewModel.showErrorAlert,
                message: viewModel.viewModelError
            )
    }
}

#Preview {
    let container = CategoryDIContainer()
    let viewModel = container.categoryViewDependencies(categoryRouter: container.categoryRouter())
    viewModel.viewWillAppear()

    return AppDisplayClassCellView(viewModel: viewModel, item: .completedMock)
}
