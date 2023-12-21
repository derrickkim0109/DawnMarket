//
//  AppDisplayClassInfoFetchItemModel.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppDisplayClassInfoFetchItemModel: Identifiable, Hashable {
    let id = UUID()
    let displayClassCode: String
    let displayClassImagePath: String
    let displayClassName: String
    let displayClassSequence: Int64

    func makeImageURL() -> URL? {
        return URL(string: displayClassImagePath)
    }
}

extension AppDisplayClassInfoFetchItemModel {
#if DEBUG
    static let completedMock = AppDisplayClassInfoFetchItemModel(
        displayClassCode: "DPDCH23097",
        displayClassImagePath: "https://d1afu5va4iy6dc.cloudfront.net/disp-clas-info/51/8703f654-207e-425f-8543-8b63f56f5e41.jpg",
        displayClassName: "농축수산물",
        displayClassSequence: 51
    )
#endif
    static func == (lhs: AppDisplayClassInfoFetchItemModel, rhs: AppDisplayClassInfoFetchItemModel) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
