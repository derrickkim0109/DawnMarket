//
//  TabBarItemPreferenceKey.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

struct TabBarItemPreferenceKey: PreferenceKey {
    static var defaultValue = [TabBarItemType]()

    static func reduce(
        value: inout [TabBarItemType],
        nextValue: () -> [TabBarItemType]
    ) {
        value += nextValue()
    }
}
