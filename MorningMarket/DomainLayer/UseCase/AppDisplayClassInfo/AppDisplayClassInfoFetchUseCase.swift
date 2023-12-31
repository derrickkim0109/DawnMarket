//
//  AppDisplayClassInfoFetchUseCase.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Foundation

protocol AppDisplayClassInfoFetchUseCaseInterface {
    func fetch() -> AnyPublisher<AppDisplayClassInfoFetchEntity, AppDisplayClassInfoFetchError> 
}

final class AppDisplayClassInfoFetchUseCase: AppDisplayClassInfoFetchUseCaseInterface {
    private let repository: AppInfoRepositoryInterface

    init(repository: AppInfoRepositoryInterface) {
        self.repository = repository
    }

    func fetch() -> AnyPublisher<AppDisplayClassInfoFetchEntity, AppDisplayClassInfoFetchError> {
        return repository.fetchAppDisplayClassInfo()
            .mapAppDisplayClassInfoListFetchError()
    }
}
