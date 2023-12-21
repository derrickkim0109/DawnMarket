//
//  AppMainQuickMenuFetchError.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Combine

enum AppMainQuickMenuFetchError: String, Error {
    case failToFindAppMainQuickMenuList = "퀵 메뉴를 불러오는데 실패했습니다."
}

extension Publisher where Output == AppMainQuickMenuFetchEntity {
    func mapAppMainQuickMenuFetchError() -> AnyPublisher<Output, AppMainQuickMenuFetchError> {
        return mapError { _ in
            AppMainQuickMenuFetchError.failToFindAppMainQuickMenuList
        }
        .eraseToAnyPublisher()
    }
}
