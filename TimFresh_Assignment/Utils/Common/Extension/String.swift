//
//  String.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/29/23.
//

import Foundation

extension String {
    func makeImageURLString() -> String {
        let appConfiguration = AppConfiguration()
        let baseURLString = appConfiguration.imageBaseURL + self
        return baseURLString
    }
}
