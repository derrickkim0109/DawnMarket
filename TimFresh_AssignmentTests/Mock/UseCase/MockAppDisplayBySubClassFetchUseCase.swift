//
//  MockAppDisplayBySubClassFetchUseCase.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/27/23.
//

@testable import TimFresh_Assignment
import Combine

final class MockAppDisplayBySubClassFetchUseCase: AppDisplayBySubClassFetchUseCaseInterface {

    var scenario: Scenario = .success
    var entity: AppDisplayClassInfoBySubDisplayClassFetchEntity = AppDisplayBySubClassEntityObjectMother.getAppDisplayClassInfoBySubDisplayClassFetchEntityWithCompleteData()

    func fetch(by displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, AppDisplayBySubClassFetchError> {
        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: AppDisplayBySubClassFetchError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: AppDisplayBySubClassFetchError.failToFindAppDisplayBySubClass)
                .eraseToAnyPublisher()
        }
    }
}
