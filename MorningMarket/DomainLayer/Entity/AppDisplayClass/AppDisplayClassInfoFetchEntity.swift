//
//  AppDisplayClassInfoFetchEntity.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppDisplayClassInfoFetchEntity {
    let data: [AppDisplayClassInfoFetchItemEntity]
    let message: String
}

extension AppDisplayClassInfoFetchEntity {
    #if DEBUG
    static let completedMock = AppDisplayClassInfoFetchEntity(
        data: [AppDisplayClassInfoFetchItemEntity.completedMock],
        message: ""
    )
    #endif
}
