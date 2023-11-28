//
//  AppMainQuickMenuFetchRepositoryInterface.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

protocol AppMainQuickMenuFetchRepositoryInterface {
    func fetch() -> AnyPublisher<AppMainQuickMenuFetchEntity, MoyaError>
}
