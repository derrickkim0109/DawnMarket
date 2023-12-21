//
//  SearchValueType.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/19/23.
//

import Foundation

enum SearchValueType: String, CaseIterable {
    case recommended = "추천순"
    case bySalesVolume = "판매량순"
    case lowestPrice = "낮은가격순"
    case highestPrice = "높은가격순"
}
