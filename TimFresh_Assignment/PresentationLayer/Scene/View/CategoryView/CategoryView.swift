//
//  CategoryView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var viewModel: CategoryViewModel

    init(viewModel: CategoryViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(spacing: 20) {
                        CategoryHeaderView(viewModel: viewModel)

                        if !viewModel.isEmptyFetchedAppDisplayClassList() {
                            
                            AppDisplayClassListView(viewModel: viewModel)
                                .padding(.bottom, 42)

                            Color.gray200
                                .frame(height: 8)
                        }
                    }

                    if !viewModel.isEmptyFetchedAppMainQuickMenuList() {
                        AppMainQuickMenuListView(viewModel: viewModel)
                            .padding(.top, 20)

                        Spacer()
                    }
                }
                .padding(.bottom, 55)
                .onAppear {
                    viewModel.viewWillAppear()
                }
            }
            VStack {
                Spacer()
                    .toast(isPresented: $viewModel.showToast, duration: 1) {
                        Text("개발 예정")
                    }
            }
        }
        .showErrorAlert(
            isPresented: $viewModel.showErrorAlert,
            message: viewModel.viewModelError
        )
    }
}

#Preview {
    let container = CategoryDIContainer()
    let viewModel = container.categoryViewDependencies(categoryRouter: container.categoryRouter())

    return CategoryView(viewModel: viewModel)
}
