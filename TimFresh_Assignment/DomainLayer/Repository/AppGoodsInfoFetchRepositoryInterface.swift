//
//  AppGoodsInfoFetchRepositoryInterface.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

import Combine
import Moya

protocol AppGoodsInfoFetchRepositoryInterface {
    func fetch(requestDTO: AppGoodsInfoFetchRequestDTO) -> AnyPublisher<AppGoodsInfoFetchEntity, MoyaError>
}
