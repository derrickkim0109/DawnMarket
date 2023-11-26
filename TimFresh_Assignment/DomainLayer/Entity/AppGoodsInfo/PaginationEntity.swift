//
//  PaginationEntity.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

struct PaginationEntity {
    let currentPage: Int32
    let elementSizeOfPage: Int32
    let totalElements: Int64
    let totalPage: Int32
}

extension PaginationEntity {
#if DEBUG
    static let completedMock = PaginationEntity(
        currentPage: 0,
        elementSizeOfPage: 10,
        totalElements: 47,
        totalPage: 5
    )

    static let insufficientMock = PaginationEntity(
        currentPage: 0,
        elementSizeOfPage: 0,
        totalElements: 0,
        totalPage: 0
    )
#endif
}
