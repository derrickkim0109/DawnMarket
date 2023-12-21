//
//  AppMainQuickMenuFetchDataSource.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya
import CombineMoya
import Foundation

protocol AppMainQuickMenuFetchDataSourceInterface {
    func fetchAppMainQuickMenuList() -> AnyPublisher<ListResultAppMainQuickMenuResponseDTO, MoyaError>
}

final class AppMainQuickMenuFetchDataSource: AppMainQuickMenuFetchDataSourceInterface {
    private let provider: MoyaProvider<AppMainQuickMenuAPIService>

    init(provider: MoyaProvider<AppMainQuickMenuAPIService>) {
        self.provider = provider
    }

    func fetchAppMainQuickMenuList() -> AnyPublisher<ListResultAppMainQuickMenuResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetch)
            .map(ListResultAppMainQuickMenuResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
