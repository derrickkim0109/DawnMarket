//
//  AppDisplayBySubClassFetchDataSourceTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 11/28/23.
//

import XCTest
import Combine
@testable import MorningMarket

final class AppDisplayBySubClassFetchDataSourceTests: XCTestCase {
    var datasource: MockAppDisplayBySubClassFetchDataSource!
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()

    override func setUpWithError() throws {
        super.setUp()

        datasource = MockAppDisplayBySubClassFetchDataSource()
    }

    override func tearDownWithError() throws {
        super.tearDown()

        datasource = nil
    }

    //MARK: 카테고리 하위목록을 불러오는데 성공한다.
    func test_Should_Success_To_FetchSubDisplayClassInfo() {
        // given
        let expectation = XCTestExpectation(description: "카테고리 하위목록 조회 성공")
        let requestDTO = AppDisplayClassInfoBySubDisplayClassInfoRequestDTO(
            displayClassSequence: 52
        )

        // when
        datasource.fetch(requestDTO: requestDTO)
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
        datasource.fetch(requestDTO: requestDTO)
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
