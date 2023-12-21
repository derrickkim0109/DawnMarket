//
//  AppDisplayBySubClassFetchUseCase.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Foundation

protocol AppDisplayBySubClassFetchUseCaseInterface {
    func fetch(by displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, AppDisplayBySubClassFetchError>
}

final class AppDisplayBySubClassFetchUseCase: AppDisplayBySubClassFetchUseCaseInterface {
    private let repository: AppDisplayBySubClassRepositoryInterface

    init(repository: AppDisplayBySubClassRepositoryInterface) {
        self.repository = repository
    }

    func fetch(by displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, AppDisplayBySubClassFetchError> {
        return repository.fetch(displayClassSequence: displayClassSequence)
            .mapAppDisplayBySubClassFetchError()
    }
}
