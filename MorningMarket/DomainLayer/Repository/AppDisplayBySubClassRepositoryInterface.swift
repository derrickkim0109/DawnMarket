//
//  AppDisplayBySubClassFetchRepositoryInterface.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

protocol AppDisplayBySubClassRepositoryInterface {
    func fetch(displayClassSequence: Int64) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, MoyaError>
}
