//
//  AppGoodsInfoFetchRepositoryDataSource.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/19/23.
//

import Combine
import Moya
import CombineMoya
import Foundation

protocol AppGoodsInfoFetchRepositoryDataSourceInterface {
    func fetch(requestDTO: AppGoodsInfoFetchRequestDTO) -> AnyPublisher<PageResponseAppGoodsInfoResponseDTO, MoyaError>
}

final class AppGoodsInfoFetchRepositoryDataSource: AppGoodsInfoFetchRepositoryDataSourceInterface {
    private let provider: MoyaProvider<AppGoodsInfoAPIService>
    
    init(provider: MoyaProvider<AppGoodsInfoAPIService>) {
        self.provider = provider
    }
    
    func fetch(requestDTO: AppGoodsInfoFetchRequestDTO) -> AnyPublisher<PageResponseAppGoodsInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetch(requestDTO: requestDTO))
            .map(PageResponseAppGoodsInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
