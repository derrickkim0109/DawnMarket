//
//  AppMainQuickMenuRepositoryInterface.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

protocol AppMainQuickMenuRepositoryInterface {
    func fetch() -> AnyPublisher<AppMainQuickMenuFetchEntity, MoyaError>
}
