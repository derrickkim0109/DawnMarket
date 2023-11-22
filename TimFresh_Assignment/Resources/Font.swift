//
//  UIFont.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/17/23.
//

import SwiftUI

extension Font {
    static func pretendard(size fontSize: CGFloat, type: PretendardFontType) -> Font {
        return .custom("\(type.name)", size: fontSize)
    }

    static func spoqaHanSansNeo(size fontSize: CGFloat, type: SpoqaHanSansNeoFontType) -> Font {
        return .custom("\(type.name)", size: fontSize)
    }
}

extension Font {
    enum SpoqaHanSansNeoFontType {
        case bold
        case medium
        case regular

        var name: String {
            switch self {
            case .bold:
                return "SpoqaHanSansNeo-Bold"
            case .medium:
                return "SpoqaHanSansNeo-Medium"
            case .regular:
                return "SpoqaHanSansNeo-Regular"
            }
        }
    }

    enum PretendardFontType {
        case black
        case bold
        case extraBold
        case extraLight
        case light
        case medium
        case semiBold
        case thin
        case regular

        var name: String {
            switch self {
            case .black:
                return "Pretendard-Black"
            case .bold:
                return "Pretendard-Bold"
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .extraLight:
                return "Pretendard-ExtraLight"
            case .light:
                return "Pretendard-Light"
            case .medium:
                return "Pretendard-Medium"
            case .semiBold:
                return "Pretendard-SemiBold"
            case .thin:
                return "Pretendard-Thin"
            case .regular:
                return "Pretendard-Regular"
            }
        }
    }
}
