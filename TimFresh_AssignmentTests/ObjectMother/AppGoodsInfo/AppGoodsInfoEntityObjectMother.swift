//
//  AppGoodsInfoEntityObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppGoodsInfoEntityObjectMother {
    static func getAppGoodsInfoFetchEntityWithCompleteData() -> AppGoodsInfoFetchEntity {
        return AppGoodsInfoFetchEntity(
            data: getAppGoodsInfoFetchItemEntityListWithCompleteData(),
            pagination: getAppGoodsInfoPaginationEntityWithCompleteData()
        )
    }

    static func getAppSubDisplayClassInfoFetchEntityWithEmptyData() -> AppGoodsInfoFetchEntity {
        return AppGoodsInfoFetchEntity(
            data: [],
            pagination: getAppGoodsInfoPaginationEntityWithInsufficientData()
        )
    }

    // 20개씩 호출함
    static func getAppGoodsInfoFetchItemEntityListWithCompleteData(count: Int = 20) -> [AppGoodsInfoFetchItemEntity] {
        return (0..<count).map { _ in getAppGoodsInfoFetchItemEntityWithCompleteData() }
    }

    static func getAppGoodsInfoFetchItemEntityWithCompleteData() -> AppGoodsInfoFetchItemEntity {
        return AppGoodsInfoFetchItemEntity.completedMock
    }

    static func getAppGoodsInfoPaginationEntityWithCompleteData() -> PaginationEntity {
        return PaginationEntity.completedMock
    }

    static func getAppGoodsInfoPaginationEntityWithInsufficientData() -> PaginationEntity {
        return PaginationEntity.insufficientMock
    }
}
