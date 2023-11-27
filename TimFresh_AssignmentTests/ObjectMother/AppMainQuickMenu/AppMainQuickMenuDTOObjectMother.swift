//
//  AppMainQuickMenuDTOObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppMainQuickMenuDTOObjectMother {
    static func getListResultAppMainQuickMenuResponseDTOWithCompleteData() -> ListResultAppMainQuickMenuResponseDTO {
        return ListResultAppMainQuickMenuResponseDTO(
            data: getAppMainQuickMenuResponseDTOListWithCompleteData(),
            message: ""
        )
    }

    static func getListResultAppMainQuickMenuResponseDTOWithInsufficientData() -> ListResultAppMainQuickMenuResponseDTO {
        return ListResultAppMainQuickMenuResponseDTO(
            data: [getAppMainQuickMenuResponseDTOWithInsufficientData()],
            message: ""
        )
    }

    static func getAppMainQuickMenuResponseDTOListWithCompleteData(count: Int = 10) -> [AppMainQuickMenuResponseDTO] {
        return (0..<count).map { _ in getAppMainQuickMenuResponseDTOWithCompleteData() }
    }

    static func getAppMainQuickMenuResponseDTOWithCompleteData() -> AppMainQuickMenuResponseDTO {
        return AppMainQuickMenuResponseDTO.completedMock
    }

    static func getAppMainQuickMenuResponseDTOWithInsufficientData() -> AppMainQuickMenuResponseDTO {
        return AppMainQuickMenuResponseDTO.insufficientMock
    }
}
