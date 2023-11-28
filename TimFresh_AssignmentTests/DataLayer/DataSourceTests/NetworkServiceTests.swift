//
//  NetworkServiceTests.swift
//  TimFresh_AssignmentTests
//
//  Created by Derrick kim on 11/27/23.
//

import XCTest
import Moya
@testable import TimFresh_Assignment

final class NetworkServiceTests: XCTestCase {
    private var provider: MoyaProvider<TestAPI>!

    override func setUpWithError() throws {
        super.setUp()

        provider = MoyaProvider<TestAPI>(stubClosure: MoyaProvider.immediatelyStub)
    }

    override func tearDownWithError() throws {
        super.tearDown()

        provider = nil
    }

    func testCombineRequest_success() {
        let testTarget: TestAPI = .test
        let expectedResponseData = testTarget.sampleData

        let expectation = XCTestExpectation(description: "Receive response")
        let cancellable = provider.requestPublisher(testTarget)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Request failed with error: \(error)")
                }
                expectation.fulfill()
            } receiveValue: { response in
                let responseData = response.data
                XCTAssertEqual(responseData, expectedResponseData, "Response data does not match expected data.")
            }

        wait(for: [expectation], timeout: 1)
        cancellable.cancel()
    }

    func testCombineRequest_failure() {
        setupErrorStub()

        let testTarget: TestAPI = .test
        let expectation = XCTestExpectation(description: "Receive response")
        let cancellable = provider.requestPublisher(testTarget)
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail("Request should have failed but it succeeded.")
                case .failure:
                    break
                }
                expectation.fulfill()
            } receiveValue: { _ in
                XCTFail("Request should have failed but it received a value.")
            }

        wait(for: [expectation], timeout: 1.0)
        cancellable.cancel()
    }

    private func setupErrorStub() {
        let stubbedError = MoyaError.stringMapping(Response(statusCode: 400, data: Data()))

        let endpointClosure = { (target: TestAPI) -> Endpoint in
            return Endpoint(
                url: URL(target: target).absoluteString,
                sampleResponseClosure: { .networkError(stubbedError as NSError) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }

        provider = MoyaProvider<TestAPI>(
            endpointClosure: endpointClosure,
            stubClosure: MoyaProvider.immediatelyStub
        )
    }
}
