//
//  NavigationCoordinator.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/28/23.
//

import SwiftUI

final class NavigationCoordinator: ObservableObject {
    @Published private var stack: [AnyView] = []

    func append<T: View>(_ view: T) {
        objectWillChange.send()
        stack.append(AnyView(view))
    }

    func remove() {
        objectWillChange.send()
        _ = stack.popLast()
    }

    func reset() {
        objectWillChange.send()
        stack = []
    }
}
