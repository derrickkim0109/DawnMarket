//
//  AppMainQuickMenuAPIService.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Moya

enum AppMainQuickMenuAPIService {
    case fetch
}

extension AppMainQuickMenuAPIService: BaseAPIService {
    var path: String {
        switch self {
        case .fetch:
            return "app/main-infos/quick-menu"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetch:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .fetch:
            return .requestPlain
        }
    }

    var sampleData: Data {
        """
        {
          "data": [
            {
              "quickMenuSeq": 9,
              "quickMenuNm": "농산물",
              "quickMenuImgPath": "quick-menu-info/9/6a9974c9-c322-4831-95a3-48e5e6d8f451.png",
              "quickMenuConcScrenNm": "기획전",
              "quickMenuConcScrenIden": "DPPL230910",
              "quickMenuMovScrenPath": null
            },
            {
              "quickMenuSeq": 6,
              "quickMenuNm": "냉동상품",
              "quickMenuImgPath": "quick-menu-info/6/754372bf-9bf6-4763-98d5-5d3291ca9548.png",
              "quickMenuConcScrenNm": "기획전",
              "quickMenuConcScrenIden": "DPPL230911",
              "quickMenuMovScrenPath": null
            },
            {
              "quickMenuSeq": 8,
              "quickMenuNm": "베스트",
              "quickMenuImgPath": "quick-menu-info/8/8ab2cf08-2083-4fa4-a7a2-dcf44c602d1f.png",
              "quickMenuConcScrenNm": "베스트",
              "quickMenuConcScrenIden": null,
              "quickMenuMovScrenPath": null
            },
            {
              "quickMenuSeq": 7,
              "quickMenuNm": "한상차림",
              "quickMenuImgPath": "quick-menu-info/7/5cb4ce8e-cb7c-415e-bf0b-75b5667a1074.png",
              "quickMenuConcScrenNm": "기획전",
              "quickMenuConcScrenIden": "DPPL23098",
              "quickMenuMovScrenPath": null
            },
            {
              "quickMenuSeq": 10,
              "quickMenuNm": "이벤트/쿠폰",
              "quickMenuImgPath": "quick-menu-info/10/37564376-bcd7-4374-a4e4-d38d990661d7.png",
              "quickMenuConcScrenNm": "이벤트/쿠폰",
              "quickMenuConcScrenIden": null,
              "quickMenuMovScrenPath": null
            }
          ],
          "message": null
        }
        """
            .data(using: .utf8)!
    }
}

