//
//  AppMainQuickMenuFetchItemEntity.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppMainQuickMenuFetchItemEntity {
    let quickMenuConceptScreenIdentifier: String
    let quickMenuConceptScreenName: String
    let quickMenuImagePath: String
    let quickMenuMovingScreenPath: String
    let quickMenuName: String
    let quickMenuSequence: Int32
}

extension AppMainQuickMenuFetchItemEntity {
    #if DEBUG
    static let completedMock = AppMainQuickMenuFetchItemEntity(
        quickMenuConceptScreenIdentifier: "DPPL230910",
        quickMenuConceptScreenName: "기획전",
        quickMenuImagePath: "quick-menu-info/9/6a9974c9-c322-4831-95a3-48e5e6d8f451.png",
        quickMenuMovingScreenPath: "",
        quickMenuName: "농산물",
        quickMenuSequence: 9
    )
    
    static let insufficientMock = AppMainQuickMenuFetchItemEntity(
        quickMenuConceptScreenIdentifier: "",
        quickMenuConceptScreenName: "",
        quickMenuImagePath: "",
        quickMenuMovingScreenPath: "",
        quickMenuName: "",
        quickMenuSequence: 0
    )
    #endif
}
