//
//  AppGoodsInfoModelTests.swift
//  TimFresh_AssignmentTests
//
//  Created by derrick on 11/30/23.
//

import XCTest
@testable import TimFresh_Assignment

final class AppGoodsInfoModelTests: XCTestCase {
    var completeEntity: AppGoodsInfoFetchEntity!
    var insufficientEntity: AppGoodsInfoFetchEntity!

    override func setUpWithError() throws {
        super.setUp()
        completeEntity = AppGoodsInfoEntityObjectMother.getAppGoodsInfoFetchEntityWithCompleteData()
        insufficientEntity = AppGoodsInfoEntityObjectMother.getAppGoodsInfoFetchEntityWithInsufficientData()
    }

    override func tearDownWithError() throws {
        super.tearDown()

        completeEntity = nil
        insufficientEntity = nil
    }

    // MARK: 판매가격과 할인가격의 값을 비교하여 할인 여부를 판단한다.
    func test_Should_Success_To_Compare_Between_DiscountPrice_And_SalePrice() {
        // given
        let expectation = false
        // when
        let model = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: completeEntity)
        let itemModel = model.data.first!
        let discountPrice = itemModel.discountPrice
        let salePrice = itemModel.salePrice

        // then
        XCTAssertEqual(discountPrice, salePrice)
        XCTAssertEqual(expectation, itemModel.isDiscounted())
    }

    // MARK: 할인가격과 판매가격이 다를 경우 할인율을 계산한다.
    // discountPrice = 10, salePrice = 70
    func test_Should_Success_To_Calculate_DiscountRatio_When_DiscountPrice_Is_Equal_to_SalePrice() {
        // given
        let expectation = 85
        // when
        let model = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: insufficientEntity)
        let itemModel = model.data.first!
        let discountPrice = itemModel.discountPrice
        let salePrice = itemModel.salePrice

        // then
        XCTAssertEqual(expectation, itemModel.getDiscountRatio())
    }

    // MARK: 필터링 된 상품의 이름이 반환된다.
    func test_Should_Success_To_FetchAppGoodsInfo_By_SearchValue() {
        // given
        let expectation = ""
        // when
        let model = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: completeEntity)
        let itemModel = model.data.first!
        let goodsOptionName = itemModel.goodsGroupOptionName
        let goodsNrm = itemModel.goodsNrm

        // then
        XCTAssertEqual(expectation, goodsOptionName)
        XCTAssertEqual(itemModel.getGoodsOptionName(), goodsNrm)
    }

    // MARK: goodsGroupOptionName값이 빈값인 경우 goodsNrm으로 대체한다.
    func test_Should_Success_To_Replace_goodsOptionName_With_goodsNrm_When_goodsOptionName_Is_Empty() {
        // given
        let expectation = ""
        // when
        let model = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: completeEntity)
        let itemModel = model.data.first!
        let goodsOptionName = itemModel.goodsGroupOptionName
        let goodsNrm = itemModel.goodsNrm

        // then
        XCTAssertEqual(expectation, goodsOptionName)
        XCTAssertEqual(itemModel.getGoodsOptionName(), goodsNrm)
    }

    // MARK: 전체 페이지가 현재 페이지보다 높으면서 2보다 큰 경우에서 TotalElement보다 fetch된 아이템이 작은경우 True
    func test_Should_Return_True_When_totalPage_Of_PaginationModel_Is_Higher_than_CurrentPage_And_TotalPage_Is_Higher_Than_2() {
        // given
        let currentItems = AppGoodsInfoModelObjectMother.getAppGoodsInfoFetchItemModelListWithCompleteData(count: 10)
        let expectation = true

        // when
        let model = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: completeEntity)
        let paginationModel = model.pagination

        // then
        XCTAssertEqual(expectation, paginationModel.hasNext(items: currentItems.count))
    }

    // MARK: 전체 페이지가 1개 일 때, 현재 아이템의 개수가 totalElement와 같은 경우 False
    func test_Should_Return_False_When_totalPage_Of_PaginationModel_Is_OnePage_And_TotalElements_Is_Equal_To_ItemCount() {
        // given
        let currentItems = AppGoodsInfoModelObjectMother.getAppGoodsInfoFetchItemModelListWithCompleteData(count: 47)
        let expectation = false

        // when
        let model = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: completeEntity)
        var paginationModel = model.pagination

        // then
        XCTAssertEqual(expectation, paginationModel.hasNext(items: currentItems.count))
    }

    // MARK: 모든 필드가 채워진 Entity가 ModelMapper를 통해 정상적으로 값이 매핑된다.
    func test_Should_Success_To_ConvertToModel_When_Complete_Entity_Is_Presented() {
        // given
        // when
        let model = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: completeEntity)
        let itemModel = model.data.first!
        // then
        XCTAssertTrue(type(of: model) == AppGoodsInfoFetchModel.self)
        XCTAssertEqual(itemModel.cancelApplicationDate, "")
        XCTAssertEqual(itemModel.cancelOrderNo, "")
        XCTAssertEqual(itemModel.discountPrice, 1650)
        XCTAssertEqual(itemModel.deleteYn, "N")
        XCTAssertEqual(itemModel.deliveryCompletedDate, "")
        XCTAssertEqual(itemModel.goodsBadgeImagePath, "")
        XCTAssertEqual(itemModel.goodsBadgeSequence, 0)
        XCTAssertEqual(itemModel.goodsCode, "PAA00046")
        XCTAssertEqual(itemModel.goodsCountQuantity, 1)
        XCTAssertEqual(itemModel.goodsDisplayYn, "Y")
        XCTAssertEqual(itemModel.goodsGroupCode, "PG000104")
        XCTAssertEqual(itemModel.goodsGroupName, "무우 1개")
        XCTAssertEqual(itemModel.goodsGroupOptionName, "")
        XCTAssertEqual(itemModel.goodsGroupOptionSequence, 0)
        XCTAssertEqual(itemModel.goodsGroupOptionValue, "")
        XCTAssertEqual(itemModel.goodsName, "무우_1개_국내산")
        XCTAssertEqual(itemModel.goodsOrderNo, "")
        XCTAssertEqual(itemModel.goodsNrm, "1개")
        XCTAssertEqual(itemModel.goodsOptionUseYn, "")
        XCTAssertEqual(itemModel.goodsState, "판매중")
        XCTAssertEqual(itemModel.goodsSupplementImageSequence, 3863)
        XCTAssertEqual(itemModel.imagePath, "goods-info/PG000104/PAA00046/1a6fc5ab-f10b-4b7c-80b1-1ba32196c5e2.jpg".makeImageURLString())
        XCTAssertEqual(itemModel.maxBuyQuantity, 999)
        XCTAssertEqual(itemModel.minBuyQuantity, 1)
        XCTAssertEqual(itemModel.minorBuyYn, "Y")
        XCTAssertEqual(itemModel.orderExchangeRtgsOrderNo, "")
        XCTAssertEqual(itemModel.supplyPrice, 1650)
        XCTAssertEqual(itemModel.salePrice, 1650)
        XCTAssertEqual(itemModel.taxationYn, "N")
        XCTAssertEqual(itemModel.temperatureCode, "")
    }

    // MARK: 모든 필드가 Default Value로 채워진 Entity가 ModelMapper 메소드를 통해 기본값이 채워진 Model을 반환한다.
    func test_Should_Success_To_ConvertToDefaultModel_When_Insufficient_Entity_Is_Presented() {
        // given
        // when
        let model = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: insufficientEntity)
        let itemModel = model.data.first!
        // then
        XCTAssertTrue(type(of: model) == AppGoodsInfoFetchModel.self)
        XCTAssertEqual(itemModel.cancelApplicationDate, "")
        XCTAssertEqual(itemModel.cancelOrderNo, "")
        XCTAssertEqual(itemModel.discountPrice, 10)
        XCTAssertEqual(itemModel.deleteYn, "")
        XCTAssertEqual(itemModel.deliveryCompletedDate, "")
        XCTAssertEqual(itemModel.goodsBadgeImagePath, "")
        XCTAssertEqual(itemModel.goodsBadgeSequence, 0)
        XCTAssertEqual(itemModel.goodsCode, "")
        XCTAssertEqual(itemModel.goodsCountQuantity, 1)
        XCTAssertEqual(itemModel.goodsDisplayYn, "")
        XCTAssertEqual(itemModel.goodsGroupCode, "")
        XCTAssertEqual(itemModel.goodsGroupName, "")
        XCTAssertEqual(itemModel.goodsGroupOptionName, "")
        XCTAssertEqual(itemModel.goodsGroupOptionSequence, 0)
        XCTAssertEqual(itemModel.goodsGroupOptionValue, "")
        XCTAssertEqual(itemModel.goodsName, "")
        XCTAssertEqual(itemModel.goodsOrderNo, "")
        XCTAssertEqual(itemModel.goodsNrm, "")
        XCTAssertEqual(itemModel.goodsOptionUseYn, "")
        XCTAssertEqual(itemModel.goodsState, "")
        XCTAssertEqual(itemModel.goodsSupplementImageSequence, 0)
        XCTAssertEqual(itemModel.imagePath, "")
        XCTAssertEqual(itemModel.maxBuyQuantity, 0)
        XCTAssertEqual(itemModel.minBuyQuantity, 0)
        XCTAssertEqual(itemModel.minorBuyYn, "")
        XCTAssertEqual(itemModel.orderExchangeRtgsOrderNo, "")
        XCTAssertEqual(itemModel.supplyPrice, 70)
        XCTAssertEqual(itemModel.salePrice, 70)
        XCTAssertEqual(itemModel.taxationYn, "")
        XCTAssertEqual(itemModel.temperatureCode, "")
    }
}
