//
//  AppDisplayClassCellView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI
import Kingfisher

struct AppDisplayClassCellView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: CategoryViewModel

    let item : AppDisplayClassInfoFetchItemModel

    var body: some View {
        NavigationLink {
            viewModel.nextScreen(item: item)
        } label: {
            AppDisplayClassCellInfoView()
        }
    }

    @ViewBuilder
    private func AppDisplayClassCellInfoView() -> some View {
        VStack(alignment: .center, spacing: 0) {
            AppDisplayClassImageView()

            Spacer()

            Text(item.displayClassName)
                .font(.pretendard( size: 12, type: .medium))
                .foregroundStyle(Color.gray900)

            Spacer()
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }

    @ViewBuilder
    private func AppDisplayClassImageView() -> some View {
        KFImage(item.makeImageURL())
            .placeholder {
                ProgressView()
            }
            .retry(maxCount: 3, interval: .seconds(5))
            .resizable()
            .frame(width: 72, height: 70)
    }
}
