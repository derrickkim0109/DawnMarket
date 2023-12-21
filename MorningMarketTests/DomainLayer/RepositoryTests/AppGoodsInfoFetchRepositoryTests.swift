//
//  AppGoodsInfoFetchRepositoryTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
import Moya
@testable import MorningMarket

final class AppGoodsInfoFetchRepositoryTests: XCTestCase {
    var mockDataSource: MockAppGoodsInfoFetchRepositoryDataSource!
    var repository: AppGoodsInfoRepositoryInterface!

    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        mockDataSource = MockAppGoodsInfoFetchRepositoryDataSource()
        repository = AppGoodsInfoRepository(dataSource: mockDataSource)
    }

    override func tearDownWithError() throws {
        super.tearDown()

        mockDataSource = nil
        repository = nil
    }

    //MARK: 정상적으로 카테고리 하위목록을 불러오는데 성공한다.
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
        repository.fetch(requestDTO: requestDTO)
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

        mockDataSource.scenario = .failure

        // when
        repository.fetch(requestDTO: requestDTO)
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

        mockDataSource.scenario = .failure
        mockDataSource.networkError = MoyaError.statusCode(Response(statusCode: 400, data: Data()))

        // when
        repository.fetch(requestDTO: requestDTO)
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
