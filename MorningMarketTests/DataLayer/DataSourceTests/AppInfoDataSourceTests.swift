//
//  AppInfoDataSourceTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
@testable import MorningMarket

final class AppInfoDataSourceTests: XCTestCase {
    var datasource: MockAppInfoDataSource!
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        datasource = MockAppInfoDataSource()
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
        datasource.fetchAppDisplayClassInfo()
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
        datasource.fetchAppDisplayClassInfo()
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

    //MARK: 퀵 메뉴를 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppMainQuickMenuList() {
        // given
        let expectation = XCTestExpectation(description: "퀵 메뉴 조회 성공")

        // when
        datasource.fetchAppMainQuickMenu()
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
        datasource.fetchAppMainQuickMenu()
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

    //MARK: 카테고리 하위목록을 불러오는데 성공한다.
    func test_Should_Success_To_FetchSubDisplayClassInfo() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 하위목록 조회 성공")
        let requestDTO = AppDisplayClassInfoBySubDisplayClassInfoRequestDTO(
            displayClassSequence: 52
        )

        // when
        datasource.fetchAppDisplayBySubClass(requestDTO: requestDTO)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { appSubDisplayClassInfoDTO in
                XCTAssertTrue(type(of: appSubDisplayClassInfoDTO) ==
                    SingleResultAppDisplayClassInfoBySubDisplayClassInfoResponseDTO.self)
            }
            .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }

    //MARK: Error로 인해 카테고리 하위목록을 불러오는데 실패한다.
    func test_Should_Fail_To_FetchSubDisplayClassInfo_When_ServerError() {
        // given
        let expectation = XCTestExpectation(description: "ServerError로 인한 API 실패")
        let requestDTO = AppDisplayClassInfoBySubDisplayClassInfoRequestDTO(
            displayClassSequence: 52
        )
        datasource.scenario = .failure

        // when
        datasource.fetchAppDisplayBySubClass(requestDTO: requestDTO)
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

    //MARK: 카테고리 상품목록을 불러오는데 성공한다.
    func test_Should_Success_To_FetchAppGoodsInfo() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 하위목록 조회 성공")
        let pageRequest = AppGoodsInfoFetchRequestDTO.PageRequest(
            page: 0,
            size: 20
        )

        let requestDTO = AppGoodsInfoFetchRequestDTO(
            displayClassSequence: 51,
            subDisplayClassSequence: 0,
            pageRequest: pageRequest,
            searchValue: "추천순"
        )

        // when
        datasource.fetchAppGoodsInfo(requestDTO: requestDTO)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { appGoodsInfoDTO in
                XCTAssertTrue(type(of: appGoodsInfoDTO) ==
                    PageResponseAppGoodsInfoResponseDTO.self)
            }
            .store(in: &cancellable)

        // then
        wait(for: [expectation], timeout: 5)
    }

    //MARK: Error로 인해 카테고리 상품목록을 불러오는데 실패한다.
    func test_Should_Fail_To_FetchAppGoodsInfo_When_ServerError() {
        // given
        let expectation = XCTestExpectation(description: "ServerError로 인한 API 실패")
        let pageRequest = AppGoodsInfoFetchRequestDTO.PageRequest(
            page: 0,
            size: 20
        )

        let requestDTO = AppGoodsInfoFetchRequestDTO(
            displayClassSequence: 51,
            subDisplayClassSequence: 0,
            pageRequest: pageRequest,
            searchValue: "추천순"
        )

        datasource.scenario = .failure

        // when
        datasource.fetchAppGoodsInfo(requestDTO: requestDTO)
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
