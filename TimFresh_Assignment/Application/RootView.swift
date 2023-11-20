//
//  RootView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/17/23.
//

import SwiftUI

@main
struct RootView: App {
    private let appDIContainer: AppDIContainerInterface = AppDIContainer()

    var body: some Scene {
        WindowGroup {
            AppTabBarView(appContainer: appDIContainer)
        }
    }
}
