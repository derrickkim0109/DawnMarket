//
//  AppDisplayClassModelObjectMother.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import MorningMarket

struct AppDisplayClassModelObjectMother {
    static func getAppDisplayClassInfoFetchModelWithCompleteData() -> AppDisplayClassInfoFetchModel {
        return AppDisplayClassInfoFetchModel(data: getAppDisplayClassInfoFetchItemModelListWithCompleteData(), message: "")
    }

    static func getAppDisplayClassInfoFetchModelWithInsufficientData() -> AppDisplayClassInfoFetchModel {
        return AppDisplayClassInfoFetchModel(data: [], message: "")
    }

    static func getAppDisplayClassInfoFetchItemModelListWithCompleteData(count: Int = 20) -> [AppDisplayClassInfoFetchItemModel] {
        return (0..<count).map { _ in getAppDisplayClassInfoFetchItemModelWithCompleteData() }
    }

    static func getAppDisplayClassInfoFetchItemModelWithCompleteData() -> AppDisplayClassInfoFetchItemModel {
        return AppDisplayClassInfoFetchItemModel.completedMock
    }
}
