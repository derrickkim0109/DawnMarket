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

    init(
        router: CategoryRouter,
        viewModel: CategoryViewModel
    ) {
        self._router = .init(wrappedValue: router)
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(spacing: 20) {
                        CategoryHeaderView()
                            .environmentObject(viewModel)

                        if !viewModel.isEmptyFetchedAppDisplayClassList() {
                            AppDisplayClassListView()
                                .environmentObject(viewModel)
                                .padding(.bottom, 42)

                            Color.gray200
                                .frame(height: 8)
                        }
                    }

                    if !viewModel.isEmptyFetchedAppMainQuickMenuList() {
                        AppMainQuickMenuListView()
                            .environmentObject(viewModel)
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
