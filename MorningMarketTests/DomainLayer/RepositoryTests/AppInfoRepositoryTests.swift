//
//  AppInfoRepositoryTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
import Moya
@testable import MorningMarket

final class AppInfoRepositoryTests: XCTestCase {
    var mockDataSource: MockAppInfoDataSource!
    var repository: AppInfoRepositoryInterface!

    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        mockDataSource = MockAppInfoDataSource()
        repository = AppInfoRepository(dataSource: mockDataSource)
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
        repository.fetchAppDisplayClassInfo()
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
        repository.fetchAppDisplayClassInfo()
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
        repository.fetchAppDisplayClassInfo()
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

    //MARK: 정상적으로 퀵 메뉴를 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppMainQuickMenuList() {
        // given
        let expectation = XCTestExpectation(description: "퀵 메뉴 조회 성공")

        // when
        repository.fetchAppMainQuickMenu()
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
        repository.fetchAppMainQuickMenu()
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
        repository.fetchAppMainQuickMenu()
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

    //MARK: 정상적으로 카테고리 하위목록을 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppSubDisplayClassInfo() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 하위목록 조회 성공")
        let displayClassSequence: Int64 = 52

        // when
        repository.fetchAppDisplayBySubClass(displayClassSequence: displayClassSequence)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { entity in
                XCTAssertTrue(type(of: entity) == AppDisplayClassInfoBySubDisplayClassFetchEntity.self)
            }
            .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }

    //MARK: Error로 인해 카테고리 하위목록을 불러오는데 실패한다.
    func test_Should_Fail_To_FetchAppSubDisplayClassInfo_When_ServerError() {
        // given
        let expectation = XCTestExpectation(description: "Server Error로 인한 API 실패")
        let displayClassSequence: Int64 = 52

        mockDataSource.scenario = .failure

        // when
        repository.fetchAppDisplayBySubClass(displayClassSequence: displayClassSequence)
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

    func test_Should_Fail_To_FetchAppSubDisplayClassInfo_When_BadRequestError() {
        // given
        let expectation = XCTestExpectation(description: "Bad Request로 인한 API 실패")
        let displayClassSequence: Int64 = 52

        mockDataSource.scenario = .failure
        mockDataSource.networkError = MoyaError.statusCode(Response(statusCode: 400, data: Data()))

        // when
        repository.fetchAppDisplayBySubClass(displayClassSequence: displayClassSequence)
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

    //MARK: 정상적으로 카테고리 하위목록을 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppGoodsInfo() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 하위목록 조회 성공")

        // when
        repository.fetchAppGoodsInfo(
            displayClassSequence: 51,
            subDisplayClassSequence: 0,
            page: 0,
            size: 20,
            searchValue: "추천순"
        )
        .sink { completion in
            switch completion {
            case let .failure(error):
                XCTFail(error.localizedDescription)
            case .finished:
                expectation.fulfill()
            }
        } receiveValue: { entity in
            XCTAssertTrue(type(of: entity) == AppGoodsInfoFetchEntity.self)
        }
        .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }

    //MARK: Error로 인해 카테고리 하위목록을 불러오는데 실패한다.
    func test_Should_Fail_To_FetchAppGoodsInfo_When_ServerError() {
        // given
        let expectation = XCTestExpectation(description: "Server Error로 인한 API 실패")

        mockDataSource.scenario = .failure

        // when
        repository.fetchAppGoodsInfo(
            displayClassSequence: 51,
            subDisplayClassSequence: 0,
            page: 0,
            size: 20,
            searchValue: "추천순"
        )
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

    func test_Should_Fail_To_FetchAppGoodsInfo_When_BadRequestError() {
        // given
        let expectation = XCTestExpectation(description: "Bad Request로 인한 API 실패")

        mockDataSource.scenario = .failure
        mockDataSource.networkError = MoyaError.statusCode(Response(statusCode: 400, data: Data()))

        // when
        repository.fetchAppGoodsInfo(
            displayClassSequence: 51,
            subDisplayClassSequence: 0,
            page: 0,
            size: 20,
            searchValue: "추천순"
        )
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
