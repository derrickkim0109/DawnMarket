//
//  AppDisplayClassInfoDataSource.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Combine
import Moya
import CombineMoya
import Foundation

protocol AppDisplayClassInfoDataSourceInterface {
    func fetchAppDisplayClassInfoList() -> AnyPublisher<ListResultAppDisplayClassInfoResponseDTO, MoyaError>
}

final class AppDisplayClassInfoDataSource: AppDisplayClassInfoDataSourceInterface {
    private let provider: MoyaProvider<AppDisplayClassInfoAPIService>

    init(provider: MoyaProvider<AppDisplayClassInfoAPIService>) {
        self.provider = provider
    }

    func fetchAppDisplayClassInfoList() -> AnyPublisher<ListResultAppDisplayClassInfoResponseDTO, MoyaError> {
        return provider.requestPublisher(.fetch)
            .map(ListResultAppDisplayClassInfoResponseDTO.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
