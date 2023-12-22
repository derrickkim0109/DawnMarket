//
//  AppTabBarView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var tabSelection: TabBarItemType = .category
    private var categoryDIContainer: CategoryDIContainerInterface

    init(categoryDIContainer: CategoryDIContainerInterface) {
        self.categoryDIContainer = categoryDIContainer
    }

    var body: some View {
        NavigationView {
            TabBarContainerView(selection: $tabSelection) {
                CategoryView(
                    viewModel: categoryDIContainer.categoryViewDependencies(
                        categoryRouter: categoryDIContainer.categoryRouter()
                    )
                )
                .tabBarItem(tab: .category, selection: $tabSelection)
                
                Color.clear
                    .tabBarItem(tab: .favorites, selection: $tabSelection)
                
                Color.clear
                    .tabBarItem(tab: .home, selection: $tabSelection)
                
                Color.clear
                    .tabBarItem(tab: .cart, selection: $tabSelection)
                
                Color.clear
                    .tabBarItem(tab: .myPage, selection: $tabSelection)
            }
        }
    }
}
