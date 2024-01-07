//
//  AppInfoRepositoryInterface.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

protocol AppInfoRepositoryInterface {
    func fetchAppDisplayClassInfo() -> AnyPublisher<AppDisplayClassInfoFetchEntity, MoyaError>
    func fetchAppMainQuickMenu() -> AnyPublisher<AppMainQuickMenuFetchEntity, MoyaError>
    func fetchAppDisplayBySubClass(displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, MoyaError>
    func fetchAppGoodsInfo(displayClassSequence: Int64, subDisplayClassSequence: Int, page: Int, size: Int, searchValue: String) -> AnyPublisher<AppGoodsInfoFetchEntity, MoyaError>
}
