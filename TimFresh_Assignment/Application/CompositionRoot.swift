//
//  CompositionRoot.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import Foundation

protocol CompositionRootInterface {
    var categoryDIContainer: CategoryDIContainerInterface { get }
}

final class CompositionRoot: CompositionRootInterface {
    let categoryDIContainer: CategoryDIContainerInterface

    init() {
        self.categoryDIContainer = CategoryDIContainer()
    }
}
