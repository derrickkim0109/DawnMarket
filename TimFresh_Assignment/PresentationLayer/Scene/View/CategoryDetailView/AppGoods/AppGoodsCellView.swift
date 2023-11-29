//
//  AppGoodsCellView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import SwiftUI
import Kingfisher

struct AppGoodsCellView: View {
    @ObservedObject var viewModel: CategoryDetailViewModel
    let item: AppGoodsInfoFetchItemModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            appGoodsImageView()

            appGoodsInfoView()
                .frame(width: 156)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 26)
    }
}

extension AppGoodsCellView {
    private func appGoodsImageView() -> some View {
        KFImage(item.makeImageURL())
            .placeholder {
                ProgressView()
            }
            .retry(maxCount: 3, interval: .seconds(5))
            .onFailure({ error in
                viewModel.setupFetchError(error.errorDescription ?? "")
            })
            .resizable()
            .frame(width: 156, height: 156)
            .showErrorAlert(
                isPresented: $viewModel.showErrorAlert,
                message: viewModel.viewModelError
            )
            .overlay(alignment: .bottomTrailing) {
                iconCartButton()
                    .offset(x: -10, y: -10)
            }
    }

    private func iconCartButton() -> some View {
        Button {
            viewModel.showToastByDebounce(
                "\(item.getGoodsName())이 장바구니에 담겼습니다."
            )
        } label: {
            Image.iconCartFillImage
                .colorMultiply(Color.blue900)
                .frame(width: 16, height: 16)
                .background(
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.white)
                )
        }
        .frame(width: 32, height: 32)
    }

    private func appGoodsInfoView() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(item.getGoodsName())")
                    .font(.pretendard(size: 15, type: .regular))
                    .foregroundStyle(Color.black700)

                Spacer()
            }

            if item.isDiscounted() {
                salePriceView()
            }

            discountPriceView()

            appGoodsOptionView()
        }
        .frame(maxWidth: .infinity)
    }

    /// 판매 가격
    private func salePriceView() -> some View {
        HStack(spacing: 0) {
            Text("\(item.salePrice)")
                .font(.pretendard(size: 13, type: .medium))
                .foregroundStyle(Color.gray400)
                .overlay(alignment: .center) {
                    Divider()
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .background(.gray)
                }

            Text("원")
                .font(.pretendard(size: 13, type: .regular))
        }
    }

    /// 할인된 가격
    private func discountPriceView() -> some View {
        HStack(spacing: 2) {
            if item.isDiscounted() {
                Text("\(item.getDiscountRatio())%")
                    .font(.pretendard(size: 16, type: .bold))
                    .foregroundStyle(Color.red900)
            }

            HStack(spacing: 0) {
                Text("\(item.discountPrice)")
                    .font(.pretendard(size: 16, type: .bold))
                    .foregroundStyle(Color.black900)

                Text("원")
                    .font(.pretendard(size: 16, type: .regular))
                    .foregroundStyle(Color.black900)
            }
            Spacer()
        }
    }

    private func appGoodsOptionView() -> some View {
        HStack(spacing: 8) {
            Text("옵션")
                .font(.pretendard(size: 12, type: .medium))
                .foregroundStyle(Color.gray700)
                .background(
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundStyle(Color.gray200)
                        .frame(width: 29, height: 20)
                )

            Text("\(item.getGoodsOptionName())")
                .font(.pretendard(size: 12, type: .medium))
                .foregroundStyle(Color.black700)
        }
    }
}

#Preview {
    let container = CategoryDIContainer()
    let viewModel = container.categoryDetailViewDependencies(categoryRouter: container.categoryRouter(), displayClassItem: .completedMock)
    viewModel.viewWillAppear()

    return AppGoodsCellView(viewModel: viewModel, item: .completedMock)
}
