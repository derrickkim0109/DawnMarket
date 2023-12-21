//
//  ListResultAppMainQuickMenuResponseDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct ListResultAppMainQuickMenuResponseDTO: Decodable {
    let data: [AppMainQuickMenuResponseDTO]
    let message: String?

    func toEntity() -> AppMainQuickMenuFetchEntity {
        let appMainQuickMenuFetchEntityList = data.map { $0.toEntity() }

        return AppMainQuickMenuFetchEntity(
            data: appMainQuickMenuFetchEntityList,
            message: message ?? ""
        )
    }
}

extension ListResultAppMainQuickMenuResponseDTO {
    #if DEBUG
    static let completedMock = ListResultAppMainQuickMenuResponseDTO(
        data: [AppMainQuickMenuResponseDTO.completedMock],
        message: nil
    )
    #endif
}
