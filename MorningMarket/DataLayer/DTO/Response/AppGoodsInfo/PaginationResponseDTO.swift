//
//  PaginationResponseDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct PaginationResponseDTO: Decodable {
    let currentPage: Int32?
    let elementSizeOfPage: Int32?
    let totalElements: Int64?
    let totalPage: Int32?

    func toEntity() -> PaginationEntity {
        return PaginationEntity(
            currentPage: currentPage ?? 0,
            elementSizeOfPage: elementSizeOfPage ?? 0,
            totalElements: totalElements ?? 0,
            totalPage: totalPage ?? 0
        )
    }
}

extension PaginationResponseDTO {
#if DEBUG
    static let completedMock = PaginationResponseDTO(
        currentPage: 0,
        elementSizeOfPage: 10,
        totalElements: 47,
        totalPage: 5
    )

    static let insufficientMock = PaginationResponseDTO(
        currentPage: 0,
        elementSizeOfPage: 0,
        totalElements: 0,
        totalPage: 0
    )
#endif
}
