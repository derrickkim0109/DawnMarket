//
//  FlowRouter.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/21/23.
//

import Foundation
import SwiftUI

protocol FlowRouter: Hashable {
    associatedtype PushRoute: Hashable
    associatedtype NextScreen: View

    var id: UUID { get }

    var navigationPath: NavigationCoordinator { get set }
    var nextTransitionRoute: PushRoute { get }

    func triggerScreenTransition(route: PushRoute)
    func nextTransitionScreen() -> NextScreen
    func dismiss() 
}

extension FlowRouter {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
