//
//  AppDisplayClassInfoModelTests.swift
//  TimFresh_AssignmentTests
//
//  Created by derrick on 11/30/23.
//

import XCTest
@testable import TimFresh_Assignment

final class AppDisplayClassInfoModelTests: XCTestCase {
    var completeEntity: AppDisplayClassInfoFetchEntity!
    var insufficientEntity: AppDisplayClassInfoFetchEntity!

    override func setUpWithError() throws {
        super.setUp()
        completeEntity = AppDisplayClassEntityObjectMother.getAppDisplayClassInfoFetchEntityWithCompleteData()
        insufficientEntity = AppDisplayClassEntityObjectMother.getAppDisplayClassInfoFetchEntityWithInsufficientData()
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
        let model = AppDisplayClassInfoFetchModelMapper.toPresentationModel(entity: completeEntity)
        let itemModel = model.data.first!
        // then
        XCTAssertTrue(type(of: model) == AppDisplayClassInfoFetchModel.self)
        XCTAssertEqual(itemModel.displayClassCode, "DPDCH23097")
        XCTAssertEqual(itemModel.displayClassName, "농축수산물")
        XCTAssertEqual(itemModel.displayClassSequence, 51)
        XCTAssertEqual(itemModel.displayClassImagePath, "https://d1afu5va4iy6dc.cloudfront.net/disp-clas-info/51/8703f654-207e-425f-8543-8b63f56f5e41.jpg")
    }

    // MARK: 모든 필드가 Default Value로 채워진 Entity가 ModelMapper 메소드를 통해 기본값이 채워진 Model을 반환한다.
    func test_Should_Success_To_ConvertToDefaultModel_When_Insufficient_Entity_Is_Presented() {
        // given
        // when
        let model = AppDisplayClassInfoFetchModelMapper.toPresentationModel(entity: insufficientEntity)
        let itemModel = model.data.first!
        // then
        XCTAssertTrue(type(of: model) == AppDisplayClassInfoFetchModel.self)
        XCTAssertEqual(itemModel.displayClassCode, "")
        XCTAssertEqual(itemModel.displayClassName, "")
        XCTAssertEqual(itemModel.displayClassSequence, 0)
        XCTAssertEqual(itemModel.displayClassImagePath, "")
       }
}
