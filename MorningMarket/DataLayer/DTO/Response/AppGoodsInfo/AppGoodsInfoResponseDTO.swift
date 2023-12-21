//
//  AppGoodsInfoResponseDTO.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation

struct AppGoodsInfoResponseDTO: Decodable {
    let cancelApplicationDate: String?
    let cancelOrderNo: String?
    let discountPrice: Int32?
    let deleteYn: String?
    let deliveryCompletedDate: String?
    let goodsBadgeImagePath: String?
    let goodsBadgeSequence: Int64?
    let goodsCode: String?
    let goodsCountQuantity: Int32?
    let goodsDisplayYn: String?
    let goodsGroupCode: String?
    let goodsGroupName: String?
    let goodsGroupOptionName: String?
    let goodsGroupOptionSequence: Int32?
    let goodsGroupOptionValue: String?
    let goodsName: String?
    let goodsNrm: String?
    let goodsOrderNo: String?
    let goodsOptionUseYn: String?
    let goodsState: String?
    let goodsSupplementImageSequence: Int32?
    let imagePath: String?
    let maxBuyQuantity: Int32?
    let minBuyQuantity: Int32?
    let minorBuyYn: String?
    let orderExchangeRtgsOrderNo: String?
    let salePrice: Int32?
    let supplyPrice: Int32?
    let taxationYn: String?
    let temperatureCode: String?

    enum CodingKeys: String, CodingKey {
        case cancelApplicationDate = "cnlAcDtt"
        case cancelOrderNo = "cnlOdrNo"
        case discountPrice = "dcPrice"
        case deleteYn = "delYn"
        case deliveryCompletedDate = "dlvrCmpltDtt"
        case goodsBadgeImagePath = "goodsBadgeImgPath"
        case goodsBadgeSequence = "goodsBadgeSeq"
        case goodsCode = "goodsCd"
        case goodsCountQuantity = "goodsCntQty"
        case goodsDisplayYn = "goodsDispYn"
        case goodsGroupCode = "goodsGroupCd"
        case goodsGroupName = "goodsGroupNm"
        case goodsGroupOptionName = "goodsGroupOptnNm"
        case goodsGroupOptionSequence = "goodsGroupOptnSeq"
        case goodsGroupOptionValue = "goodsGroupOptnValue"
        case goodsName = "goodsNm"
        case goodsNrm = "goodsNrm"
        case goodsOrderNo = "goodsOdrNo"
        case goodsOptionUseYn = "goodsOptnUseYn"
        case goodsState = "goodsStat"
        case goodsSupplementImageSequence = "goodsSuplmtImgSeq"
        case imagePath = "imgPath"
        case maxBuyQuantity = "maxBuyPsblCntQty"
        case minBuyQuantity = "minBuyPsblCntQty"
        case minorBuyYn = "mnrBuyYn"
        case orderExchangeRtgsOrderNo = "odrExchngRtgsOdrNo"
        case salePrice = "slePrice"
        case supplyPrice = "splyPrice"
        case taxationYn = "taxtnYn"
        case temperatureCode = "tpCd"
    }

    func toEntity() -> AppGoodsInfoFetchItemEntity {
        return AppGoodsInfoFetchItemEntity(
            cancelApplicationDate: cancelApplicationDate ?? "",
            cancelOrderNo: cancelOrderNo ?? "",
            discountPrice: discountPrice ?? 0,
            deleteYn: deleteYn ?? "",
            deliveryCompletedDate: deliveryCompletedDate ?? "",
            goodsBadgeImagePath: goodsBadgeImagePath ?? "",
            goodsBadgeSequence: goodsBadgeSequence ?? 0,
            goodsCode: goodsCode ?? "",
            goodsCountQuantity: goodsCountQuantity ?? 0,
            goodsDisplayYn: goodsDisplayYn ?? "",
            goodsGroupCode: goodsGroupCode ?? "",
            goodsGroupName: goodsGroupName ?? "",
            goodsGroupOptionName: goodsGroupOptionName ?? "",
            goodsGroupOptionSequence: goodsGroupOptionSequence ?? 0,
            goodsGroupOptionValue: goodsGroupOptionValue ?? "",
            goodsName: goodsName ?? "",
            goodsNrm: goodsNrm ?? "",
            goodsOrderNo: goodsOrderNo ?? "",
            goodsOptionUseYn: goodsOptionUseYn ?? "",
            goodsState: goodsState ?? "",
            goodsSupplementImageSequence: goodsSupplementImageSequence ?? 0,
            imagePath: imagePath ?? "",
            maxBuyQuantity: maxBuyQuantity ?? 0,
            minBuyQuantity: minBuyQuantity ?? 0,
            minorBuyYn: minorBuyYn ?? "",
            orderExchangeRtgsOrderNo: orderExchangeRtgsOrderNo ?? "",
            salePrice: salePrice ?? 0,
            supplyPrice: supplyPrice ?? 0,
            taxationYn: taxationYn ?? "",
            temperatureCode: temperatureCode ?? ""
        )
    }
}

extension AppGoodsInfoResponseDTO {
#if DEBUG
    static let completedMock = AppGoodsInfoResponseDTO(
        cancelApplicationDate: nil,
        cancelOrderNo: nil,
        discountPrice: 1650,
        deleteYn: "N",
        deliveryCompletedDate: nil,
        goodsBadgeImagePath: nil,
        goodsBadgeSequence: nil,
        goodsCode: "PAA00046",
        goodsCountQuantity: 1,
        goodsDisplayYn: "Y",
        goodsGroupCode: "PG000104",
        goodsGroupName: "무우 1개",
        goodsGroupOptionName: nil,
        goodsGroupOptionSequence: nil,
        goodsGroupOptionValue: nil,
        goodsName: "무우_1개_국내산",
        goodsNrm: "1개",
        goodsOrderNo: nil,
        goodsOptionUseYn: nil,
        goodsState: "판매중",
        goodsSupplementImageSequence: 3863,
        imagePath: "goods-info/PG000104/PAA00046/1a6fc5ab-f10b-4b7c-80b1-1ba32196c5e2.jpg",
        maxBuyQuantity: 999,
        minBuyQuantity: 1,
        minorBuyYn: "Y",
        orderExchangeRtgsOrderNo: nil,
        salePrice: 1650,
        supplyPrice: 1650,
        taxationYn: "N",
        temperatureCode: nil
    )

    static let insufficientMock = AppGoodsInfoResponseDTO(
        cancelApplicationDate: "",
        cancelOrderNo: "",
        discountPrice: 0,
        deleteYn: "",
        deliveryCompletedDate: "",
        goodsBadgeImagePath: "",
        goodsBadgeSequence: 0,
        goodsCode: "",
        goodsCountQuantity: 0,
        goodsDisplayYn: "",
        goodsGroupCode: "",
        goodsGroupName: "",
        goodsGroupOptionName: "",
        goodsGroupOptionSequence: 0,
        goodsGroupOptionValue: "",
        goodsName: "",
        goodsNrm: "",
        goodsOrderNo: "",
        goodsOptionUseYn: "",
        goodsState: "",
        goodsSupplementImageSequence: 0,
        imagePath: "",
        maxBuyQuantity: 0,
        minBuyQuantity: 0,
        minorBuyYn: "",
        orderExchangeRtgsOrderNo: "",
        salePrice: 0,
        supplyPrice: 0,
        taxationYn: "",
        temperatureCode: ""
    )
#endif
}
