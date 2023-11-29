//
//  TestAPIService.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/27/23.
//

import Foundation
import Moya

enum TestAPI: TargetType {
    case test

    var baseURL: URL {
        return URL(string: "https://www.teamfresh.co.kr/")!
    }

    var path: String {
        return "path"
    }

    var method: Moya.Method {
        return .get
    }

    var task: Moya.Task {
        return .requestPlain
    }

    var headers: [String : String]? {
        return [:]
    }

    var sampleData: Data {
            """
            {
                "id": 1,
                "name": "Test Item"
            }
            """.data(using: .utf8)!
    }
}

struct TestItem: Decodable {
    let id: Int
    let name: String
}
