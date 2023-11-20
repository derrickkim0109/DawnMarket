//
//  AppTabBarView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var tabSelection: TabBarItemType = .category
    var appContainer: AppDIContainerInterface

    var body: some View {
        TabBarContainerView(selection: $tabSelection) {
            CategoryView(viewModel: appContainer.categoryViewDependencies())
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

extension AppTabBarView {
    private var defaultTabView: some View {
        TabView(selection: $tabSelection) {
            Color.brandDarkNavyColor
                .tabItem {
                    Image.iconHamburgerImage
                    Text("카테고리")
                }

            Color.brandDarkNavyColor
                .tabItem {
                    Image.iconStarImage
                    Text("즐겨찾기")
                }

            Color.brandDarkNavyColor
                .tabItem {
                    Image.iconHomeImage
                    Text("홈")
                }

            Color.brandDarkNavyColor
                .tabItem {
                    Image.iconCartFillImage
                    Text("장바구니")
                }

            Color.brandDarkNavyColor
                .tabItem {
                    Image.iconPersonImage
                    Text("내 정보")
                }
        }
    }
}
