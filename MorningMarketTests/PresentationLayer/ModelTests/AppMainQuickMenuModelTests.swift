//
//  AppMainQuickMenuModelTests.swift
//  MorningMarketTests
//
//  Created by derrick on 11/30/23.
//

import XCTest
@testable import MorningMarket

final class AppMainQuickMenuModelTests: XCTestCase {
    var completeEntity: AppMainQuickMenuFetchEntity!
    var insufficientEntity: AppMainQuickMenuFetchEntity!

    override func setUpWithError() throws {
        super.setUp()
        completeEntity = AppMainQuickMenuEntityObjectMother.getAppMainQuickMenuFetchEntityWithCompleteData()
        insufficientEntity = AppMainQuickMenuEntityObjectMother.getAppMainQuickMenuFetchEntityWithInsufficientData()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        completeEntity = nil
        insufficientEntity = nil
    }

    // MARK: 모든 필드가 채워진 Entity가 ModelMapper를 통해 정상적으로 값이 매핑된다.
    func test_Should_Success_To_ConvertToModel_When_Complete_Entity_Is_Presented() {
        // given
        // when
        let model = AppMainQuickMenuFetchModelMapper.toPresentationModel(entity: completeEntity)
        let itemModel = model.data.first!
        // then
        XCTAssertTrue(type(of: model) == AppMainQuickMenuFetchModel.self)
        XCTAssertEqual(itemModel.quickMenuName, "농산물")
        XCTAssertEqual(itemModel.quickMenuConceptScreenIdentifier, "DPPL230910")
        XCTAssertEqual(itemModel.quickMenuConceptScreenName, "기획전")
        XCTAssertEqual(itemModel.quickMenuMovingScreenPath, "")
        XCTAssertEqual(itemModel.quickMenuSequence, 9)
        XCTAssertEqual(itemModel.quickMenuImagePath, "https://d1afu5va4iy6dc.cloudfront.net/quick-menu-info/9/6a9974c9-c322-4831-95a3-48e5e6d8f451.png")
    }

    // MARK: 모든 필드가 Default Value로 채워진 Entity가 ModelMapper 메소드를 통해 기본값이 채워진 Model을 반환한다.
    func test_Should_Success_To_ConvertToDefaultModel_When_Insufficient_Entity_Is_Presented() {
        // given
        // when
        let model = AppMainQuickMenuFetchModelMapper.toPresentationModel(entity: insufficientEntity)
        let itemModel = model.data.first!
        // then
        XCTAssertTrue(type(of: model) == AppMainQuickMenuFetchModel.self)
        XCTAssertEqual(itemModel.quickMenuName, "")
        XCTAssertEqual(itemModel.quickMenuConceptScreenIdentifier, "")
        XCTAssertEqual(itemModel.quickMenuConceptScreenName, "")
        XCTAssertEqual(itemModel.quickMenuMovingScreenPath, "")
        XCTAssertEqual(itemModel.quickMenuSequence, 0)
        XCTAssertEqual(itemModel.quickMenuImagePath, "")
       }
}
