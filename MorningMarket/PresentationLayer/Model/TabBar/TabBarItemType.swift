//
//  TabBarItemType.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/20/23.
//

import SwiftUI

enum TabBarItemType: CaseIterable {
    case category
    case favorites
    case home
    case cart
    case myPage

    var iconImage: Image {
        switch self {
        case .category:
            return Image.iconHamburgerImage
        case .favorites:
            return Image.iconStarImage
        case .home:
            return Image.iconHomeImage
        case .cart:
            return Image.iconCartFillImage
        case .myPage:
            return Image.iconPersonImage
        }
    }

    var title: String {
        switch self {
        case .category:
            return "카테고리"
        case .favorites:
            return "즐겨찾기"
        case .home:
            return "홈"
        case .cart:
            return "장바구니"
        case .myPage:
            return "내 정보"
        }
    }

    var color: Color {
        switch self {
        default:
            return Color.blue900
        }
    }
}
