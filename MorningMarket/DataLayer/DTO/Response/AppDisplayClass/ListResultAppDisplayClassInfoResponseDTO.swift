//
//  ListResultAppDisplayClassInfoResponseDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/17/23.
//

import Foundation

struct ListResultAppDisplayClassInfoResponseDTO: Decodable {
    let data: [AppDisplayClassInfoResponseDTO]
    let message: String?

    func toEntity() -> AppDisplayClassInfoFetchEntity {
        let appDisplayClassInfoListEntity = data.map { $0.toEntity() }

        return AppDisplayClassInfoFetchEntity(
            data: appDisplayClassInfoListEntity,
            message: message ?? ""
        )
    }
}

extension ListResultAppDisplayClassInfoResponseDTO {
    #if DEBUG
    static let completedMock = ListResultAppDisplayClassInfoResponseDTO(
        data: [AppDisplayClassInfoResponseDTO.completedMock],
        message: nil
    )
    #endif
}
