//
//  AppMainQuickMenuFetchRepository.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

final class AppMainQuickMenuFetchRepository : AppMainQuickMenuFetchRepositoryInterface {
    private let dataSource: AppMainQuickMenuFetchDataSourceInterface

    init(dataSource: AppMainQuickMenuFetchDataSourceInterface) {
        self.dataSource = dataSource
    }

    func fetchAppMainQuickMenuList() -> AnyPublisher<AppMainQuickMenuFetchEntity, MoyaError> {
        return dataSource.fetchAppMainQuickMenuList()
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }
}
