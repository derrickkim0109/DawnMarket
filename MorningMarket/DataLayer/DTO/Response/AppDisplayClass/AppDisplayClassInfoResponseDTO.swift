//
//  AppDisplayClassInfoResponseDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/17/23.
//

import Foundation

struct AppDisplayClassInfoResponseDTO: Decodable {
    let displayClassCode: String?
    let displayClassImagePath: String?
    let displayClassName: String?
    let displayClassSequence: Int64?

    enum CodingKeys: String, CodingKey {
        case displayClassCode = "dispClasCd"
        case displayClassImagePath = "dispClasImgPath"
        case displayClassName = "dispClasNm"
        case displayClassSequence = "dispClasSeq"
    }

    func toEntity() -> AppDisplayClassInfoFetchItemEntity {
        return AppDisplayClassInfoFetchItemEntity(
            displayClassCode: displayClassCode ?? "",
            displayClassImagePath: displayClassImagePath ?? "",
            displayClassName: displayClassName ?? "",
            displayClassSequence: displayClassSequence ?? 0
        )
    }
}

extension AppDisplayClassInfoResponseDTO {
    #if DEBUG
    static let completedMock = AppDisplayClassInfoResponseDTO(
        displayClassCode: "DPDCH23097",
        displayClassImagePath: "disp-clas-info/51/8703f654-207e-425f-8543-8b63f56f5e41.jpg",
        displayClassName: "농축수산물",
        displayClassSequence: 51
    )

    static let insufficientMock = AppDisplayClassInfoResponseDTO(
        displayClassCode: "",
        displayClassImagePath: "",
        displayClassName: "",
        displayClassSequence: 0
    )
    #endif
}
