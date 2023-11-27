//
//  MockAppMainQuickMenuFetchRepository.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/27/23.
//

import Foundation
import Moya
import Combine
@testable import TimFresh_Assignment

final class MockAppMainQuickMenuFetchRepository: AppMainQuickMenuFetchRepositoryInterface {
    var scenario: Scenario = .success
    var entity: AppMainQuickMenuFetchEntity = AppMainQuickMenuEntityObjectMother.getAppMainQuickMenuFetchEntityWithCompleteData()

    func fetchAppMainQuickMenuList() -> AnyPublisher<AppMainQuickMenuFetchEntity, MoyaError> {
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
