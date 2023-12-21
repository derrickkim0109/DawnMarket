//
//  AppGoodsInfoDTOTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/27/23.
//

import XCTest
@testable import MorningMarket

final class AppGoodsInfoDTOTests: XCTestCase {
    var completeDataDTO: PageResponseAppGoodsInfoResponseDTO!
    var insufficientDataDTO: PageResponseAppGoodsInfoResponseDTO!

    override func setUpWithError() throws {
        super.setUp()
        completeDataDTO = AppGoodsInfoDTOObjectMother.getPageResponseAppGoodsInfoResponseDTOWithCompleteData()
        insufficientDataDTO = AppGoodsInfoDTOObjectMother.getPageResponseAppGoodsInfoResponseDTOWithInsufficientData()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        completeDataDTO = nil
        insufficientDataDTO = nil
    }

    // MARK: 모든 필드가 채워진 DTO가 toEntity() 메소드를 통해 정상적으로 값이 매핑된다.
    func test_Should_Success_To_ConvertToEntity_When_Complete_DTO_Is_Presented() {
        // given
        // when
        let domainEntity = completeDataDTO.toEntity()
        // then
        XCTAssertTrue(type(of: domainEntity) == AppGoodsInfoFetchEntity.self)
        XCTAssertEqual(domainEntity.data.first?.cancelApplicationDate, "")
        XCTAssertEqual(domainEntity.data.first?.cancelOrderNo, "")
        XCTAssertEqual(domainEntity.data.first?.deleteYn, "N")
        XCTAssertEqual(domainEntity.data.first?.deliveryCompletedDate, "")
        XCTAssertEqual(domainEntity.data.first?.discountPrice, 1650)
        XCTAssertEqual(domainEntity.data.first?.goodsBadgeImagePath, "")
        XCTAssertEqual(domainEntity.data.first?.goodsBadgeSequence, 0)
        XCTAssertEqual(domainEntity.data.first?.goodsCode, "PAA00046")
        XCTAssertEqual(domainEntity.data.first?.goodsCountQuantity, 1)
        XCTAssertEqual(domainEntity.data.first?.goodsDisplayYn, "Y")
        XCTAssertEqual(domainEntity.data.first?.goodsGroupCode, "PG000104")
        XCTAssertEqual(domainEntity.data.first?.goodsGroupName, "무우 1개")
        XCTAssertEqual(domainEntity.data.first?.goodsGroupOptionName, "")
        XCTAssertEqual(domainEntity.data.first?.goodsGroupOptionSequence, 0)
        XCTAssertEqual(domainEntity.data.first?.goodsGroupOptionValue, "")
        XCTAssertEqual(domainEntity.data.first?.goodsName, "무우_1개_국내산")
        XCTAssertEqual(domainEntity.data.first?.goodsNrm, "1개")
        XCTAssertEqual(domainEntity.data.first?.goodsOrderNo, "")
        XCTAssertEqual(domainEntity.data.first?.goodsOptionUseYn, "")
        XCTAssertEqual(domainEntity.data.first?.goodsState, "판매중")
        XCTAssertEqual(domainEntity.data.first?.goodsSupplementImageSequence, 3863)
        XCTAssertEqual(domainEntity.data.first?.imagePath, "goods-info/PG000104/PAA00046/1a6fc5ab-f10b-4b7c-80b1-1ba32196c5e2.jpg")
        XCTAssertEqual(domainEntity.data.first?.maxBuyQuantity, 999)
        XCTAssertEqual(domainEntity.data.first?.minBuyQuantity, 1)
        XCTAssertEqual(domainEntity.data.first?.minorBuyYn, "Y")
        XCTAssertEqual(domainEntity.data.first?.orderExchangeRtgsOrderNo, "")
        XCTAssertEqual(domainEntity.data.first?.salePrice, 1650)
        XCTAssertEqual(domainEntity.data.first?.supplyPrice, 1650)
        XCTAssertEqual(domainEntity.data.first?.taxationYn, "N")
        XCTAssertEqual(domainEntity.data.first?.temperatureCode, "")
    }

    // MARK: 모든 필드가 nil로 채워진 DTO가 toEntity() 메소드를 통해 기본값이 채워진 Entity를 반환한다.
    func test_Should_Success_To_ConvertToDefaultEntity_When_Insufficient_DTO_Is_Presented() {
        // given
        // when
        let domainEntity = insufficientDataDTO.toEntity()
        // then
        XCTAssertTrue(type(of: domainEntity) == AppGoodsInfoFetchEntity.self)
        XCTAssertEqual(domainEntity.data.first?.cancelApplicationDate, "")
        XCTAssertEqual(domainEntity.data.first?.cancelOrderNo, "")
        XCTAssertEqual(domainEntity.data.first?.deleteYn, "")
        XCTAssertEqual(domainEntity.data.first?.deliveryCompletedDate, "")
        XCTAssertEqual(domainEntity.data.first?.discountPrice, 0)
        XCTAssertEqual(domainEntity.data.first?.goodsBadgeImagePath, "")
        XCTAssertEqual(domainEntity.data.first?.goodsBadgeSequence, 0)
        XCTAssertEqual(domainEntity.data.first?.goodsCode, "")
        XCTAssertEqual(domainEntity.data.first?.goodsCountQuantity, 0)
        XCTAssertEqual(domainEntity.data.first?.goodsDisplayYn, "")
        XCTAssertEqual(domainEntity.data.first?.goodsGroupCode, "")
        XCTAssertEqual(domainEntity.data.first?.goodsGroupName, "")
        XCTAssertEqual(domainEntity.data.first?.goodsGroupOptionName, "")
        XCTAssertEqual(domainEntity.data.first?.goodsGroupOptionSequence, 0)
        XCTAssertEqual(domainEntity.data.first?.goodsGroupOptionValue, "")
        XCTAssertEqual(domainEntity.data.first?.goodsName, "")
        XCTAssertEqual(domainEntity.data.first?.goodsNrm, "")
        XCTAssertEqual(domainEntity.data.first?.goodsOrderNo, "")
        XCTAssertEqual(domainEntity.data.first?.goodsOptionUseYn, "")
        XCTAssertEqual(domainEntity.data.first?.goodsState, "")
        XCTAssertEqual(domainEntity.data.first?.goodsSupplementImageSequence, 0)
        XCTAssertEqual(domainEntity.data.first?.imagePath, "")
        XCTAssertEqual(domainEntity.data.first?.maxBuyQuantity, 0)
        XCTAssertEqual(domainEntity.data.first?.minBuyQuantity, 0)
        XCTAssertEqual(domainEntity.data.first?.minorBuyYn, "")
        XCTAssertEqual(domainEntity.data.first?.orderExchangeRtgsOrderNo, "")
        XCTAssertEqual(domainEntity.data.first?.salePrice, 0)
        XCTAssertEqual(domainEntity.data.first?.supplyPrice, 0)
        XCTAssertEqual(domainEntity.data.first?.taxationYn, "")
        XCTAssertEqual(domainEntity.data.first?.temperatureCode, "")
    }
}
