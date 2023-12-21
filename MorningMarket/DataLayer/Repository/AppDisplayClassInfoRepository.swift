//
//  AppDisplayClassInfoRepository.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

final class AppDisplayClassInfoRepository: AppDisplayClassInfoRepositoryInterface {
    private let dataSource: AppDisplayClassInfoDataSourceInterface

    init(dataSource: AppDisplayClassInfoDataSourceInterface) {
        self.dataSource = dataSource
    }

    func fetch() -> AnyPublisher<AppDisplayClassInfoFetchEntity, MoyaError> {
        return dataSource.fetchAppDisplayClassInfoList()
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }
}
