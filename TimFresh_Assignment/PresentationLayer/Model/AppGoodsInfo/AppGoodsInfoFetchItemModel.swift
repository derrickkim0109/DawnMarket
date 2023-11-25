//
//  AppGoodsInfoFetchItemModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

import Foundation

struct AppGoodsInfoFetchItemModel: Identifiable {
    let id = UUID()
    let cancelApplicationDate: String
    let cancelOrderNo: String
    let discountPrice: Int32
    let deleteYn: String
    let deliveryCompletedDate: String
    let goodsBadgeImagePath: String
    let goodsBadgeSequence: Int64
    let goodsCode: String
    let goodsCountQuantity: Int32
    let goodsDisplayYn: String
    let goodsGroupCode: String
    let goodsGroupName: String
    let goodsGroupOptionName: String
    let goodsGroupOptionSequence: Int32
    let goodsGroupOptionValue: String
    let goodsName: String
    let goodsNrm: String
    let goodsOrderNo: String
    let goodsOptionUseYn: String
    let goodsState: String
    let goodsSupplementImageSequence: Int32
    let imagePath: String
    let maxBuyQuantity: Int32
    let minBuyQuantity: Int32
    let minorBuyYn: String
    let orderExchangeRtgsOrderNo: String
    let salePrice: Int32
    let supplyPrice: Int32
    let taxationYn: String
    let temperatureCode: String

    func makeImageURL() -> URL? {
        return URL(string: imagePath)
    }

    // 판매가격과 할인가격이 같은경우는 할인하지 않는 상품으로 표현합니다.
    // 판매가격과 할인가격이 다른 경우 할인율을 계산하고, 할인 레이아웃으로 표현합니다.
    func isDiscounted() -> Bool {
        return salePrice != discountPrice
    }

    /// ((판매 가격 - 할인된 가격) / 판매 가격) * 100
    func getDiscountRatio() -> Int {
        let discountedPrice = salePrice - discountPrice
        return Int(Double(discountedPrice) / Double(salePrice) * 100)
    }

    func getGoodsName() -> String {
        let name = goodsName
            .replacingOccurrences(of: "실온_", with: "")
            .replacingOccurrences(of: "국내산", with: "")
            .replacingOccurrences(of: "글로벌", with: "")
            .replacingOccurrences(of: "_", with: " ")

        return name
    }

    func getGoodsOptionName() -> String {
        return goodsGroupOptionName == "" ? goodsNrm : goodsGroupOptionName
    }
}

extension AppGoodsInfoFetchItemModel {
#if DEBUG
    static let completedMock = AppGoodsInfoFetchItemModel(
        cancelApplicationDate: "",
        cancelOrderNo: "",
        discountPrice: 1650,
        deleteYn: "N",
        deliveryCompletedDate: "",
        goodsBadgeImagePath: "",
        goodsBadgeSequence: 0,
        goodsCode: "PAA00046",
        goodsCountQuantity: 1,
        goodsDisplayYn: "Y",
        goodsGroupCode: "PG000104",
        goodsGroupName: "무우 1개",
        goodsGroupOptionName: "",
        goodsGroupOptionSequence: 0,
        goodsGroupOptionValue: "",
        goodsName: "무우_1개_국내산",
        goodsNrm: "1개",
        goodsOrderNo: "",
        goodsOptionUseYn: "",
        goodsState: "판매중",
        goodsSupplementImageSequence: 3863,
        imagePath: "goods-info/PG000104/PAA00046/1a6fc5ab-f10b-4b7c-80b1-1ba32196c5e2.jpg",
        maxBuyQuantity: 999,
        minBuyQuantity: 1,
        minorBuyYn: "Y",
        orderExchangeRtgsOrderNo: "",
        salePrice: 1650,
        supplyPrice: 1650,
        taxationYn: "N",
        temperatureCode: ""
    )
#endif
}
