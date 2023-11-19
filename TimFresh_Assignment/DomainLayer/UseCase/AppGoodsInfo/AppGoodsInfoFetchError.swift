//
//  AppGoodsInfoFetchError.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

import Foundation
import Combine

enum AppGoodsInfoFetchError: String, Error {
    case failToFindAppGoodsInfoList = "카테고리 상품목록을 조회하는데 실패했습니다."
}

extension Publisher where Output == AppGoodsInfoFetchEntity {
    func mapAppGoodsInfoFetchError() -> AnyPublisher<Output, AppGoodsInfoFetchError> {
        return mapError { _ in
            AppGoodsInfoFetchError.failToFindAppGoodsInfoList
        }
        .eraseToAnyPublisher()
    }
}
