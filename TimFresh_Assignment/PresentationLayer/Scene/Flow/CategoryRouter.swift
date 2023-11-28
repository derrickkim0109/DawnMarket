//
//  CategoryRouter.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import Foundation
import SwiftUI

final class CategoryRouter: ObservableObject, FlowRouter {
    let id = UUID()

    init(categoryDIContainer: CategoryDIContainerInterface) {
        self.categoryDIContainer = categoryDIContainer
    }

    @Published var navigationPath: NavigationPath = .init()

    var nextTransitionRoute: PushRoute?

    private let categoryDIContainer: CategoryDIContainerInterface

    func triggerScreenTransition(route: PushRoute) {
        navigationPath.append(route)
        nextTransitionRoute = route
    }

    func nextTransitionScreen() -> some View {
        nextTransitionRoute?.nextView(
            categoryDIContainer: categoryDIContainer,
            router: self
        )
    }
}

extension CategoryRouter {
    enum PushRoute: Hashable {
        case unknown
        case categoryDetail(AppDisplayClassInfoFetchItemModel)

        func nextView(
            categoryDIContainer: CategoryDIContainerInterface,
            router: CategoryRouter
        ) -> some View {
            switch self {
            case .categoryDetail(let item):
                return CategoryDetailView(
                    viewModel: categoryDIContainer.categoryDetailViewDependencies(
                        categoryRouter: router,
                        displayClassItem: item
                    )
                )

            case .unknown:
                fatalError("no set next transition screen.")
            }
        }
    }
}
