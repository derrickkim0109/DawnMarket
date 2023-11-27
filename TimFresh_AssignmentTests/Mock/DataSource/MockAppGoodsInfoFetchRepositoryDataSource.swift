//
//  MockAppGoodsInfoFetchRepositoryDataSource.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/27/23.
//

import Foundation
import Combine
import Moya
@testable import TimFresh_Assignment

final class MockAppGoodsInfoFetchRepositoryDataSource: AppGoodsInfoFetchRepositoryDataSourceInterface {
    var scenario: Scenario = .success

    var appGoodsInfoResponseDTO = AppGoodsInfoDTOObjectMother.getPageResponseAppGoodsInfoResponseDTOWithCompleteData()
    var networkError = MoyaError.statusCode(.init(statusCode: 400, data: Data()))

    func fetch(requestDTO: AppGoodsInfoFetchRequestDTO) -> AnyPublisher<PageResponseAppGoodsInfoResponseDTO, MoyaError> {
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
