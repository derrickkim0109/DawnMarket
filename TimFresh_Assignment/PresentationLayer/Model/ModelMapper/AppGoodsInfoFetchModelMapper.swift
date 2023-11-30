//
//  AppGoodsInfoFetchModelMapper.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/19/23.
//

struct AppGoodsInfoFetchModelMapper {
    static func toPresentationModel(entity: AppGoodsInfoFetchEntity) -> AppGoodsInfoFetchModel {
        let appGoodsInfoFetchModelList = entity.data.map {
            let imagePath = $0.imagePath.makeImageURLString()
            
            return AppGoodsInfoFetchItemModel(
                cancelApplicationDate: $0.cancelApplicationDate,
                cancelOrderNo: $0.cancelOrderNo,
                discountPrice: $0.discountPrice,
                deleteYn: $0.deleteYn,
                deliveryCompletedDate: $0.deliveryCompletedDate,
                goodsBadgeImagePath: $0.goodsBadgeImagePath,
                goodsBadgeSequence: $0.goodsBadgeSequence,
                goodsCode: $0.goodsCode,
                goodsCountQuantity: $0.goodsCountQuantity,
                goodsDisplayYn: $0.goodsDisplayYn,
                goodsGroupCode: $0.goodsGroupCode,
                goodsGroupName: $0.goodsGroupName,
                goodsGroupOptionName: $0.goodsGroupOptionName,
                goodsGroupOptionSequence: $0.goodsGroupOptionSequence,
                goodsGroupOptionValue: $0.goodsGroupOptionValue,
                goodsName: $0.goodsName,
                goodsNrm: $0.goodsNrm,
                goodsOrderNo: $0.goodsOrderNo,
                goodsOptionUseYn: $0.goodsOptionUseYn,
                goodsState: $0.goodsState,
                goodsSupplementImageSequence: $0.goodsSupplementImageSequence,
                imagePath: imagePath,
                maxBuyQuantity: $0.maxBuyQuantity,
                minBuyQuantity: $0.minBuyQuantity,
                minorBuyYn: $0.minorBuyYn,
                orderExchangeRtgsOrderNo: $0.orderExchangeRtgsOrderNo,
                salePrice: $0.salePrice,
                supplyPrice: $0.supplyPrice,
                taxationYn: $0.taxationYn,
                temperatureCode: $0.temperatureCode
            )
        }

        let pagination = PaginationModel(
            currentPage: entity.pagination.currentPage,
            elementSizeOfPage: entity.pagination.elementSizeOfPage,
            totalElements: entity.pagination.totalElements,
            totalPage: entity.pagination.totalPage
        )

        return AppGoodsInfoFetchModel(
            data: appGoodsInfoFetchModelList,
            pagination: pagination
        )
    }
}
