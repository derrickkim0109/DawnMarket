//
//  BaseAPIService.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Moya

protocol BaseAPIService: TargetType { }

extension BaseAPIService {
    var baseURL: URL {
        guard let baseURLString = Bundle.main.infoDictionary?["BASE_URL"] as? String,
              let url = URL(string: baseURLString) else {
            fatalError("Failed to create base URL")
        }

        return url
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
