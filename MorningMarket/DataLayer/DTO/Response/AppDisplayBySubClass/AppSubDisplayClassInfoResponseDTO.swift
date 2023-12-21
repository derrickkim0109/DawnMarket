//
//  AppSubDisplayClassInfoResponseDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppSubDisplayClassInfoResponseDTO: Decodable {
    let displayClassCode: String?
    let displayClassLevel: String?
    let displayClassSequence: Int?
    let parentsDisplayClassSequence: Int?
    let subDisplayClassName: String?

    enum CodingKeys: String, CodingKey {
        case displayClassCode = "dispClasCd"
        case displayClassLevel = "dispClasLvl"
        case displayClassSequence = "dispClasSeq"
        case parentsDisplayClassSequence = "prntsDispClasSeq"
        case subDisplayClassName = "subDispClasNm"
    }

    func toEntity() -> AppSubDisplayClassInfoFetchItemEntity {
        return AppSubDisplayClassInfoFetchItemEntity(
            displayClassCode: displayClassCode ?? "",
            displayClassLevel: displayClassLevel ?? "",
            displayClassSequence: displayClassSequence ?? 0,
            parentsDisplayClassSequence: parentsDisplayClassSequence ?? 0,
            subDisplayClassName: subDisplayClassName ?? ""
        )
    }
}

extension AppSubDisplayClassInfoResponseDTO {
#if DEBUG
    static let completedMock = AppSubDisplayClassInfoResponseDTO(
        displayClassCode: "DPDCM23091",
        displayClassLevel: "중분류",
        displayClassSequence: 52,
        parentsDisplayClassSequence: 51,
        subDisplayClassName: "채소과일"
    )

    static let insufficientMock = AppSubDisplayClassInfoResponseDTO(
        displayClassCode: "",
        displayClassLevel: "",
        displayClassSequence: 0,
        parentsDisplayClassSequence: 0,
        subDisplayClassName: ""
    )
#endif
}
