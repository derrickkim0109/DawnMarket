//
//  SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO: Decodable {
    let data: AppDisplayClassInfoBySubDisplayClassInfoResponseDTO
    let message: String?

    func toEntity() -> AppDisplayClassInfoBySubDisplayClassFetchEntity {
        let appDisplayClassInfoBySubDisplayClassInfoEntity = data.toEntity()
        return AppDisplayClassInfoBySubDisplayClassFetchEntity(
            data: appDisplayClassInfoBySubDisplayClassInfoEntity,
            message: message ?? ""
        )
    }
}

extension SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
#if DEBUG
    static let completedMock = SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
        data: AppDisplayClassInfoBySubDisplayClassInfoResponseDTO.completedMock,
        message: nil
    )
#endif
}
