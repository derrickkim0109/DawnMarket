//
//  PaginationModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

struct PaginationModel {
    let currentPage: Int32
    let elementSizeOfPage: Int32
    let totalElements: Int64
    let totalPage: Int32

    func hasNext() -> Bool {
        return totalPage > currentPage
    }
}

extension PaginationModel {
#if DEBUG
    static let completedMock = PaginationModel(
        currentPage: 0,
        elementSizeOfPage: 10,
        totalElements: 47,
        totalPage: 5
    )
#endif
}
