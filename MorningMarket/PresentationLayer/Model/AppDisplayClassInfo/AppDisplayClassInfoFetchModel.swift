//
//  AppDisplayClassInfoFetchModel.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppDisplayClassInfoFetchModel {
    let data: [AppDisplayClassInfoFetchItemModel]
    let message: String
}

extension AppDisplayClassInfoFetchModel {
#if DEBUG
    static let completedMock = AppDisplayClassInfoFetchModel(
        data: [AppDisplayClassInfoFetchItemModel.completedMock],
        message: ""
    )
#endif
}
