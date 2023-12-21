//
//  AppGoodsInfoFetchModel.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/19/23.
//

struct AppGoodsInfoFetchModel {
    let data: [AppGoodsInfoFetchItemModel]
    let pagination: PaginationModel
}

extension AppGoodsInfoFetchModel {
#if DEBUG
    static let completedMock = AppGoodsInfoFetchModel(
        data: [AppGoodsInfoFetchItemModel.completedMock],
        pagination: PaginationModel.completedMock
    )
#endif
}
