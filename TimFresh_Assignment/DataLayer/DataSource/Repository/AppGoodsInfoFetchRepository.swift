//
//  AppGoodsInfoFetchRepository.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

import Combine
import Moya

final class AppGoodsInfoFetchRepository : AppGoodsInfoFetchRepositoryInterface {
    private let dataSource: AppGoodsInfoFetchRepositoryDataSourceInterface

    init(dataSource: AppGoodsInfoFetchRepositoryDataSourceInterface) {
        self.dataSource = dataSource
    }

    func fetch(requestDTO: AppGoodsInfoFetchRequestDTO) -> AnyPublisher<AppGoodsInfoFetchEntity, MoyaError> {
        return dataSource.fetch(requestDTO: requestDTO)
            .map { responseDTO in
                let entity = responseDTO.toEntity()
                return entity
            }
            .eraseToAnyPublisher()
    }
}
