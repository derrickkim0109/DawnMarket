//
//  AppGoodsInfoDTOObjectMother.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

@testable import TimFresh_Assignment

struct AppGoodsInfoDTOObjectMother {
    static func getPageResponseAppGoodsInfoResponseDTOWithCompleteData() -> PageResponseAppGoodsInfoResponseDTO {
        return PageResponseAppGoodsInfoResponseDTO(
            data: getAppGoodsInfoResponseDTOListWithCompleteData(),
            pagination: getPaginationResponseDTOWithCompleteData()
        )
    }

    static func getPageResponseAppGoodsInfoResponseDTOWithInsufficientData() -> PageResponseAppGoodsInfoResponseDTO {
        return PageResponseAppGoodsInfoResponseDTO(
            data: [getAppGoodsInfoResponseDTOWithInsufficientData()],
            pagination: getPaginationResponseDTOWithInsufficientData()
        )
    }

    // 20개씩 호출함
    static func getAppGoodsInfoResponseDTOListWithCompleteData(count: Int = 20) -> [AppGoodsInfoResponseDTO] {
        return (0..<count).map { _ in getAppGoodsInfoResponseDTOWithCompleteData() }
    }

    static func getAppGoodsInfoResponseDTOWithCompleteData() -> AppGoodsInfoResponseDTO {
        return AppGoodsInfoResponseDTO.completedMock
    }

    static func getAppGoodsInfoResponseDTOWithInsufficientData() -> AppGoodsInfoResponseDTO {
        return AppGoodsInfoResponseDTO.insufficientMock
    }

    static func getPaginationResponseDTOWithCompleteData() -> PaginationResponseDTO {
        return PaginationResponseDTO.completedMock
    }

    static func getPaginationResponseDTOWithInsufficientData() -> PaginationResponseDTO {
        return PaginationResponseDTO.insufficientMock
    }
}
