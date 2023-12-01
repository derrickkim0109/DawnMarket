//
//  AppGoodsInfoRepository.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

import Combine
import Moya

final class AppGoodsInfoRepository: AppGoodsInfoRepositoryInterface {
    private let dataSource: AppGoodsInfoFetchRepositoryDataSourceInterface

    init(dataSource: AppGoodsInfoFetchRepositoryDataSourceInterface) {
        self.dataSource = dataSource
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
