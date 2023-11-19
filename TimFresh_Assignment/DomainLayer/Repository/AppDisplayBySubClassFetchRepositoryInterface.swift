//
//  AppDisplayBySubClassFetchRepositoryInterface.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya

protocol AppDisplayBySubClassFetchRepositoryInterface {
    func fetch(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO) -> AnyPublisher<AppDisplayClassInfoBySubDisplayClassFetchEntity, MoyaError>
}
