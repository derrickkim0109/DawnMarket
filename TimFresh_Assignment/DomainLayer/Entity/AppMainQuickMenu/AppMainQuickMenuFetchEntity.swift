//
//  AppMainQuickMenuFetchEntity.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppMainQuickMenuFetchEntity {
    let data: [AppMainQuickMenuFetchItemEntity]
    let message: String
}

extension AppMainQuickMenuFetchEntity {
    #if DEBUG
    static let completedMock = AppMainQuickMenuFetchEntity(
        data: [AppMainQuickMenuFetchItemEntity.completedMock],
        message: ""
    )
    #endif
}
