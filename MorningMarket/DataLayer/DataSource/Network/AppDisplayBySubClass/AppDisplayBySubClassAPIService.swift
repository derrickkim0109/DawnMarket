//
//  AppDisplayBySubClassAPIService.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Moya

enum AppDisplayBySubClassAPIService {
    case fetch(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO)
}

extension AppDisplayBySubClassAPIService: BaseAPIService {
    var path: String {
        switch self {
        case .fetch(let requestDTO):
            return "app/disp-clas-infos/disp-clas/\(requestDTO.displayClassSequence)/sub-disp-clas-infos"
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
            "data": {
                "dispClasNm": "농축수산물",
                "appSubDispClasInfoList": [
                    {
                        "dispClasSeq": 52,
                        "subDispClasNm": "채소과일",
                        "prntsDispClasSeq": 51,
                        "dispClasCd": "DPDCM23091",
                        "dispClasLvl": "중분류"
                    },
                    {
                        "dispClasSeq": 53,
                        "subDispClasNm": "냉동채소과일",
                        "prntsDispClasSeq": 51,
                        "dispClasCd": "DPDCM23092",
                        "dispClasLvl": "중분류"
                    },
                    {
                        "dispClasSeq": 54,
                        "subDispClasNm": "축산/축산가공",
                        "prntsDispClasSeq": 51,
                        "dispClasCd": "DPDCM23093",
                        "dispClasLvl": "중분류"
                    },
                    {
                        "dispClasSeq": 55,
                        "subDispClasNm": "수산/수산가공",
                        "prntsDispClasSeq": 51,
                        "dispClasCd": "DPDCM23094",
                        "dispClasLvl": "중분류"
                    },
                    {
                        "dispClasSeq": 56,
                        "subDispClasNm": "란류/란가공",
                        "prntsDispClasSeq": 51,
                        "dispClasCd": "DPDCM23095",
                        "dispClasLvl": "중분류"
                    },
                    {
                        "dispClasSeq": 57,
                        "subDispClasNm": "양곡/분말가루",
                        "prntsDispClasSeq": 51,
                        "dispClasCd": "DPDCM23096",
                        "dispClasLvl": "중분류"
                    }
                ]
            },
            "message": null
        }
        """
            .data(using: .utf8)!
    }
}

