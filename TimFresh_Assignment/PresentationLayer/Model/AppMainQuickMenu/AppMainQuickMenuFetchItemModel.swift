//
//  AppMainQuickMenuFetchItemModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppMainQuickMenuFetchItemModel: Identifiable {
    let id = UUID()
    let quickMenuConceptScreenIdentifier: String
    let quickMenuConceptScreenName: String
    let quickMenuImagePath: String
    let quickMenuMovingScreenPath: String
    let quickMenuName: String
    let quickMenuSequence: Int32

    func makeImageURL() -> URL? {
        return URL(string: quickMenuImagePath)
    }
}

extension AppMainQuickMenuFetchItemModel {
#if DEBUG
    static let completedMock = AppMainQuickMenuFetchItemModel(
        quickMenuConceptScreenIdentifier: "DPPL230910",
        quickMenuConceptScreenName: "기획전",
        quickMenuImagePath: "quick-menu-info/9/6a9974c9-c322-4831-95a3-48e5e6d8f451.png".makeImageURLString(),
        quickMenuMovingScreenPath: "",
        quickMenuName: "농산물",
        quickMenuSequence: 9
    )
#endif
}
