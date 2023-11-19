//
//  AppGoodsInfoFetchEntity.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

struct AppGoodsInfoFetchEntity {
    let data: [AppGoodsInfoFetchItemEntity]
    let pagination: PaginationEntity
}

extension AppGoodsInfoFetchEntity {
#if DEBUG
    static let completedMock = AppGoodsInfoFetchEntity(
        data: [AppGoodsInfoFetchItemEntity.completedMock],
        pagination: PaginationEntity.completedMock
    )
#endif
}
