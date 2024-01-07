//
//  MockAppInfoRepository.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 1/7/24.
//

import Foundation
import Moya
import Combine
@testable import MorningMarket

final class MockAppInfoRepository: AppInfoRepositoryInterface {
    var scenario: Scenario = .success

    func fetchAppDisplayClassInfo() -> AnyPublisher<AppDisplayClassInfoFetchEntity, MoyaError> {
        var entity: AppDisplayClassInfoFetchEntity = AppDisplayClassEntityObjectMother.getAppDisplayClassInfoFetchEntityWithCompleteData()

        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: MoyaError.statusCode(Response(statusCode: 400, data: Data())))
                .eraseToAnyPublisher()
        }
    }

    func fetchAppMainQuickMenu() -> AnyPublisher<MorningMarket.AppMainQuickMenuFetchEntity, Moya.MoyaError> {
        var entity: AppMainQuickMenuFetchEntity = AppMainQuickMenuEntityObjectMother.getAppMainQuickMenuFetchEntityWithCompleteData()

        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: MoyaError.statusCode(Response(statusCode: 400, data: Data())))
                .eraseToAnyPublisher()
        }
    }

    func fetchAppDisplayBySubClass(displayClassSequence: Int64) -> AnyPublisher<MorningMarket.AppDisplayClassInfoBySubDisplayClassFetchEntity, Moya.MoyaError> {
        var entity: AppDisplayClassInfoBySubDisplayClassFetchEntity = AppDisplayBySubClassEntityObjectMother.getAppDisplayClassInfoBySubDisplayClassFetchEntityWithCompleteData()

        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: MoyaError.statusCode(Response(statusCode: 400, data: Data())))
                .eraseToAnyPublisher()
        }
    }

    func fetchAppGoodsInfo(displayClassSequence: Int64, subDisplayClassSequence: Int, page: Int, size: Int, searchValue: String) -> AnyPublisher<MorningMarket.AppGoodsInfoFetchEntity, Moya.MoyaError> {
        var entity: AppGoodsInfoFetchEntity = AppGoodsInfoEntityObjectMother.getAppGoodsInfoFetchEntityWithCompleteData()

        switch scenario {
        case .success:
            return Just(entity)
                .setFailureType(to: MoyaError.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: MoyaError.statusCode(Response(statusCode: 400, data: Data())))
                .eraseToAnyPublisher()
        }
    }
}
