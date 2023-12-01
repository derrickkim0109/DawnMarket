//
//  AppDisplayClassFetchRepositoryInterface.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

protocol AppDisplayClassInfoRepositoryInterface {
    func fetch() -> AnyPublisher<AppDisplayClassInfoFetchEntity, MoyaError>
}
