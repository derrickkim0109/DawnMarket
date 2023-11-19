//
//  AppMainQuickMenuFetchModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppMainQuickMenuFetchModel {
    let data: [AppMainQuickMenuFetchItemModel]
    let message: String
}

extension AppMainQuickMenuFetchModel {
#if DEBUG
    static let completedMock = AppMainQuickMenuFetchModel(
        data: [AppMainQuickMenuFetchItemModel.completedMock],
        message: ""
    )
#endif
}
