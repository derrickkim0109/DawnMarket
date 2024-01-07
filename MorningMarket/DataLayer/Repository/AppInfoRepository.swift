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

    func fetchAppDisplayClassInfo() -> AnyPublisher<AppDisplayClassInfoFetchEntity, MoyaError> {
        return dataSource.fetchAppDisplayClassInfo()
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }

    func fetchAppMainQuickMenu() -> AnyPublisher<AppMainQuickMenuFetchEntity, MoyaError> {
        return dataSource.fetchAppMainQuickMenu()
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }

    func fetchAppDisplayBySubClass(displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, MoyaError> {
        let requestDTO = AppDisplayClassInfoBySubDisplayClassInfoRequestDTO(
            displayClassSequence: displayClassSequence
        )

        return dataSource.fetchAppDisplayBySubClass(requestDTO: requestDTO)
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }

    func fetchAppGoodsInfo(
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

        return dataSource.fetchAppGoodsInfo(requestDTO: requestDTO)
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }
}
