//
//  AppGoodsInfoModelObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppGoodsInfoModelObjectMother {
    static func getAppGoodsInfoFetchModelWithCompleteData() -> AppGoodsInfoFetchModel {
        return AppGoodsInfoFetchModel(
            data: getAppGoodsInfoFetchItemModelListWithCompleteData(),
            pagination: getAppGoodsInfoPaginationModelWithCompleteData()
        )
    }

    static func getAppSubDisplayClassInfoFetchModelWithEmptyData() -> AppGoodsInfoFetchModel {
        return AppGoodsInfoFetchModel(
            data: [],
            pagination: getAppGoodsInfoPaginationModelWithInsufficientData()
        )
    }

    // 20개씩 호출함
    static func getAppGoodsInfoFetchItemModelListWithCompleteData(count: Int = 20) -> [AppGoodsInfoFetchItemModel] {
        return (0..<count).map { _ in getAppGoodsInfoFetchItemModelWithCompleteData() }
    }

    static func getAppGoodsInfoFetchItemModelWithCompleteData() -> AppGoodsInfoFetchItemModel {
        return AppGoodsInfoFetchItemModel.completedMock
    }

    static func getAppGoodsInfoPaginationModelWithCompleteData() -> PaginationModel {
        return PaginationModel.completedMock
    }

    static func getAppGoodsInfoPaginationModelWithInsufficientData() -> PaginationModel {
        return PaginationModel.insufficientMock
    }
}
