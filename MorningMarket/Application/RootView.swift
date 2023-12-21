//
//  RootView.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/17/23.
//

import SwiftUI

@main
struct RootView: App {
    @StateObject var launchScreenState = LaunchScreenStateManager()
    let categoryDIContainer: CategoryDIContainerInterface

    init() {
        self.categoryDIContainer = CategoryDIContainer()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                AppTabBarView(categoryDIContainer: categoryDIContainer)

                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
