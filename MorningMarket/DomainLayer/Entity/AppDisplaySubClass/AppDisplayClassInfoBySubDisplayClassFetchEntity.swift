//
//  AppDisplayClassInfoBySubDisplayClassFetchEntity.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

struct AppDisplayClassInfoBySubDisplayClassFetchEntity {
    let data: AppSubDisplayClassInfoFetchEntity
    let message: String
}

extension AppDisplayClassInfoBySubDisplayClassFetchEntity {
#if DEBUG
    static let completedMock = AppDisplayClassInfoBySubDisplayClassFetchEntity(
        data: AppSubDisplayClassInfoFetchEntity.completedMock,
        message: ""
    )
#endif
}
