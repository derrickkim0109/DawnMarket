//
//  AppDisplayBySubClassEntityObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppDisplayBySubClassEntityObjectMother {
    static func getAppDisplayClassInfoBySubDisplayClassFetchEntityWithCompleteData() -> AppDisplayClassInfoBySubDisplayClassFetchEntity {
        return AppDisplayClassInfoBySubDisplayClassFetchEntity(
            data: getAppSubDisplayClassInfoFetchEntityWithCompleteData(),
            message: ""
        )
    }

    static func getAppDisplayClassInfoBySubDisplayClassFetchEntityWithInsufficientData() -> AppDisplayClassInfoBySubDisplayClassFetchEntity {
        return AppDisplayClassInfoBySubDisplayClassFetchEntity(
            data: getAppSubDisplayClassInfoFetchEntityWithInsufficientData(),
            message: ""
        )
    }

    static func getAppSubDisplayClassInfoFetchEntityWithCompleteData() -> AppSubDisplayClassInfoFetchEntity {
        return AppSubDisplayClassInfoFetchEntity(
            displayClassName: "농축수산물",
            appSubDisplayClassInfoList: getAppSubDisplayClassInfoFetchItemEntityListWithCompleteData()
        )
    }

    static func getAppSubDisplayClassInfoFetchEntityWithInsufficientData() -> AppSubDisplayClassInfoFetchEntity {
        return AppSubDisplayClassInfoFetchEntity(
            displayClassName: "농축수산물",
            appSubDisplayClassInfoList: [getAppSubDisplayClassInfoFetchItemEntityWithInsufficientData()]
        )
    }

    static func getAppSubDisplayClassInfoFetchItemEntityListWithCompleteData(count: Int = 20) -> [AppSubDisplayClassInfoFetchItemEntity] {
        return (0..<count).map { _ in getAppSubDisplayClassInfoFetchItemEntityWithCompleteData() }
    }

    static func getAppSubDisplayClassInfoFetchItemEntityWithCompleteData() -> AppSubDisplayClassInfoFetchItemEntity {
        return AppSubDisplayClassInfoFetchItemEntity.completedMock
    }
    
    static func getAppSubDisplayClassInfoFetchItemEntityWithInsufficientData() -> AppSubDisplayClassInfoFetchItemEntity {
        return AppSubDisplayClassInfoFetchItemEntity.insufficientMock
    }
}
