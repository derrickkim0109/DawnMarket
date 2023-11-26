//
//  AppSubDisplayClassInfoEntityObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppDisplayBySubClassEntityObjectMother {
    static func getAppSubDisplayClassInfoFetchEntityWithCompleteData() -> AppSubDisplayClassInfoFetchEntity {
        return AppSubDisplayClassInfoFetchEntity(
            displayClassName: "농축수산물",
            appSubDisplayClassInfoList: getAppSubDisplayClassInfoFetchItemEntityListWithCompleteData()
        )
    }

    static func getAppSubDisplayClassInfoFetchEntityWithEmptyData() -> AppSubDisplayClassInfoFetchEntity {
        return AppSubDisplayClassInfoFetchEntity(
            displayClassName: "농축수산물",
            appSubDisplayClassInfoList: []
        )
    }

    static func getAppSubDisplayClassInfoFetchItemEntityListWithCompleteData(count: Int = 20) -> [AppSubDisplayClassInfoFetchItemEntity] {
        return (0..<count).map { _ in getAppSubDisplayClassInfoFetchItemEntityWithCompleteData() }
    }

    static func getAppSubDisplayClassInfoFetchItemEntityWithCompleteData() -> AppSubDisplayClassInfoFetchItemEntity {
        return AppSubDisplayClassInfoFetchItemEntity.completedMock
    }
}
