//
//  AppDisplayBySubClassDTOTests.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/27/23.
//

import XCTest
@testable import TimFresh_Assignment

final class AppDisplayBySubClassDTOTests: XCTestCase {
    var completeDataDTO: SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO!
    var insufficientDataDTO: SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO!

    override func setUpWithError() throws {
        super.setUp()
        completeDataDTO = AppDisplayBySubClassDTOObjectMother.getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithCompleteData()
        insufficientDataDTO = AppDisplayBySubClassDTOObjectMother.getSingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTOWithInsufficientData()
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
        XCTAssertTrue(type(of: domainEntity) == AppDisplayClassInfoBySubDisplayClassFetchEntity.self)
        XCTAssertEqual(domainEntity.data.displayClassName, "농축수산물")
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.displayClassCode, "DPDCM23091")
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.displayClassLevel, "중분류")
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.parentsDisplayClassSequence, 51)
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.displayClassSequence, 52)
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.subDisplayClassName, "채소과일")
    }

    // MARK: 모든 필드가 nil로 채워진 DTO가 toEntity() 메소드를 통해 기본값이 채워진 Entity를 반환한다.
    func test_Should_Success_To_ConvertToDefaultEntity_When_Insufficient_DTO_Is_Presented() {
        // given
        // when
        let domainEntity = insufficientDataDTO.toEntity()
        // then
        XCTAssertTrue(type(of: domainEntity) == AppDisplayClassInfoBySubDisplayClassFetchEntity.self)
        XCTAssertEqual(domainEntity.data.displayClassName, "농축수산물")
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.displayClassCode, "")
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.displayClassLevel, "")
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.parentsDisplayClassSequence, 0)
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.displayClassSequence, 0)
        XCTAssertEqual(domainEntity.data.appSubDisplayClassInfoList.first?.subDisplayClassName, "")
    }
}
