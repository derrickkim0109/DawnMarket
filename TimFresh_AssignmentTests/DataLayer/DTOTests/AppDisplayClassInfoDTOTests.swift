//
//  AppDisplayClassInfoDTOTests.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/26/23.
//

import XCTest
@testable import TimFresh_Assignment

final class AppDisplayClassInfoDTOTests: XCTestCase {
    var completeDataDTO: ListResultAppDisplayClassInfoResponseDTO!
    var insufficientDataDTO: ListResultAppDisplayClassInfoResponseDTO!

    override func setUpWithError() throws {
        super.setUp()
        completeDataDTO = AppDisplayClassDTOObjectMother.getListResultAppDisplayClassInfoResponseDTOWithCompleteData()
        insufficientDataDTO = AppDisplayClassDTOObjectMother.getListResultAppDisplayClassInfoResponseDTOWithInsufficientData()
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
        XCTAssertTrue(type(of: domainEntity) == AppDisplayClassInfoFetchEntity.self)
        XCTAssertEqual(domainEntity.data.first?.displayClassCode, "DPDCH23097")
        XCTAssertEqual(domainEntity.data.first?.displayClassName, "농축수산물")
        XCTAssertEqual(domainEntity.data.first?.displayClassSequence, 51)
        XCTAssertEqual(domainEntity.data.first?.displayClassImagePath, "disp-clas-info/51/8703f654-207e-425f-8543-8b63f56f5e41.jpg")

    }

    // MARK: 모든 필드가 nil로 채워진 DTO가 toEntity() 메소드를 통해 기본값이 채워진 Entity를 반환한다.
    func test_Should_Success_To_ConvertToDefaultEntity_When_Insufficient_DTO_Is_Presented() {
        // given
        // when
        let domainEntity = insufficientDataDTO.toEntity()
        // then
        XCTAssertTrue(type(of: domainEntity) == AppDisplayClassInfoFetchEntity.self)
        XCTAssertEqual(domainEntity.data.first?.displayClassCode, "")
        XCTAssertEqual(domainEntity.data.first?.displayClassName, "")
        XCTAssertEqual(domainEntity.data.first?.displayClassSequence, 0)
        XCTAssertEqual(domainEntity.data.first?.displayClassImagePath, "")
    }
}
