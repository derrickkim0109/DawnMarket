//
//  AppDisplayClassInfoFetchRepositoryTests.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
import Moya
@testable import TimFresh_Assignment

final class AppDisplayClassInfoFetchRepositoryTests: XCTestCase {
    var mockDataSource: MockAppDisplayClassInfoDataSource!
    var repository: AppDisplayClassInfoFetchRepositoryInterface!

    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        mockDataSource = MockAppDisplayClassInfoDataSource()
        repository = AppDisplayClassInfoFetchRepository(dataSource: mockDataSource)
    }

    override func tearDownWithError() throws {
        super.tearDown()

        mockDataSource = nil
        repository = nil
    }

    //MARK: 정상적으로 카테고리 대분류를 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppDisplayClassInfoList() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 대분류 조회 성공")

        // when
        repository.fetchAppDisplayClassInfoList()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { entity in
                XCTAssertTrue(type(of: entity) == AppDisplayClassInfoFetchEntity.self)
            }
            .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }

    //MARK: Error로 인해 카테고리 대분류를 불러오는데 실패한다.
    func test_Should_Fail_To_FetchAppDisplayClassInfoList_When_ServerError() {
        // given
        mockDataSource.scenario = .failure

        let expectation = XCTestExpectation(description: "Server Error로 인한 API 실패")

        // when
        repository.fetchAppDisplayClassInfoList()
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

    func test_Should_Fail_To_FetchAppDisplayClassInfoList_When_BadRequestError() {
        // given
        mockDataSource.scenario = .failure
        mockDataSource.networkError = MoyaError.statusCode(Response(statusCode: 400, data: Data()))

        let expectation = XCTestExpectation(description: "Bad Request로 인한 API 실패")

        // when
        repository.fetchAppDisplayClassInfoList()
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
