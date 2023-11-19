//
//  AppSubDisplayClassInfoFetchModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

struct AppSubDisplayClassInfoFetchModel {
    let displayClassName: String
    let appSubDisplayClassInfoList: [AppSubDisplayClassInfoFetchItemModel]
}

extension AppSubDisplayClassInfoFetchModel {
#if DEBUG
    static let completedMock = AppSubDisplayClassInfoFetchModel(
        displayClassName: "농축수산물",
        appSubDisplayClassInfoList: [AppSubDisplayClassInfoFetchItemModel.completedMock]
    )
#endif
}
