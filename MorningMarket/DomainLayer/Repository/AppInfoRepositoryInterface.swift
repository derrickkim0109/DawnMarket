//
//  AppInfoRepositoryInterface.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

protocol AppInfoRepositoryInterface {
    func fetch() -> AnyPublisher<AppDisplayClassInfoFetchEntity, MoyaError>
    func fetch() -> AnyPublisher<AppMainQuickMenuFetchEntity, MoyaError>
    func fetch(displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, MoyaError>
    func fetch(displayClassSequence: Int64, subDisplayClassSequence: Int, page: Int, size: Int, searchValue: String) -> AnyPublisher<AppGoodsInfoFetchEntity, MoyaError>
}
