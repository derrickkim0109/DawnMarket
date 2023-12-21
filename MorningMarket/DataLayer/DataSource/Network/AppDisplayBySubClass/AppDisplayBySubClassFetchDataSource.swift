//
//  AppDisplayBySubClassFetchDataSource.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya
import CombineMoya
import Foundation

protocol AppDisplayBySubClassFetchDataSourceInterface {
    func fetch(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO) -> AnyPublisher<SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO, MoyaError>
}

final class AppDisplayBySubClassFetchDataSource: AppDisplayBySubClassFetchDataSourceInterface {
    private let provider: MoyaProvider<AppDisplayBySubClassAPIService>

    init(provider: MoyaProvider<AppDisplayBySubClassAPIService>) {
        self.provider = provider
    }

    func fetch(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO) -> AnyPublisher<SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetch(requestDTO: requestDTO))
            .map(SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
