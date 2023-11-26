//
//  AppSubDisplayClassInfoDTOObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppSubDisplayClassInfoDTOObjectMother {
    static func getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData() -> SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
        return SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
            data: getAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData(),
            message: nil
        )
    }

    static func getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithEmptyData() -> SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
        return SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
            data: getAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithEmptyData(),
            message: ""
        )
    }
    
    static func getAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData() -> AppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
        return AppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
            displayClassName: "농축수산물",
            appSubDisplayClassInfoList: getAppSubDisplayClassInfoResponseDTOListWithCompleteData()
        )
    }

    static func getAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithEmptyData() -> AppDisplayClassInfoBySubDisplayClassInfoResponseDTO {
        return AppDisplayClassInfoBySubDisplayClassInfoResponseDTO(
            displayClassName: "농축수산물",
            appSubDisplayClassInfoList: []
        )
    }

    static func getAppSubDisplayClassInfoResponseDTOListWithCompleteData(count: Int = 10) -> [AppSubDisplayClassInfoResponseDTO] {
        return (0..<count).map { _ in getAppSubDisplayClassInfoResponseDTOWithCompleteData() }
    }

    static func getAppSubDisplayClassInfoResponseDTOWithCompleteData() -> AppSubDisplayClassInfoResponseDTO {
        return AppSubDisplayClassInfoResponseDTO.completedMock
    }
}
