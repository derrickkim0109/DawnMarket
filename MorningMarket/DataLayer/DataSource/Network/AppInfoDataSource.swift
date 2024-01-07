//
//  AppInfoDataSource.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya
import CombineMoya
import Foundation

protocol AppInfoDataSourceInterface {
    func fetch() -> AnyPublisher<ListResultAppDisplayClassInfoResponseDTO, MoyaError>
    func fetch() -> AnyPublisher<ListResultAppMainQuickMenuResponseDTO, MoyaError>
    func fetch(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO) -> AnyPublisher<SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO, MoyaError>
    func fetch(requestDTO: AppGoodsInfoFetchRequestDTO) -> AnyPublisher<PageResponseAppGoodsInfoResponseDTO, MoyaError>
}

final class AppInfoDataSource: AppInfoDataSourceInterface {
    private let provider: MoyaProvider<AppInfoAPIService>

    init(provider: MoyaProvider<AppInfoAPIService>) {
        self.provider = provider
    }

    func fetch() -> AnyPublisher<ListResultAppDisplayClassInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetchAppDisplayClassInfo)
            .map(ListResultAppDisplayClassInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetch() -> AnyPublisher<ListResultAppMainQuickMenuResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetchAppMainQuickMenu)
            .map(ListResultAppMainQuickMenuResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetch(
        requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO
    ) -> AnyPublisher<SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetchAppDisplayBySubClass(requestDTO: requestDTO))
            .map(SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetch(
        requestDTO: AppGoodsInfoFetchRequestDTO
    ) -> AnyPublisher<PageResponseAppGoodsInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetchAppGoodsInfo(requestDTO: requestDTO))
            .map(PageResponseAppGoodsInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
