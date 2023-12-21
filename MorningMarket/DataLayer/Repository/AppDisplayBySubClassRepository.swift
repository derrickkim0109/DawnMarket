//
//  AppDisplayBySubClassRepository.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

final class AppDisplayBySubClassRepository: AppDisplayBySubClassRepositoryInterface {
    private let dataSource: AppDisplayBySubClassFetchDataSourceInterface

    init(dataSource: AppDisplayBySubClassFetchDataSourceInterface) {
        self.dataSource = dataSource
    }

    func fetch(displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, MoyaError> {
        let requestDTO = AppDisplayClassInfoBySubDisplayClassInfoRequestDTO(
            displayClassSequence: displayClassSequence
        )
        
        return dataSource.fetch(requestDTO: requestDTO)
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }
}

