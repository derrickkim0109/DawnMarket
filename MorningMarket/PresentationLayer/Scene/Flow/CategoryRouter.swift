//
//  CategoryRouter.swift
//  MorningMarket
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

    @Published var navigationPath: NavigationCoordinator = .init()
    var nextTransitionRoute: PushRoute = .unknown

    private let categoryDIContainer: CategoryDIContainerInterface

    func triggerScreenTransition(route: PushRoute) {
        nextTransitionRoute = route
    }

    func nextTransitionScreen() -> some View {
        let view = nextTransitionRoute.nextView(
            categoryDIContainer: categoryDIContainer,
            router: self
        )
        navigationPath.append(view)
        return view
    }

    func dismiss() {
        navigationPath.remove()
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
