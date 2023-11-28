//
//  AppDisplayClassInfoDataSourceTests.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
@testable import TimFresh_Assignment

final class AppDisplayClassInfoDataSourceTests: XCTestCase {
    var datasource: MockAppDisplayClassInfoDataSource!
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        datasource = MockAppDisplayClassInfoDataSource()
    }

    override func tearDownWithError() throws {
        super.tearDown()

        datasource = nil
    }

    //MARK: 카테고리 대분류를 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppDisplayClassInfoList() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 대분류 조회 성공")

        // when
        datasource.fetchAppDisplayClassInfoList()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { appDisplayClassDTO in
                XCTAssertTrue(type(of: appDisplayClassDTO) == ListResultAppDisplayClassInfoResponseDTO.self)
            }
            .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }

    //MARK: Error로 인해 카테고리 대분류를 불러오는데 실패한다.
    func test_Should_Fail_To_FetchAppDisplayClassInfoList_When_ServerError() {
        // given
        let expectation = XCTestExpectation(description: "ServerError로 인한 API 실패")
        datasource.scenario = .failure

        // when
        datasource.fetchAppDisplayClassInfoList()
            .sink { completion in
                switch completion {
                case .failure:
                    expectation.fulfill()
                case .finished:
                    XCTFail()

                }
            } receiveValue: { _ in
                XCTFail()
            }
            .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }
}
