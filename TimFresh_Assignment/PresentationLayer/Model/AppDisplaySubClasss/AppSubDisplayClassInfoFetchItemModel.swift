//
//  AppSubDisplayClassInfoFetchItemModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppSubDisplayClassInfoFetchItemModel: Identifiable, Equatable {
    let id = UUID()
    let displayClassCode: String
    let displayClassLevel: String
    let displayClassSequence: Int
    let parentsDisplayClassSequence: Int
    let subDisplayClassName: String
}

extension AppSubDisplayClassInfoFetchItemModel {
#if DEBUG
    static let completedMock = AppSubDisplayClassInfoFetchItemModel(
        displayClassCode: "DPDCM23091",
        displayClassLevel: "중분류",
        displayClassSequence: 52,
        parentsDisplayClassSequence: 51,
        subDisplayClassName: "채소과일"
    )
#endif
}
