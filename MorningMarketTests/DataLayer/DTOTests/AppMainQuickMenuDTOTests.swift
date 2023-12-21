//
//  AppMainQuickMenuDTOTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/27/23.
//

import XCTest
@testable import MorningMarket

final class AppMainQuickMenuDTOTests: XCTestCase {
    var completeDataDTO: ListResultAppMainQuickMenuResponseDTO!
    var insufficientDataDTO: ListResultAppMainQuickMenuResponseDTO!

    override func setUpWithError() throws {
        super.setUp()
        completeDataDTO = AppMainQuickMenuDTOObjectMother.getListResultAppMainQuickMenuResponseDTOWithCompleteData()
        insufficientDataDTO = AppMainQuickMenuDTOObjectMother.getListResultAppMainQuickMenuResponseDTOWithInsufficientData()
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
        XCTAssertTrue(type(of: domainEntity) == AppMainQuickMenuFetchEntity.self)
        XCTAssertEqual(domainEntity.data.first?.quickMenuConceptScreenIdentifier, "DPPL230910")
        XCTAssertEqual(domainEntity.data.first?.quickMenuConceptScreenName, "기획전")
        XCTAssertEqual(domainEntity.data.first?.quickMenuMovingScreenPath, "")
        XCTAssertEqual(domainEntity.data.first?.quickMenuName, "농산물")
        XCTAssertEqual(domainEntity.data.first?.quickMenuSequence, 9)
        XCTAssertEqual(domainEntity.data.first?.quickMenuImagePath, "quick-menu-info/9/6a9974c9-c322-4831-95a3-48e5e6d8f451.png")

    }

    // MARK: 모든 필드가 nil로 채워진 DTO가 toEntity() 메소드를 통해 기본값이 채워진 Entity를 반환한다.
    func test_Should_Success_To_ConvertToDefaultEntity_When_Insufficient_DTO_Is_Presented() {
        // given
        // when
        let domainEntity = insufficientDataDTO.toEntity()
        // then
        XCTAssertTrue(type(of: domainEntity) == AppMainQuickMenuFetchEntity.self)
        XCTAssertEqual(domainEntity.data.first?.quickMenuConceptScreenIdentifier, "")
        XCTAssertEqual(domainEntity.data.first?.quickMenuConceptScreenName, "")
        XCTAssertEqual(domainEntity.data.first?.quickMenuMovingScreenPath, "")
        XCTAssertEqual(domainEntity.data.first?.quickMenuName, "")
        XCTAssertEqual(domainEntity.data.first?.quickMenuSequence, 0)
        XCTAssertEqual(domainEntity.data.first?.quickMenuImagePath, "")
    }
}
