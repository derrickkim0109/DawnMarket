//
//  AppSubDisplayClassInfoFetchItemEntity.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

struct AppSubDisplayClassInfoFetchItemEntity {
    let displayClassCode: String
    let displayClassLevel: String
    let displayClassSequence: Int
    let parentsDisplayClassSequence: Int
    let subDisplayClassName: String
}

extension AppSubDisplayClassInfoFetchItemEntity {
#if DEBUG
    static let completedMock = AppSubDisplayClassInfoFetchItemEntity(
        displayClassCode: "DPDCM23091",
        displayClassLevel: "중분류",
        displayClassSequence: 52,
        parentsDisplayClassSequence: 51,
        subDisplayClassName: "채소과일"
    )
#endif
}
