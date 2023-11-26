//
//  AppDisplayClassModelObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppDisplayClassModelObjectMother {
    static func getAppDisplayClassInfoFetchModelWithCompleteData() -> AppDisplayClassInfoFetchModel {
        return AppDisplayClassInfoFetchModel(data: getAppDisplayClassInfoFetchItemModelListWithCompleteData(), message: "")
    }

    static func getAppDisplayClassInfoFetchModelWithEmptyData() -> AppDisplayClassInfoFetchModel {
        return AppDisplayClassInfoFetchModel(data: [], message: "")
    }

    static func getAppDisplayClassInfoFetchItemModelListWithCompleteData(count: Int = 20) -> [AppDisplayClassInfoFetchItemModel] {
        return (0..<count).map { _ in getAppDisplayClassInfoFetchItemModelWithCompleteData() }
    }

    static func getAppDisplayClassInfoFetchItemModelWithCompleteData() -> AppDisplayClassInfoFetchItemModel {
        return AppDisplayClassInfoFetchItemModel.completedMock
    }
}
