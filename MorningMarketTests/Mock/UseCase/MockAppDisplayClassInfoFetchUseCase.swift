//
//  MockAppDisplayClassInfoFetchUseCase.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/27/23.
//

@testable import MorningMarket
import Combine

final class MockAppDisplayClassInfoFetchUseCase: AppDisplayClassInfoFetchUseCaseInterface {

    var scenario: Scenario = .success
    var entity: AppDisplayClassInfoFetchEntity = AppDisplayClassEntityObjectMother.getAppDisplayClassInfoFetchEntityWithCompleteData()

    func fetch() -> AnyPublisher<AppDisplayClassInfoFetchEntity, AppDisplayClassInfoFetchError> {
        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: AppDisplayClassInfoFetchError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: AppDisplayClassInfoFetchError.failToFindAppDisplayClassInfoList)
                .eraseToAnyPublisher()
        }
    }
}
