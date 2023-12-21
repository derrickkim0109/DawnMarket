//
//  MockAppGoodsInfoFetchUseCase.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/27/23.
//

@testable import MorningMarket
import Combine

final class MockAppGoodsInfoFetchUseCase: AppGoodsInfoFetchUseCaseInterface {
    var scenario: Scenario = .success
    var entity: AppGoodsInfoFetchEntity = AppGoodsInfoEntityObjectMother.getAppGoodsInfoFetchEntityWithCompleteData()

    func fetch(request: AppGoodsInfoFetchRequestValue) -> AnyPublisher<AppGoodsInfoFetchEntity, AppGoodsInfoFetchError> {
        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: AppGoodsInfoFetchError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: AppGoodsInfoFetchError.failToFindAppGoodsInfoList)
                .eraseToAnyPublisher()
        }
    }
}
