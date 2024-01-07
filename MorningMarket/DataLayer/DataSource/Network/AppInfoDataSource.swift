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
    func fetchAppDisplayClassInfo() -> AnyPublisher<ListResultAppDisplayClassInfoResponseDTO, MoyaError>
    func fetchAppMainQuickMenu() -> AnyPublisher<ListResultAppMainQuickMenuResponseDTO, MoyaError>
    func fetchAppDisplayBySubClass(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO) -> AnyPublisher<SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO, MoyaError>
    func fetchAppGoodsInfo(requestDTO: AppGoodsInfoFetchRequestDTO) -> AnyPublisher<PageResponseAppGoodsInfoResponseDTO, MoyaError>
}

final class AppInfoDataSource: AppInfoDataSourceInterface {
    private let provider: MoyaProvider<AppInfoAPIService>

    init(provider: MoyaProvider<AppInfoAPIService>) {
        self.provider = provider
    }

    func fetchAppDisplayClassInfo() -> AnyPublisher<ListResultAppDisplayClassInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetchAppDisplayClassInfo)
            .map(ListResultAppDisplayClassInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetchAppMainQuickMenu() -> AnyPublisher<ListResultAppMainQuickMenuResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetchAppMainQuickMenu)
            .map(ListResultAppMainQuickMenuResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetchAppDisplayBySubClass(
        requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO
    ) -> AnyPublisher<SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetchAppDisplayBySubClass(requestDTO: requestDTO))
            .map(SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func fetchAppGoodsInfo(
        requestDTO: AppGoodsInfoFetchRequestDTO
    ) -> AnyPublisher<PageResponseAppGoodsInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetchAppGoodsInfo(requestDTO: requestDTO))
            .map(PageResponseAppGoodsInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
