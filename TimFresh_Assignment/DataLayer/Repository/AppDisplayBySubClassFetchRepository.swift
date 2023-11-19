//
//  AppDisplayBySubClassFetchRepository.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

final class AppDisplayBySubClassFetchRepository : AppDisplayBySubClassFetchRepositoryInterface {
    private let dataSource: AppDisplayBySubClassFetchDataSourceInterface

    init(dataSource: AppDisplayBySubClassFetchDataSourceInterface) {
        self.dataSource = dataSource
    }

    func fetch(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, MoyaError> {
        return dataSource.fetch(requestDTO: requestDTO)
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }
}
