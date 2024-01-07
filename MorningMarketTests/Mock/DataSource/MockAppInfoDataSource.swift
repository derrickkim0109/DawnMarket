//
//  MockAppInfoDataSource.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 1/7/24.
//

import Foundation
import Combine
import Moya
@testable import MorningMarket

final class MockAppInfoDataSource: AppInfoDataSourceInterface {
    var scenario: Scenario = .success
    var networkError = MoyaError.statusCode(.init(statusCode: 500, data: Data()))

    func fetchAppDisplayClassInfo() -> AnyPublisher<ListResultAppDisplayClassInfoResponseDTO, MoyaError> {
        var appDisplayClassInfoResponseDTO = AppDisplayClassDTOObjectMother.getListResultAppDisplayClassInfoResponseDTOWithCompleteData()

        switch scenario {
        case .success:
            return Just(appDisplayClassInfoResponseDTO)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: networkError)
                .eraseToAnyPublisher()
        }
    }

    func fetchAppMainQuickMenu() -> AnyPublisher<ListResultAppMainQuickMenuResponseDTO, MoyaError> {
        var appMainQuickMenuResponseDTO = AppMainQuickMenuDTOObjectMother.getListResultAppMainQuickMenuResponseDTOWithCompleteData()

        switch scenario {
        case .success:
            return Just(appMainQuickMenuResponseDTO)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: networkError)
                .eraseToAnyPublisher()
        }
    }

    func fetchAppDisplayBySubClass(
        requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO
    ) -> AnyPublisher<SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO, MoyaError> {
        var appDisplayBySubDisplayResponseDTO = AppDisplayBySubClassDTOObjectMother.getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData()

        switch scenario {
        case .success:
            return Just(appDisplayBySubDisplayResponseDTO)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: networkError)
                .eraseToAnyPublisher()
        }
    }

    func fetchAppGoodsInfo(
        requestDTO: AppGoodsInfoFetchRequestDTO
    ) -> AnyPublisher<PageResponseAppGoodsInfoResponseDTO, MoyaError> {
        var appGoodsInfoResponseDTO = AppGoodsInfoDTOObjectMother.getPageResponseAppGoodsInfoResponseDTOWithCompleteData()

        switch scenario {
        case .success:
            return Just(appGoodsInfoResponseDTO)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: networkError)
                .eraseToAnyPublisher()
        }
    }
}
