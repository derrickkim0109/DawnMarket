//
//  AppDisplayClassInfoBySubDisplayClassFetchModel.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

struct AppDisplayClassInfoBySubDisplayClassFetchModel {
    let data: AppSubDisplayClassInfoFetchModel
    let message: String
}

extension AppDisplayClassInfoBySubDisplayClassFetchModel {
#if DEBUG
    static let completedMock = AppDisplayClassInfoBySubDisplayClassFetchModel(
        data: AppSubDisplayClassInfoFetchModel.completedMock,
        message: ""
    )
#endif
}
