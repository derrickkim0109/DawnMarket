//
//  AppMainQuickMenuFetchDataSourceTests.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
import Moya
@testable import TimFresh_Assignment

final class AppMainQuickMenuFetchDataSourceTests: XCTestCase {
    var datasource: MockAppMainQuickMenuFetchDataSource!
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        datasource = MockAppMainQuickMenuFetchDataSource()
    }

    override func tearDownWithError() throws {
        super.tearDown()

        datasource = nil
    }

    //MARK: 퀵 메뉴를 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppMainQuickMenuList() {
        // given
        let expectation = XCTestExpectation(description: "퀵 메뉴 조회 성공")

        // when
        datasource.fetchAppMainQuickMenuList()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { appMainQuickMenuResponseDTO in
                XCTAssertTrue(type(of: appMainQuickMenuResponseDTO) == ListResultAppMainQuickMenuResponseDTO.self)
            }
            .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }

    //MARK: Error로 인해 퀵 메뉴를 불러오는데 실패한다.
    func test_Should_Fail_To_FetchAppMainQuickMenuList_When_ServerError() {
        // given
        let expectation = XCTestExpectation(description: "ServerError로 인한 API 실패")
        datasource.scenario = .failure

        // when
        datasource.fetchAppMainQuickMenuList()
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
