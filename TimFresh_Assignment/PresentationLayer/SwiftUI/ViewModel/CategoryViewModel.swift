//
//  CategoryViewModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Combine

final class CategoryViewModel: ObservableObject {
    private let appDisplayClassFetchUseCase: AppDisplayClassInfoFetchUseCaseInterface
    private let appMainQuickMenuFetchUseCase: AppMainQuickMenuFetchUseCaseInterface

    init(
        appDisplayClassFetchUseCase: AppDisplayClassInfoFetchUseCaseInterface,
        appMainQuickMenuFetchUseCase: AppMainQuickMenuFetchUseCaseInterface
    ) {
        self.appDisplayClassFetchUseCase = appDisplayClassFetchUseCase
        self.appMainQuickMenuFetchUseCase = appMainQuickMenuFetchUseCase
    }
}
