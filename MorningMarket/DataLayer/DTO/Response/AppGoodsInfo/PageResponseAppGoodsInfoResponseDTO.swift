//
//  PageResponseAppGoodsInfoResponseDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct PageResponseAppGoodsInfoResponseDTO: Decodable {
    let data: [AppGoodsInfoResponseDTO]
    let pagination: PaginationResponseDTO

    func toEntity() -> AppGoodsInfoFetchEntity {
        let appGoodsInfoFetchItemEntityList = data.map { $0.toEntity() }

        return AppGoodsInfoFetchEntity(
            data: appGoodsInfoFetchItemEntityList,
            pagination: pagination.toEntity()
        )
    }
}

extension PageResponseAppGoodsInfoResponseDTO {
#if DEBUG
    static let completedMock = PageResponseAppGoodsInfoResponseDTO(
        data: [AppGoodsInfoResponseDTO.completedMock],
        pagination: PaginationResponseDTO.completedMock
    )
#endif
}
