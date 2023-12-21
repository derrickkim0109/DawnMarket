//
//  AppDisplayBySubClassDTOObjectMother.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import MorningMarket

struct AppDisplayBySubClassDTOObjectMother {
    static func getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData() -> SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
        return SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
            data: getAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData(),
            message: nil
        )
    }

    static func getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithInsufficientData() -> SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
        return SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
            data: getAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithInsufficientData(),
            message: ""
        )
    }
    
    static func getAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData() -> AppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
        return AppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
            displayClassName: "농축수산물",
            appSubDisplayClassInfoList: getAppSubDisplayClassInfoResponseDTOListWithCompleteData()
        )
    }

    static func getAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithInsufficientData() -> AppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
        return AppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
            displayClassName: "농축수산물",
            appSubDisplayClassInfoList: [getAppSubDisplayClassInfoResponseDTOWithInsufficientData()]
        )
    }

    static func getAppSubDisplayClassInfoResponseDTOListWithCompleteData(count: Int = 10) -> [AppSubDisplayClassInfoResponseDTO] {
        return (0..<count).map { _ in getAppSubDisplayClassInfoResponseDTOWithCompleteData() }
    }

    static func getAppSubDisplayClassInfoResponseDTOWithCompleteData() -> AppSubDisplayClassInfoResponseDTO {
        return AppSubDisplayClassInfoResponseDTO.completedMock
    }

    static func getAppSubDisplayClassInfoResponseDTOWithInsufficientData() -> AppSubDisplayClassInfoResponseDTO {
        return AppSubDisplayClassInfoResponseDTO.insufficientMock
    }
}
