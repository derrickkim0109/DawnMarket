//
//  RootView.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/17/23.
//

import SwiftUI

@main
struct RootView: App {
    let compositionRoot: CompositionRootInterface

    init() {
        self.compositionRoot = CompositionRoot()
    }

    var body: some Scene {
        WindowGroup {
            AppTabBarView(compositionRoot: compositionRoot)
        }
    }
}
