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
        URL(string: "www.naver.com")!
    }

    var path: String {
        "path"
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        .requestPlain
    }

    var headers: [String : String]? {
        [:]
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
