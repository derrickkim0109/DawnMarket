//
//  AppGoodsInfoFetchUseCase.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/19/23.
//

import Combine
import Foundation

protocol AppGoodsInfoFetchUseCaseInterface {
    func fetch(requestValue: AppGoodsInfoFetchRequestValue) -> AnyPublisher<AppGoodsInfoFetchEntity, AppGoodsInfoFetchError>
}

final class AppGoodsInfoFetchUseCase: AppGoodsInfoFetchUseCaseInterface {
    private let repository: AppInfoRepositoryInterface

    init(repository: AppInfoRepositoryInterface) {
        self.repository = repository
    }

    func fetch(
        requestValue: AppGoodsInfoFetchRequestValue
    ) -> AnyPublisher<AppGoodsInfoFetchEntity, AppGoodsInfoFetchError> {
        return repository.fetchAppGoodsInfo(
            displayClassSequence: requestValue.displayClassSequence,
            subDisplayClassSequence: requestValue.subDisplayClassSequence,
            page: requestValue.page,
            size: requestValue.size,
            searchValue: requestValue.searchValue
        )
        .mapAppGoodsInfoFetchError()
    }
}
