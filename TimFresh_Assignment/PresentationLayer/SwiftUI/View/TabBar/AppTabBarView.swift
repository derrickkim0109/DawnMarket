//
//  AppTabBarView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var tabSelection: TabBarItemType = .category
    var compositionRoot: CompositionRootInterface

    var body: some View {
        NavigationView {
            TabBarContainerView(selection: $tabSelection) {
                CategoryView(categoryDIContainer: compositionRoot.categoryDIContainer)
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
