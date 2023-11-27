//
//  MockAppDisplayBySubClassFetchDataSource.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/27/23.
//

import Foundation
import Combine
import Moya
@testable import TimFresh_Assignment

final class MockAppDisplayBySubClassFetchDataSource: AppDisplayBySubClassFetchDataSourceInterface {
    var scenario: Scenario = .success

    var appDisplayBySubDisplayResponseDTO = AppSubDisplayClassInfoDTOObjectMother.getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData()
    var networkError = MoyaError.statusCode(.init(statusCode: 400, data: Data()))

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
