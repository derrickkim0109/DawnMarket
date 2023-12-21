//
//  AppGoodsInfoEntityObjectMother.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import MorningMarket

struct AppGoodsInfoEntityObjectMother {
    static func getAppGoodsInfoFetchEntityWithCompleteData() -> AppGoodsInfoFetchEntity {
        return AppGoodsInfoFetchEntity(
            data: getAppGoodsInfoFetchItemEntityListWithCompleteData(),
            pagination: getAppGoodsInfoPaginationEntityWithCompleteData()
        )
    }

    static func getAppGoodsInfoFetchEntityWithInsufficientData() -> AppGoodsInfoFetchEntity {
        return AppGoodsInfoFetchEntity(
            data: [getAppGoodsInfoFetchItemEntityWithInsufficientData()],
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
    
    static func getAppGoodsInfoFetchItemEntityWithInsufficientData() -> AppGoodsInfoFetchItemEntity {
        return AppGoodsInfoFetchItemEntity.insufficientMock
    }

    static func getAppGoodsInfoPaginationEntityWithCompleteData() -> PaginationEntity {
        return PaginationEntity.completedMock
    }

    static func getAppGoodsInfoPaginationEntityWithInsufficientData() -> PaginationEntity {
        return PaginationEntity.insufficientMock
    }
}
