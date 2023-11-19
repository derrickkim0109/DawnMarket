//
//  AppGoodsInfoFetchModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

struct AppGoodsInfoFetchModel {
    let data: [AppGoodsInfoFetchItemModel]
    let pagination: PaginationEntity
}

extension AppGoodsInfoFetchModel {
#if DEBUG
    static let completedMock = AppGoodsInfoFetchModel(
        data: [AppGoodsInfoFetchItemModel.completedMock],
        pagination: PaginationEntity.completedMock
    )
#endif
}
