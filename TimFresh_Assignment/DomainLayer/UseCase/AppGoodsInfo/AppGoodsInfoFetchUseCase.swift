//
//  AppGoodsInfoFetchUseCase.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

import Combine
import Foundation

protocol AppGoodsInfoFetchUseCaseInterface {
    func fetch(request: AppGoodsInfoFetchRequestValue) -> AnyPublisher<AppGoodsInfoFetchEntity, AppGoodsInfoFetchError>
}

final class AppGoodsInfoFetchUseCase: AppGoodsInfoFetchUseCaseInterface {
    private let repository: AppGoodsInfoFetchRepositoryInterface

    init(repository: AppGoodsInfoFetchRepositoryInterface) {
        self.repository = repository
    }

    func fetch(request: AppGoodsInfoFetchRequestValue) -> AnyPublisher<AppGoodsInfoFetchEntity, AppGoodsInfoFetchError> {
        let pageRequest = AppGoodsInfoFetchRequestDTO.PageRequest(
            page: request.page,
            size: request.size
        )
        let requestDTO = AppGoodsInfoFetchRequestDTO(
            displayClassSequence: request.displayClassSequence,
            subDisplayClassSequence: request.subDisplayClassSequence,
            pageRequest: pageRequest,
            searchValue: request.searchValue
        )

        return repository.fetch(requestDTO: requestDTO)
        .mapAppGoodsInfoFetchError()
    }
}
