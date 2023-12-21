//
//  AppDisplayClassInfoFetchError.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Combine

enum AppDisplayClassInfoFetchError: String, Error {
    case failToFindAppDisplayClassInfoList = "카테고리 대분류를 불러오는데 실패했습니다."
}

extension Publisher where Output == AppDisplayClassInfoFetchEntity {
    func mapAppDisplayClassInfoListFetchError() -> AnyPublisher<Output, AppDisplayClassInfoFetchError> {
        return mapError { _ in
            AppDisplayClassInfoFetchError.failToFindAppDisplayClassInfoList
        }
        .eraseToAnyPublisher()
    }
}
