//
//  CategoryDetailView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct CategoryDetailView: View {
    @StateObject var viewModel: CategoryDetailViewModel
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: CategoryDetailViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        setupNavigationBar()
    }

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 6) {
                    AppSubDisplayClassListView(viewModel: viewModel)

                    AppGoodsListView(viewModel: viewModel)
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
        .onAppear {
            viewModel.viewWillAppear()
        }
    }
}

extension CategoryDetailView {
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        appearance.shadowColor = .clear

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
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

#Preview {
    let container = CategoryDIContainer()

    return CategoryDetailView(viewModel: container.categoryDetailViewDependencies(categoryRouter: container.categoryRouter(), displayClassItem: AppDisplayClassInfoFetchItemModel.completedMock))
}
