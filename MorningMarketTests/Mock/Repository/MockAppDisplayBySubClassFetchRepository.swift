//
//  MockAppDisplayBySubClassFetchRepository.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/27/23.
//

import Foundation
import Moya
import Combine
@testable import MorningMarket

final class MockAppDisplayBySubClassFetchRepository: AppDisplayBySubClassRepositoryInterface {
    var scenario: Scenario = .success
    var entity: AppDisplayClassInfoBySubDisplayClassFetchEntity = AppDisplayBySubClassEntityObjectMother.getAppDisplayClassInfoBySubDisplayClassFetchEntityWithCompleteData()

    func fetch(displayClassSequence: Int64) -> AnyPublisher<MorningMarket.AppDisplayClassInfoBySubDisplayClassFetchEntity, Moya.MoyaError> {
        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: MoyaError.statusCode(Response(statusCode: 400, data: Data())))
                .eraseToAnyPublisher()
        }
    }
}
