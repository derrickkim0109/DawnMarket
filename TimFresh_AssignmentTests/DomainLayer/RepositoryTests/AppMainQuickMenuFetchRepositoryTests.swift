//
//  AppMainQuickMenuFetchRepositoryTests.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
import Moya
@testable import TimFresh_Assignment

final class AppMainQuickMenuFetchRepositoryTests: XCTestCase {
    var mockDataSource: MockAppMainQuickMenuFetchDataSource!
    var repository: AppMainQuickMenuRepositoryInterface!

    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        mockDataSource = MockAppMainQuickMenuFetchDataSource()
        repository = AppMainQuickMenuRepository(dataSource: mockDataSource)
    }

    override func tearDownWithError() throws {
        super.tearDown()

        mockDataSource = nil
        repository = nil
    }

    //MARK: 정상적으로 퀵 메뉴를 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppMainQuickMenuList() {
        // given
        let expectation = XCTestExpectation(description: "퀵 메뉴 조회 성공")

        // when
        repository.fetch()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { entity in
                XCTAssertTrue(type(of: entity) == AppMainQuickMenuFetchEntity.self)
            }
            .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }

    //MARK: Error로 인해 퀵 메뉴를 불러오는데 실패한다.
    func test_Should_Fail_To_FetchAppMainQuickMenuList_When_ServerError() {
        // given
        mockDataSource.scenario = .failure

        let expectation = XCTestExpectation(description: "Server Error로 인한 API 실패")

        // when
        repository.fetch()
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

    func test_Should_Fail_To_FetchAppMainQuickMenuList_When_BadRequestError() {
        // given
        mockDataSource.scenario = .failure
        mockDataSource.networkError = MoyaError.statusCode(Response(statusCode: 400, data: Data()))

        let expectation = XCTestExpectation(description: "Bad Request로 인한 API 실패")

        // when
        repository.fetch()
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
