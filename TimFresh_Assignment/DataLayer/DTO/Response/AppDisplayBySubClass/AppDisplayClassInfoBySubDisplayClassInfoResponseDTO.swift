//
//  AppDisplayClassInfoBySubDisplayClassInfoResponseDTO.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppDisplayClassInfoBySubDisplayClassInfoResponseDTO: Decodable {
    let displayClassName: String
    let appSubDisplayClassInfoList: [AppSubDisplayClassInfoResponseDTO]

    enum CodingKeys: String, CodingKey {
        case displayClassName = "dispClasNm"
        case appSubDisplayClassInfoList = "appSubDispClasInfoList"
    }

    func toEntity() -> AppSubDisplayClassInfoFetchEntity {
        let appSubDisplayClassInfoListEntity = appSubDisplayClassInfoList.map { $0.toEntity() }
        return AppSubDisplayClassInfoFetchEntity(
            displayClassName: displayClassName,
            appSubDisplayClassInfoList: appSubDisplayClassInfoListEntity
        )
    }
}

extension AppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
#if DEBUG
    static let completedMock = AppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
        displayClassName: "농축수산물",
        appSubDisplayClassInfoList: [AppSubDisplayClassInfoResponseDTO.completedMock]
    )
#endif
}
