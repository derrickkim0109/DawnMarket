//
//  AppMainQuickMenuFetchUseCase.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Foundation

protocol AppMainQuickMenuFetchUseCaseInterface {
    func fetch() -> AnyPublisher<AppMainQuickMenuFetchEntity, AppMainQuickMenuFetchError>
}

final class AppMainQuickMenuFetchUseCase: AppMainQuickMenuFetchUseCaseInterface {
    private let repository: AppInfoRepositoryInterface

    init(repository: AppInfoRepositoryInterface) {
        self.repository = repository
    }

    func fetch() -> AnyPublisher<AppMainQuickMenuFetchEntity, AppMainQuickMenuFetchError> {
        return repository.fetchAppMainQuickMenu()
            .mapAppMainQuickMenuFetchError()
    }
}
