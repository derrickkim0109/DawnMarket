//
//  File.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/29/23.
//

import Foundation

final class AppConfiguration {
    lazy var apiBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(
            forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("APIBaseURL must not be empty in plist")
        }
        return apiBaseURL
    }()    

    lazy var imageBaseURL: String = {
        guard let apiBaseURL = Bundle.main.object(
            forInfoDictionaryKey: "IMAGE_BASE_URL") as? String else {
            fatalError("IMAGE_BASE_URL must not be empty in plist")
        }
        return apiBaseURL
    }()
}
