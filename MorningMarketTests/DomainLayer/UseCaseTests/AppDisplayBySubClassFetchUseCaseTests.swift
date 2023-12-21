//
//  AppDisplayBySubClassFetchUseCaseTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
import Moya
@testable import MorningMarket

final class AppDisplayBySubClassFetchUseCaseTests: XCTestCase {
    var mockRepository: MockAppDisplayBySubClassFetchRepository!
    var useCase: AppDisplayBySubClassFetchUseCaseInterface!

    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        mockRepository = MockAppDisplayBySubClassFetchRepository()
        useCase = AppDisplayBySubClassFetchUseCase(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        super.tearDown()

        mockRepository = nil
        useCase = nil
    }

    //MARK: 카테고리 하위목록 조회에 성공한다.
    func test_Should_Success_To_FetchAppDisplayBySubClassList() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 하위목록 조회 성공")
        let displaySequence = Int64(51)

        // when
        useCase.fetch(by: displaySequence)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.rawValue)
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

    //MARK: 유효하지 않은 DisplaySequence일 경우 failToFindAppDisplayBySubClass Error를 리턴한다.
    func test_Should_Fail_To_FetchAppDisplayBySubClassList_When_Server_Is_Invalid() {
        // given
        let expectation = XCTestExpectation(description: "유효하지 않은 서버로 인한 검색 실패")
        let displaySequence = Int64(512332132132131231)

        mockRepository.scenario = .failure

        // when
        useCase.fetch(by: displaySequence)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertEqual(error, .failToFindAppDisplayBySubClass)
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
