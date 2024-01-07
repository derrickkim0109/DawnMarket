//
//  AppInfoRepository.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

final class AppInfoRepository: AppInfoRepositoryInterface {
    private let dataSource: AppInfoDataSourceInterface

    init(dataSource: AppInfoDataSourceInterface) {
        self.dataSource = dataSource
    }

    func fetch() -> AnyPublisher<AppDisplayClassInfoFetchEntity, MoyaError> {
        return dataSource.fetch()
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }

    func fetch() -> AnyPublisher<AppMainQuickMenuFetchEntity, MoyaError> {
        return dataSource.fetch()
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
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

    func fetch(
        displayClassSequence: Int64,
        subDisplayClassSequence: Int,
        page: Int,
        size: Int,
        searchValue: String
    ) -> AnyPublisher<AppGoodsInfoFetchEntity, MoyaError> {
        let pageRequest = AppGoodsInfoFetchRequestDTO.PageRequest(
            page: page,
            size: size
        )
        let requestDTO = AppGoodsInfoFetchRequestDTO(
            displayClassSequence: displayClassSequence,
            subDisplayClassSequence: subDisplayClassSequence,
            pageRequest: pageRequest,
            searchValue: searchValue
        )

        return dataSource.fetch(requestDTO: requestDTO)
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }
}
