//
//  AppGoodsInfoRepositoryInterface.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/19/23.
//

import Combine
import Moya

protocol AppGoodsInfoRepositoryInterface {
    func fetch(
        displayClassSequence: Int64,
        subDisplayClassSequence: Int,
        page: Int,
        size: Int,
        searchValue: String
    ) -> AnyPublisher<AppGoodsInfoFetchEntity, MoyaError>
}




