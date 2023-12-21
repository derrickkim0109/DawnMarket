//
//  CategoryViewModelTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 12/1/23.
//

import XCTest
@testable import MorningMarket

final class CategoryViewModelTests: XCTestCase {
    var viewModel: CategoryViewModel!
    var router: CategoryRouter!
    var mockAppDisplayClassInfoFetchUseCase: MockAppDisplayClassInfoFetchUseCase!
    var mockAppMainQuickMenuFetchUseCase: MockAppMainQuickMenuFetchUseCase!

    override func setUpWithError() throws {
        super.setUp()

        let categoryDIContainer: CategoryDIContainerInterface = CategoryDIContainer()
        router = CategoryRouter(categoryDIContainer: categoryDIContainer)
        mockAppDisplayClassInfoFetchUseCase = MockAppDisplayClassInfoFetchUseCase()
        mockAppMainQuickMenuFetchUseCase = MockAppMainQuickMenuFetchUseCase()

        viewModel = CategoryViewModel(
            router: router,
            appDisplayClassFetchUseCase: mockAppDisplayClassInfoFetchUseCase,
            appMainQuickMenuFetchUseCase: mockAppMainQuickMenuFetchUseCase
        )
    }
    
    override func tearDownWithError() throws {
        super.tearDown()

        router = nil
        mockAppDisplayClassInfoFetchUseCase = nil
        mockAppMainQuickMenuFetchUseCase = nil

        viewModel = nil
    }

    /*
     [성공]
     1. viewWillAppear 시점에 카테고리 대분류, 퀵메뉴 목록이 추가된다.
     */

    // MARK: viewWillAppear 시점에 카테고리 대분류 목록이 추가된다.
    func test_Should_Success_To_Get_AppDisplayClassList_When_ViewWillAppear() {
        // given
        // when
        viewModel.viewWillAppear()
        let fetchedAppDisplayClassList = viewModel.fetchedAppDisplayClassList
        // then
        XCTAssertNotNil(fetchedAppDisplayClassList)
    }

    // MARK: viewWillAppear 시점에 퀵 메뉴 목록이 추가된다.
    func test_Should_Success_To_Get_AppMainQuickMenuList_When_ViewWillAppear() {
        // given
        // when
        viewModel.viewWillAppear()
        let fetchedAppMainQuickMenuList = viewModel.fetchedAppMainQuickMenuList
        // then
        XCTAssertNotNil(fetchedAppMainQuickMenuList)
    }

    /*
     [실패]
     1. viewModelError타입이 있다면 타입이 일치하는지
     */

    //MARK: 카테고리 대분류 조회에 실패했을 경우 ViewModel의 상태가 변경된다.
    func test_Should_Fail_To_LoadAppDisplayClassList() {
        // given
        mockAppDisplayClassInfoFetchUseCase.scenario = .failure
        // when
        viewModel.loadAppDisplayClassList()
        // then
        XCTAssertTrue(viewModel.showErrorAlert)
        XCTAssertEqual(viewModel.viewModelError, AppDisplayClassInfoFetchError.failToFindAppDisplayClassInfoList.rawValue)
        XCTAssertNotNil(viewModel.viewModelError)
    }

    //MARK: 카테고리 상품 조회에 실패했을 경우 ViewModel의 상태가 변경된다.
    func test_Should_Fail_To_LoadAppGoodsInfo() {
        // given
        mockAppMainQuickMenuFetchUseCase.scenario = .failure
        // when
        viewModel.loadAppMainQuickMenuList()
        // then
        XCTAssertTrue(viewModel.showErrorAlert)
        XCTAssertEqual(viewModel.viewModelError, AppMainQuickMenuFetchError.failToFindAppMainQuickMenuList.rawValue)
        XCTAssertNotNil(viewModel.viewModelError)
    }
}
