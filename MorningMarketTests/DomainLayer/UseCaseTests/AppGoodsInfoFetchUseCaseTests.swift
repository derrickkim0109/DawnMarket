//
//  AppGoodsInfoFetchUseCaseTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
import Moya
@testable import MorningMarket

final class AppGoodsInfoFetchUseCaseTests: XCTestCase {
    var mockRepository: MockAppGoodsInfoFetchRepository!
    var useCase: AppGoodsInfoFetchUseCaseInterface!

    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        mockRepository = MockAppGoodsInfoFetchRepository()
        useCase = AppGoodsInfoFetchUseCase(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        super.tearDown()

        mockRepository = nil
        useCase = nil
    }

    //MARK: 카테고리 상품 조회에 성공한다.
    func test_Should_Success_To_FetchAppGoodsInfo() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 상품 조회 성공")
        let requestValue = AppGoodsInfoFetchRequestValue(
            displayClassSequence: 54,
            subDisplayClassSequence: 51,
            page: 0,
            size: 20,
            searchValue: "추천순"
        )

        // when
        useCase.fetch(request: requestValue)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.rawValue)
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

    //MARK: 유효하지 않은 displayClassSequence일 경우 failToFindAppGoodsInfoList Error를 리턴한다.
    func test_Should_Fail_To_SearchAppByKeyword_When_Keyword_Is_Invalid() {
        // given
        let expectation = XCTestExpectation(description: "유효하지 않은 displayClassSequence로 조회 실패")
        let requestValue = AppGoodsInfoFetchRequestValue(
            displayClassSequence: 111111154,
            subDisplayClassSequence: 51,
            page: 0,
            size: 20,
            searchValue: "추천순"
        )
        mockRepository.scenario = .failure
        
        // when
        useCase.fetch(request: requestValue)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertEqual(error, .failToFindAppGoodsInfoList)
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
