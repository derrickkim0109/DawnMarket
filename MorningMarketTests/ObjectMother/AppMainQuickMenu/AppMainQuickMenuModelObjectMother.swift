//
//  AppMainQuickMenuModelObjectMother.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import MorningMarket

struct AppMainQuickMenuModelObjectMother {
    static func getAppMainQuickMenuFetchModelWithCompleteData() -> AppMainQuickMenuFetchModel {
        return AppMainQuickMenuFetchModel(data: getAppMainQuickMenuFetchItemModelListWithCompleteData(), message: "")
    }

    static func getAppMainQuickMenuFetchModelWithEmptyData() -> AppMainQuickMenuFetchModel {
        return AppMainQuickMenuFetchModel(data: [], message: "")
    }

    static func getAppMainQuickMenuFetchItemModelListWithCompleteData(count: Int = 20) -> [AppMainQuickMenuFetchItemModel] {
        return (0..<count).map { _ in getAppMainQuickMenuFetchItemModelWithCompleteData() }
    }

    static func getAppMainQuickMenuFetchItemModelWithCompleteData() -> AppMainQuickMenuFetchItemModel {
        return AppMainQuickMenuFetchItemModel.completedMock
    }
}
