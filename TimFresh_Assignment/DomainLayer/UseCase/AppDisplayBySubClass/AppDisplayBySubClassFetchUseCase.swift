//
//  AppDisplayBySubClassFetchUseCase.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Foundation

protocol AppDisplayBySubClassFetchUseCaseInterface {
    func fetch(by displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, AppDisplayBySubClassFetchError>
}

final class AppDisplayBySubClassFetchUseCase: AppDisplayBySubClassFetchUseCaseInterface {
    private let repository: AppDisplayBySubClassFetchRepositoryInterface

    init(repository: AppDisplayBySubClassFetchRepositoryInterface) {
        self.repository = repository
    }

    func fetch(by displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, AppDisplayBySubClassFetchError> {
        let requestDTO = AppDisplayClassInfoBySubDisplayClassInfoRequestDTO(
            displayClassSequence: displayClassSequence
        )

        return repository.fetch(requestDTO: requestDTO)
            .mapAppDisplayBySubClassFetchError()
    }
}
