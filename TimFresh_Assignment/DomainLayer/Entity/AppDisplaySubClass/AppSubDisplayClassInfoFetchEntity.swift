//
//  AppSubDisplayClassInfoFetchEntity.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

struct AppSubDisplayClassInfoFetchEntity {
    let displayClassName: String
    let appSubDisplayClassInfoList: [AppSubDisplayClassInfoFetchItemEntity]
}

extension AppSubDisplayClassInfoFetchEntity {
#if DEBUG
    static let completedMock = AppSubDisplayClassInfoFetchEntity(
        displayClassName: "농축수산물",
        appSubDisplayClassInfoList: [AppSubDisplayClassInfoFetchItemEntity.completedMock]
    )
#endif
}
