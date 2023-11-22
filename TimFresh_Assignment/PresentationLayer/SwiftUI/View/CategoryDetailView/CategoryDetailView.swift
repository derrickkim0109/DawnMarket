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
                VStack(spacing: 24) {
                    AppSubDisplayClassListView()
                        .environmentObject(viewModel)

                    VStack(spacing: 18) {
                        CategoryDetailStickyHeaderView()
                            .environmentObject(viewModel)

                        AppGoodsListView()
                            .environmentObject(viewModel)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                navigationLeadingView()
                navigationTitleView()
                navigationTrailingView()
            }
            .onAppear {
                viewModel.viewWillAppear()
            }

            VStack {
                Spacer()
                    .toast(isPresented: $viewModel.showToast, duration: 1) {
                        Text("개발 예정")
                    }
            }
        }
    }

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
                .font(Font.pretendard(size: 15, type: .medium))
        }
    }

    private func navigationTrailingView() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack {
                Button {
                    viewModel.showToast = true
                } label: {
                    Image.iconSearchImage
                }

                Button {
                    viewModel.showToast = true
                } label: {
                    Image.iconCartImage
                }
            }
        }
    }
}
