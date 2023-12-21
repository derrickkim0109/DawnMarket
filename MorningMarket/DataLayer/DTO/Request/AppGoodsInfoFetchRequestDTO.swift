//
//  AppGoodsInfoFetchRequestDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/19/23.
//

import Foundation

struct AppGoodsInfoFetchRequestDTO {
    struct PageRequest {
        let page: Int
        let size: Int
    }

    let displayClassSequence: Int64
    let subDisplayClassSequence: Int
    let pageRequest: PageRequest
    let searchValue: String
}
