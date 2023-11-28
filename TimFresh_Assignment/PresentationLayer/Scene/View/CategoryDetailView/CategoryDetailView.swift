//
//  CategoryDetailView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct CategoryDetailView: View {
    @StateObject var viewModel: CategoryDetailViewModel
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: CategoryDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 6) {
                    AppSubDisplayClassListView()
                        .environmentObject(viewModel)

                    AppGoodsListView()
                        .environmentObject(viewModel)
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                navigationLeadingView()
                navigationTitleView()
                navigationTrailingView()
            }
            .showErrorAlert(
                isPresented: $viewModel.showErrorAlert,
                message: viewModel.viewModelError
            )

            VStack {
                Spacer()
                    .toast(isPresented: $viewModel.showToast, duration: 2) {
                        Text(viewModel.toastMessage)
                    }
                    .offset(y: 40)
            }
        }
    }
}

extension CategoryDetailView {
    private func navigationLeadingView() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image.iconBackButtonImage
                    .frame(width: 24, height: 24)
            }
        }
    }

    private func navigationTitleView() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text("\(viewModel.getDisplayClassName())")
                .font(.pretendard(size: 15, type: .medium))
                .foregroundStyle(Color.black900)
        }
    }

    private func navigationTrailingView() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
                Button {
                    viewModel.showToastByDebounce("개발 예정")
                } label: {
                    Image.iconSearchImage
                        .resizable()
                        .colorMultiply(.gray600)
                        .frame(width: 24, height: 24)
                }

                Button {
                    viewModel.showToastByDebounce("개발 예정")
                } label: {
                    Image.iconCartImage
                        .resizable()
                        .colorMultiply(.gray600)
                        .frame(width: 24, height: 24)
                }
            }
        }
    }

}
