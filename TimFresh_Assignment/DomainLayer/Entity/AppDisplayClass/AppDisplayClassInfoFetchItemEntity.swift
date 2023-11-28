//
//  AppDisplayClassInfoItemEntity.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppDisplayClassInfoFetchItemEntity {
    let displayClassCode: String
    let displayClassImagePath: String
    let displayClassName: String
    let displayClassSequence: Int64
}

extension AppDisplayClassInfoFetchItemEntity {
    #if DEBUG
    static let completedMock = AppDisplayClassInfoFetchItemEntity(
        displayClassCode: "DPDCH23097",
        displayClassImagePath: "disp-clas-info/51/8703f654-207e-425f-8543-8b63f56f5e41.jpg",
        displayClassName: "농축수산물",
        displayClassSequence: 51
    )
    #endif
}
