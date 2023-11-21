//
//  CategoryView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var router: CategoryRouter
    @StateObject private var viewModel: CategoryViewModel

    init(categoryDIContainer: CategoryDIContainerInterface) {
        let router = categoryDIContainer.categoryRouter()

        self._router = .init(wrappedValue: router)
        self._viewModel = .init(wrappedValue: categoryDIContainer.categoryViewDependencies(categoryRouter: router))
    }

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    CategoryHeaderView()
                        .environmentObject(viewModel)

                    Spacer()

                    if !viewModel.isEmptyFetchedAppDisplayClassList() {
                        AppDisplayClassListView()
                            .environmentObject(viewModel)
                            .padding(.bottom, 40)

                        Color.dividerViewBackgroundColor
                            .frame(height: 8)

                        Spacer()
                    }

                    if !viewModel.isEmptyFetchedAppMainQuickMenuList() {
                        AppMainQuickMenuListView()
                            .environmentObject(viewModel)
                            .padding(.top, 10)

                        Spacer()
                    }
                }
                .onAppear {
                    viewModel.viewWillAppear()
                }
                .showErrorAlert(
                    isPresented: $viewModel.showErrorAlert,
                    message: viewModel.viewModelError
                )
                .padding(.bottom, 55)

                Spacer()
                    .toast(isPresented: $viewModel.showToast, duration: 2) {
                        Text("개발 예정")
                    }
            }
        }
    }
}
