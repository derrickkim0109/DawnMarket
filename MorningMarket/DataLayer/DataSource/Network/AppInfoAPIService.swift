//
//  AppInfoAPIService.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Moya

enum AppInfoAPIService {
    case fetchAppDisplayClassInfo
    case fetchAppMainQuickMenu
    case fetchAppDisplayBySubClass(requestDTO: AppDisplayClassInfoBySubDisplayClassInfoRequestDTO)
    case fetchAppGoodsInfo(requestDTO: AppGoodsInfoFetchRequestDTO)
}

extension AppInfoAPIService: BaseAPIService {
    var path: String {
        switch self {
        case .fetchAppDisplayClassInfo:
            return "app/disp-clas-infos/disp-clas-nm"

        case .fetchAppMainQuickMenu:
            return "app/main-infos/quick-menu"

        case .fetchAppDisplayBySubClass(let requestDTO):
            return "app/disp-clas-infos/disp-clas/\(requestDTO.displayClassSequence)/sub-disp-clas-infos"

        case .fetchAppGoodsInfo(let requestDTO):
            return "app/disp-clas-infos/disp-clas/\(requestDTO.displayClassSequence)/sub-disp-clas/\(requestDTO.subDisplayClassSequence)/goods-infos"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchAppDisplayClassInfo,
             .fetchAppMainQuickMenu,
             .fetchAppDisplayBySubClass,
             .fetchAppGoodsInfo:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .fetchAppDisplayClassInfo,
             .fetchAppMainQuickMenu,
             .fetchAppDisplayBySubClass:
            return .requestPlain

        case .fetchAppGoodsInfo(let requestDTO):
            return .requestParameters(
                parameters: [
                    "page": requestDTO.pageRequest.page,
                    "size": requestDTO.pageRequest.size,
                    "searchValue": requestDTO.searchValue
                ],
                encoding: URLEncoding.default
            )
        }
    }

    var sampleData: Data {
        switch self {
        case .fetchAppDisplayClassInfo:
            return AppDisplaySampleData.appDisPLayClassInfo

        case .fetchAppMainQuickMenu:
            return AppDisplaySampleData.appMainQuickMenu

        case .fetchAppDisplayBySubClass:
            return AppDisplaySampleData.appDisplayBySubClass

        case .fetchAppGoodsInfo:
            return AppDisplaySampleData.appGoodsInfo
        }
    }
}

enum AppDisplaySampleData {
    static let appDisPLayClassInfo = """
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

    static let appMainQuickMenu = """
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

    static let appDisplayBySubClass = """
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

    static let appGoodsInfo = """
        {
          "data": [
            {
              "goodsNm": "무우_1개_국내산",
              "goodsCd": "PAA00046",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 1650,
              "dcPrice": 1650,
              "splyPrice": 1650,
              "goodsGroupCd": "PG000104",
              "goodsGroupNm": "무우 1개",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3863,
              "imgPath": "goods-info/PG000104/PAA00046/1a6fc5ab-f10b-4b7c-80b1-1ba32196c5e2.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "1개",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "양배추_1통_국내산",
              "goodsCd": "PAA00049",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 1750,
              "dcPrice": 1750,
              "splyPrice": 1750,
              "goodsGroupCd": "PG000106",
              "goodsGroupNm": "양배추",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3846,
              "imgPath": "goods-info/PG000106/PAA00049/2788dd1c-5e0a-4c5e-bc0b-84fb5a802b54.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "1통",
              "goodsGroupOptnNm": "수량",
              "goodsGroupOptnSeq": 16,
              "goodsGroupOptnValue": "1통",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "깐적양파(상)_1kg_국내산",
              "goodsCd": "PAA00033",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 3000,
              "dcPrice": 3000,
              "splyPrice": 3000,
              "goodsGroupCd": "PG000134",
              "goodsGroupNm": "깐적양파(상)",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3925,
              "imgPath": "goods-info/PG000134/PAA00033/ff9ac75c-2c76-41e6-95b3-4a8cd6c689fc.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "1kg",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "꽃상추_1kg_국내산",
              "goodsCd": "PAA00023",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 16000,
              "dcPrice": 16000,
              "splyPrice": 16000,
              "goodsGroupCd": "PG000108",
              "goodsGroupNm": "꽃상추",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3958,
              "imgPath": "goods-info/PG000108/PAA00023/6a874177-5ad9-41aa-a83b-6c358cbf28dc.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "1kg",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "깐쪽파(상)_900g_국내산",
              "goodsCd": "PAA00067",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 25000,
              "dcPrice": 25000,
              "splyPrice": 25000,
              "goodsGroupCd": "PG000147",
              "goodsGroupNm": "깐쪽파(상)",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3782,
              "imgPath": "goods-info/PG000147/PAA00067/8efb4104-a0a8-4072-b0b5-49396d4695ce.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "900g",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "깐생강(상)_1kg_국내산",
              "goodsCd": "PAA00062",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 16000,
              "dcPrice": 16000,
              "splyPrice": 16000,
              "goodsGroupCd": "PG000143",
              "goodsGroupNm": "깐생강(상)",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3800,
              "imgPath": "goods-info/PG000143/PAA00062/5d5239e9-9a2f-4d38-8d78-caea9036ec4b.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "1kg",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "흙대파(상)_1단_국내산",
              "goodsCd": "PAA00028",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 2300,
              "dcPrice": 2300,
              "splyPrice": 2300,
              "goodsGroupCd": "PG000126",
              "goodsGroupNm": "흙대파(상)",
              "delYn": "N",
              "goodsSuplmtImgSeq": 4427,
              "imgPath": "goods-info/PG000126/PAA00028/109dab67-6c0c-4ccc-a81a-32e79278a7fd.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 5,
              "goodsNrm": "1단",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "깐대파(상)_1단_국내산",
              "goodsCd": "PAA00027",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 3000,
              "dcPrice": 3000,
              "splyPrice": 3000,
              "goodsGroupCd": "PG000120",
              "goodsGroupNm": "깐대파(상)",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3943,
              "imgPath": "goods-info/PG000120/PAA00027/f5405929-3dfa-4f92-a303-41f00196e028.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "1단",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "고구마(상)_5kg_국내산",
              "goodsCd": "PAA00041",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 4500,
              "dcPrice": 4500,
              "splyPrice": 4500,
              "goodsGroupCd": "PG000142",
              "goodsGroupNm": "고구마(상)",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3898,
              "imgPath": "goods-info/PG000142/PAA00041/37af1cf4-4c78-4a77-9f6e-0be48a3ab523.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "5kg",
              "goodsCntQty": 1
            },
            {
              "goodsNm": "콩나물(곱슬이)_3.5kg_국내산",
              "goodsCd": "PBK00001",
              "goodsStat": "판매중",
              "goodsDispYn": "Y",
              "taxtnYn": "N",
              "mnrBuyYn": "Y",
              "slePrice": 950,
              "dcPrice": 950,
              "splyPrice": 950,
              "goodsGroupCd": "PG000113",
              "goodsGroupNm": "콩나물(곱슬이)",
              "delYn": "N",
              "goodsSuplmtImgSeq": 3309,
              "imgPath": "goods-info/PG000113/PBK00001/7720e8ac-75e8-41f8-9d40-5877fd43ed62.jpg",
              "maxBuyPsblCntQty": 999,
              "minBuyPsblCntQty": 1,
              "goodsNrm": "3.5kg(박스)",
              "goodsCntQty": 1
            }
          ],
          "pagination": {
            "elementSizeOfPage": 10,
            "currentPage": 0,
            "totalPage": 5,
            "totalElements": 47
          }
        }
        """
            .data(using: .utf8)!
}
