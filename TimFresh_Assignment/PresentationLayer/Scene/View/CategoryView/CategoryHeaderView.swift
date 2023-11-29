//
//  CategoryHeaderView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Combine

struct CategoryHeaderView: View {
    @ObservedObject var viewModel: CategoryViewModel

    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)

            headerTitleView()

            Spacer()

            HStack(spacing: 16) {
                navigationTrailingBellImageView()
                navigationTrailingSettingImageView()
            }
            .frame(height: 24)

            Spacer()
                .frame(width: 16)
        }
    }
}

extension CategoryHeaderView {
    private func headerTitleView() -> some View {
        Text("로그인해주세요")
            .font(.pretendard(size: 17, type: .bold))
            .foregroundStyle(Color.black900)
    }

    private func navigationTrailingBellImageView() -> some View {
        Image.iconBellImage
            .resizable()
            .colorMultiply(.gray600)
            .frame(width: 24)
            .overlay {
                Image.iconNewBadgeImage
                    .resizable()
                    .frame(width: 16, height: 16)
                    .offset(x: 7, y: -5)
            }
            .onTapGesture {
                viewModel.showToastByDebounce()
            }
    }

    private func navigationTrailingSettingImageView() -> some View {
        Image.iconSettingImage
            .resizable()
            .colorMultiply(.gray600)
            .frame(width: 24)
            .onTapGesture {
                viewModel.showToastByDebounce()
            }
    }
}
