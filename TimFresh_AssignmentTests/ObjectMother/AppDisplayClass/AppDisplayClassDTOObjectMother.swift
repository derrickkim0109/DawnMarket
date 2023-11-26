//
//  AppDisplayClassDTOObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppDisplayClassDTOObjectMother {
    static func getListResultAppDisplayClassInfoResponseDTOWithCompleteData() -> ListResultAppDisplayClassInfoResponseDTO {
        return ListResultAppDisplayClassInfoResponseDTO(
            data: getAppDisplayClassInfoResponseDTOListWithCompleteData(),
            message: nil
        )
    }

    static func getListResultAppDisplayClassInfoResponseDTOWithEmptyData() -> ListResultAppDisplayClassInfoResponseDTO {
        return ListResultAppDisplayClassInfoResponseDTO(data: [], message: "")
    }

    static func getAppDisplayClassInfoResponseDTOListWithCompleteData(count: Int = 10) -> [AppDisplayClassInfoResponseDTO] {
        return (0..<count).map { _ in getAppDisplayClassInfoResponseDTOWithCompleteData() }
    }

    static func getAppDisplayClassInfoResponseDTOWithCompleteData() -> AppDisplayClassInfoResponseDTO {
        return AppDisplayClassInfoResponseDTO.completedMock
    }
}
