//
//  MockAppMainQuickMenuFetchUseCase.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/27/23.
//

@testable import TimFresh_Assignment
import Combine

final class MockAppMainQuickMenuFetchUseCase: AppMainQuickMenuFetchUseCaseInterface {

    var scenario: Scenario = .success
    var entity: AppMainQuickMenuFetchEntity = AppMainQuickMenuEntityObjectMother.getAppMainQuickMenuFetchEntityWithCompleteData()

    func fetchAppMainQuickMenuList() -> AnyPublisher<AppMainQuickMenuFetchEntity, AppMainQuickMenuFetchError> {
        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: AppMainQuickMenuFetchError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: AppMainQuickMenuFetchError.failToFindAppMainQuickMenuList)
                .eraseToAnyPublisher()
        }
    }
}
