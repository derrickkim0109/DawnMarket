//
//  AppMainQuickMenuFetchUseCaseTests.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
import Moya
@testable import TimFresh_Assignment

final class AppMainQuickMenuFetchUseCaseTests: XCTestCase {
    var mockRepository: MockAppMainQuickMenuFetchRepository!
    var useCase: AppMainQuickMenuFetchUseCaseInterface!

    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        mockRepository = MockAppMainQuickMenuFetchRepository()
        useCase = AppMainQuickMenuFetchUseCase(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        super.tearDown()

        mockRepository = nil
        useCase = nil
    }

    //MARK: 퀵메뉴 조회에 성공한다.
    func test_Should_Success_To_FetchAppMainQuickMenuList() {
        // given
        let expectation = XCTestExpectation(description: "퀵메뉴  조회 성공")

        // when
        useCase.fetch()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.rawValue)
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

    //MARK: 유효하지 않은 서버일 경우 failToFindAppMainQuickMenuList Error를 리턴한다.
    func test_Should_Fail_To_FetchAppMainQuickMenuList_When_Server_Is_Invalid() {
        // given
        let expectation = XCTestExpectation(description: "유효하지 않은 서버로 인한 검색 실패")
        mockRepository.scenario = .failure

        // when
        useCase.fetch()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertEqual(error, .failToFindAppMainQuickMenuList)
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
