//
//  CategoryDIContainerInterface.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import Foundation

protocol CategoryDIContainerInterface {
    func categoryRouter() -> CategoryRouter
    func categoryViewDependencies(categoryRouter: CategoryRouter) -> CategoryViewModel
    func categoryDetailViewDependencies(
        categoryRouter: CategoryRouter,
        displayClassItem: AppDisplayClassInfoFetchItemModel
    ) -> CategoryDetailViewModel
}
