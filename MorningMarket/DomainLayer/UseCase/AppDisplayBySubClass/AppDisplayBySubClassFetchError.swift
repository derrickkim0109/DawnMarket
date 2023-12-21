//
//  AppDisplayBySubClassFetchError.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Combine

enum AppDisplayBySubClassFetchError: String, Error {
    case failToFindAppDisplayBySubClass = "카테고리 하위목록을 조회하는데 실패했습니다."
}

extension Publisher where Output == AppDisplayClassInfoBySubDisplayClassFetchEntity {
    func mapAppDisplayBySubClassFetchError() -> AnyPublisher<Output, AppDisplayBySubClassFetchError> {
        return mapError { _ in
            AppDisplayBySubClassFetchError.failToFindAppDisplayBySubClass
        }
        .eraseToAnyPublisher()
    }
}
