//
//  AppDisplayClassInfoAPIService.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Moya

enum AppDisplayClassInfoAPIService {
    case fetch
}

extension AppDisplayClassInfoAPIService: BaseAPI {
    var path: String {
        switch self {
        case .fetch:
            return "app/disp-clas-infos/disp-clas-nm"
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
              "dispClasSeq": 51,
              "dispClasNm": "농축수산물",
              "dispClasImgPath": "disp-clas-info/51/8703f654-207e-425f-8543-8b63f56f5e41.jpg",
              "dispClasCd": "DPDCH23097"
            },
            {
              "dispClasSeq": 58,
              "dispClasNm": "가공식품",
              "dispClasImgPath": "disp-clas-info/58/8c798e31-55d9-4f10-8b96-7653cd9ec9dc.png",
              "dispClasCd": "DPDCH23098"
            },
            {
              "dispClasSeq": 63,
              "dispClasNm": "주방/위생용품",
              "dispClasImgPath": "disp-clas-info/63/94a6e4d8-5933-4fb9-8866-6f139c07fa71.png",
              "dispClasCd": "DPDCH23099"
            }
          ],
          "message": null
        }
        """
            .data(using: .utf8)!
    }
}
