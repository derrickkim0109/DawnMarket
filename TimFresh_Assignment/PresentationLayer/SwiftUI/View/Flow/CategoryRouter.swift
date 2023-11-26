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

    var nextTransitionRoute: PushRoute = .categoryDetail

    private let categoryDIContainer: CategoryDIContainerInterface

    func triggerScreenTransition(route: PushRoute) {
        navigationPath.append(route)
        nextTransitionRoute = route
    }

    func nextTransitionScreen(item: AppDisplayClassInfoFetchItemModel) -> some View {
        nextTransitionRoute.nextView(
            categoryDIContainer: categoryDIContainer,
            router: self, 
            displayClassItem: item
        )
    }
}

extension CategoryRouter {
    enum PushRoute: Hashable {
        case categoryDetail

        func nextView(
            categoryDIContainer: CategoryDIContainerInterface,
            router: CategoryRouter,
            displayClassItem: AppDisplayClassInfoFetchItemModel
        ) -> some View {
            switch self {
            case .categoryDetail:
                CategoryDetailView(
                    viewModel: categoryDIContainer.categoryDetailViewDependencies(
                        categoryRouter: router,
                        displayClassItem: displayClassItem
                    )
                )
            }
        }
    }
}
