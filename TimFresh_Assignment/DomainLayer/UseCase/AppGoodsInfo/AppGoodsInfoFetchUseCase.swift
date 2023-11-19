//
//  AppGoodsInfoFetchUseCase.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

import Combine
import Foundation

protocol AppGoodsInfoFetchUseCaseInterface {
    func fetch(
        displayClassSequence: Int,
        subDisplayClassSequence: Int,
        page: Int,
        size: Int,
        searchValue: String
    ) -> AnyPublisher<AppGoodsInfoFetchEntity, AppGoodsInfoFetchError>
}

final class AppGoodsInfoFetchUseCase: AppGoodsInfoFetchUseCaseInterface {
    private let repository: AppGoodsInfoFetchRepositoryInterface

    init(repository: AppGoodsInfoFetchRepositoryInterface) {
        self.repository = repository
    }

    func fetch(
        displayClassSequence: Int,
        subDisplayClassSequence: Int,
        page: Int,
        size: Int,
        searchValue: String
    ) -> AnyPublisher<AppGoodsInfoFetchEntity, AppGoodsInfoFetchError> {
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

        return repository.fetch(requestDTO: requestDTO)
        .mapAppGoodsInfoFetchError()
    }
}
