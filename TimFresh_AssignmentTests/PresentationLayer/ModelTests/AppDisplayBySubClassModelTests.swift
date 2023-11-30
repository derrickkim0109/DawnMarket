//
//  AppDisplayBySubClassModelTests.swift
//  TimFresh_AssignmentTests
//
//  Created by derrick on 11/30/23.
//

import XCTest
@testable import TimFresh_Assignment

final class AppDisplayBySubClassModelTests: XCTestCase {
    var completeEntity: AppDisplayClassInfoBySubDisplayClassFetchEntity!
    var insufficientEntity: AppDisplayClassInfoBySubDisplayClassFetchEntity!

    override func setUpWithError() throws {
        super.setUp()
        completeEntity = AppDisplayBySubClassEntityObjectMother.getAppDisplayClassInfoBySubDisplayClassFetchEntityWithCompleteData()
        insufficientEntity = AppDisplayBySubClassEntityObjectMother.getAppDisplayClassInfoBySubDisplayClassFetchEntityWithInsufficientData()
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
        let model = AppDisplayClassInfoBySubDisplayClassFetchModelMapper.toPresentationModel(entity: completeEntity)
        let itemModel = model.data.appSubDisplayClassInfoList.first!
        // then
        XCTAssertTrue(type(of: model) == AppDisplayClassInfoBySubDisplayClassFetchModel.self)
        XCTAssertEqual(itemModel.displayClassSequence, 0)
        XCTAssertEqual(itemModel.subDisplayClassName, "상품 전체")
        XCTAssertEqual(itemModel.displayClassCode, "DPDCM23091")
        XCTAssertEqual(itemModel.displayClassLevel, "중분류")
        XCTAssertEqual(itemModel.parentsDisplayClassSequence, 51)
    }
    
    // MARK: 모든 필드가 Default Value로 채워진 Entity가 ModelMapper 메소드를 통해 기본값이 채워진 Model을 반환한다.
    func test_Should_Success_To_ConvertToDefaultModel_When_Insufficient_Entity_Is_Presented() {
        // given
        // when
        let model = AppDisplayClassInfoBySubDisplayClassFetchModelMapper.toPresentationModel(entity: insufficientEntity)
        let itemModel = model.data.appSubDisplayClassInfoList.first!
        // then
        XCTAssertTrue(type(of: model) == AppDisplayClassInfoBySubDisplayClassFetchModel.self)
        XCTAssertEqual(itemModel.displayClassSequence, 0)
        XCTAssertEqual(itemModel.subDisplayClassName, "상품 전체")
        XCTAssertEqual(itemModel.displayClassCode, "")
        XCTAssertEqual(itemModel.displayClassLevel, "")
        XCTAssertEqual(itemModel.parentsDisplayClassSequence, 0)
    }
}
