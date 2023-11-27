//
//  AppMainQuickMenuResponseDTO.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppMainQuickMenuResponseDTO: Decodable {
    let quickMenuConceptScreenIdentifier: String?
    let quickMenuConceptScreenName: String?
    let quickMenuImagePath: String?
    let quickMenuMovingScreenPath: String?
    let quickMenuName: String?
    let quickMenuSequence: Int32?

    enum CodingKeys: String, CodingKey {
        case quickMenuConceptScreenIdentifier = "quickMenuConcScrenIden"
        case quickMenuConceptScreenName = "quickMenuConcScrenNm"
        case quickMenuImagePath = "quickMenuImgPath"
        case quickMenuMovingScreenPath = "quickMenuMovScrenPath"
        case quickMenuName = "quickMenuNm"
        case quickMenuSequence = "quickMenuSeq"
    }

    func toEntity() -> AppMainQuickMenuFetchItemEntity {
        return AppMainQuickMenuFetchItemEntity(
            quickMenuConceptScreenIdentifier: quickMenuConceptScreenIdentifier ?? "",
            quickMenuConceptScreenName: quickMenuConceptScreenName ?? "",
            quickMenuImagePath: quickMenuImagePath ?? "",
            quickMenuMovingScreenPath: quickMenuMovingScreenPath ?? "",
            quickMenuName: quickMenuName ?? "",
            quickMenuSequence: quickMenuSequence ?? 0
        )
    }
}

extension AppMainQuickMenuResponseDTO {
    #if DEBUG
    static let completedMock = AppMainQuickMenuResponseDTO(
        quickMenuConceptScreenIdentifier: "DPPL230910",
        quickMenuConceptScreenName: "기획전",
        quickMenuImagePath: "quick-menu-info/9/6a9974c9-c322-4831-95a3-48e5e6d8f451.png",
        quickMenuMovingScreenPath: nil,
        quickMenuName: "농산물",
        quickMenuSequence: 9
    )

    static let insufficientMock = AppMainQuickMenuResponseDTO(
        quickMenuConceptScreenIdentifier: "",
        quickMenuConceptScreenName: "",
        quickMenuImagePath: "",
        quickMenuMovingScreenPath: "",
        quickMenuName: "",
        quickMenuSequence: 0
    )
    #endif
}
