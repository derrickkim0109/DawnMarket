//
//  AppMainQuickMenuEntityObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppMainQuickMenuEntityObjectMother {
    static func getAppMainQuickMenuFetchEntityWithCompleteData() -> AppMainQuickMenuFetchEntity {
        return AppMainQuickMenuFetchEntity(data: getAppMainQuickMenuFetchEntityListWithCompleteData(), message: "")
    }

    static func getAppMainQuickMenuFetchEntityWithInsufficientData() -> AppMainQuickMenuFetchEntity {
        return AppMainQuickMenuFetchEntity(data: [getAppMainQuickMenuFetchItemEntityWithInsufficientData()], message: "")
    }

    static func getAppMainQuickMenuFetchEntityListWithCompleteData(count: Int = 20) -> [AppMainQuickMenuFetchItemEntity] {
        return (0..<count).map { _ in getAppMainQuickMenuFetchItemEntityWithCompleteData() }
    }

    static func getAppMainQuickMenuFetchItemEntityWithCompleteData() -> AppMainQuickMenuFetchItemEntity {
        return AppMainQuickMenuFetchItemEntity.completedMock
    }   
    
    static func getAppMainQuickMenuFetchItemEntityWithInsufficientData() -> AppMainQuickMenuFetchItemEntity {
        return AppMainQuickMenuFetchItemEntity.insufficientMock
    }
}
