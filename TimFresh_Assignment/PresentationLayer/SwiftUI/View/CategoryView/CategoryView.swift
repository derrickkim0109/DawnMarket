//
//  CategoryView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import SwiftUI

struct CategoryView: View {
    @StateObject var viewModel: CategoryViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        CategoryHeaderView(viewModel: viewModel)

                        Spacer()

                        if !viewModel.isEmptyFetchedAppDisplayClassList() {
                            AppDisplayClassListView(viewModel: viewModel)
                                .padding(.bottom, 40)

                            Color.dividerViewBackgroundColor
                                .frame(height: 8)

                            Spacer()
                        }

                        if !viewModel.isEmptyFetchedAppMainQuickMenuList() {
                            AppMainQuickMenuListView(viewModel: viewModel)
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
                }
                .padding(.bottom, 55)
                
                Spacer()
                    .toast(isPresented: $viewModel.showToast, duration: 2) {
                        Text("개발 예정")
                    }
            }
        }
    }
}
