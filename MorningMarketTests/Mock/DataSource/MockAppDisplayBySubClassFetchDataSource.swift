//
//  MockAppDisplayBySubClassFetchDataSource.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/27/23.
//

import Foundation
import Combine
import Moya
@testable import MorningMarket

final class MockAppDisplayBySubClassFetchDataSource: AppDisplayBySubClassFetchDataSourceInterface {
    var scenario: Scenario = .success

    var appDisplayBySubDisplayResponseDTO = AppDisplayBySubClassDTOObjectMother.getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData()
    var networkError = MoyaError.statusCode(.init(statusCode: 500, data: Data()))

    func fetch(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO) -> AnyPublisher<SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO, MoyaError> {
        switch scenario {
        case .success:
            return Just(appDisplayBySubDisplayResponseDTO)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: networkError)
                .eraseToAnyPublisher()
        }
    }
}
