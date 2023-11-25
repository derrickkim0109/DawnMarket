//
//  RootView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/17/23.
//

import SwiftUI

@main
struct RootView: App {
    @StateObject var launchScreenState = LaunchScreenStateManager()
    private let compositionRoot: CompositionRootInterface

    init() {
        self.compositionRoot = CompositionRoot()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                AppTabBarView(compositionRoot: compositionRoot)

                if launchScreenState.state != .finished {
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenState)
        }
    }
}
