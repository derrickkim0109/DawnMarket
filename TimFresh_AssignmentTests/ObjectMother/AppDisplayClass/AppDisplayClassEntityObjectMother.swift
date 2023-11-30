//
//  AppDisplayClassEntityObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppDisplayClassEntityObjectMother {
    static func getAppDisplayClassInfoFetchEntityWithCompleteData() -> AppDisplayClassInfoFetchEntity {
        return AppDisplayClassInfoFetchEntity(data: getAppDisplayClassInfoFetchEntityListWithCompleteData(), message: "")
    }

    static func getAppDisplayClassInfoFetchEntityWithInsufficientData() -> AppDisplayClassInfoFetchEntity {
        return AppDisplayClassInfoFetchEntity(data: [getAppDisplayClassInfoFetchItemEntityWithInsufficientData()], message: "")
    }

    static func getAppDisplayClassInfoFetchEntityListWithCompleteData(count: Int = 10) -> [AppDisplayClassInfoFetchItemEntity] {
        return (0..<count).map { _ in getAppDisplayClassInfoFetchItemEntityWithCompleteData() }
    }

    static func getAppDisplayClassInfoFetchItemEntityWithCompleteData() -> AppDisplayClassInfoFetchItemEntity {
        return AppDisplayClassInfoFetchItemEntity.completedMock
    }
    
    static func getAppDisplayClassInfoFetchItemEntityWithInsufficientData() -> AppDisplayClassInfoFetchItemEntity {
        return AppDisplayClassInfoFetchItemEntity.insufficientMock
    }
}
