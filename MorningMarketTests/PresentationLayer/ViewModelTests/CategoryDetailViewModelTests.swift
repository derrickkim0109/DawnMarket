//
//  CategoryDetailViewModelTests.swift
//  MorningMarketTests
//
//  Created by Derrick kim on 12/1/23.
//

import XCTest
@testable import MorningMarket

final class CategoryDetailViewModelTests: XCTestCase {
    var viewModel: CategoryDetailViewModel!
    var mockDisplayClassInfoItem: AppDisplayClassInfoFetchItemModel!
    var mockAppDisplayBySubClassFetchUseCase: MockAppDisplayBySubClassFetchUseCase!
    var mockAppGoodsInfoFetchUseCase: MockAppGoodsInfoFetchUseCase!

    override func setUpWithError() throws {
        super.setUp()
        
        mockDisplayClassInfoItem = AppDisplayClassModelObjectMother.getAppDisplayClassInfoFetchItemModelWithCompleteData()
        mockAppDisplayBySubClassFetchUseCase = MockAppDisplayBySubClassFetchUseCase()
        mockAppGoodsInfoFetchUseCase = MockAppGoodsInfoFetchUseCase()
        
        viewModel = CategoryDetailViewModel(
            displayClassItem: mockDisplayClassInfoItem,
            appDisplayBySubClassFetchUseCase: mockAppDisplayBySubClassFetchUseCase,
            appGoodsInfoFetchUseCase: mockAppGoodsInfoFetchUseCase
        )
    }

    override func tearDownWithError() throws {
        super.tearDown()
        
        mockDisplayClassInfoItem = nil
        mockAppDisplayBySubClassFetchUseCase = nil
        mockAppGoodsInfoFetchUseCase = nil

        viewModel = nil
    }

    /*
     [성공]
     1. 다음 페이지를 불러왔을 경우 item의 개수와 currentPage의 상태
     2. fetchedAppGoodsInfoList가 size(20개 이하)만큼 들어갔는지 확인
     3. currentPage가 1늘어났는지 확인
     4. totalElements가 items보다 클경우 hasNext가 true 작을 경우 hasNext가 false
     5. totalPage가 currentPage보다 클 경우 hasNext가 true 같을 경우 false를 반환
     6. selectedSearchValue의 값이 변경될 경우 appGoodsInfoFetchUseCase의 fetch 메서드 실행
     7. 개발 예정인 경우 showToast의 상태값 변경
     8. fetchAppGoodsInfoList 실행 시 pagination의 totalElements 값 변경
     9. didSelectSearchValue or didSelectSubCategory 할 경우 appGoodsInfoList의 상태값이 reset되는지 확인
     */

    // MARK: 카테고리 하위목록의 초기 선택 값은 전체이다.
    func test_Should_Success_To_Get_AppSubDisplayClassName_That_Is_상품전체_When_ViewWillAppear() {
        // given
        let expectation = "상품 전체"
        // when
        viewModel.viewWillAppear()
        let subDisplayName = viewModel.fetchedAppSubDisplayClassInfoList.first?.subDisplayClassName
        // then
        XCTAssertEqual(expectation, subDisplayName)
    }

    // MARK: SearchValue의 초기 선택 값은 추천순이다.
    func test_Should_Success_To_Get_Search_When_ViewWillAppear() {
        // given
        let expectation = "추천순"
        // when
        viewModel.viewWillAppear()
        let searchValue = viewModel.selectedSearchValue.rawValue
        // then
        XCTAssertEqual(expectation, searchValue)
    }

    // MARK: 카테고리 상품의 TotalElements가 20개 이상인 경우 hasNext가 True이다.
    func test_Should_Success_To_LoadAppGoodsInfo() {
        // given
        // when
        viewModel.loadAppGoodsInfo()
        // then
        XCTAssertTrue(viewModel.hasNext())
        XCTAssertTrue(viewModel.fetchedAppGoodsInfoList.count < 21)
    }

    // MARK: viewWillAppear 시점에 카테고리 하위목록이 추가된다.
    func test_Should_Success_To_Get_AppSubDisplayClassName_When_ViewWillAppear() {
        // given
        // when
        viewModel.viewWillAppear()
        let fetchedAppSubDisplayClassInfoList = viewModel.fetchedAppSubDisplayClassInfoList
        // then
        XCTAssertNotNil(fetchedAppSubDisplayClassInfoList)
    }

    // MARK: 다음페이지를 불러왔을 경우 기존 리스트에 값이 추가된다.
    func test_Should_Success_To_Add_NewData_When_Scrolling_Is_True_By_Calling_LoadAppGoodsInfo() {
        // given
        viewModel.viewWillAppear()
        // when
        viewModel.loadAppGoodsInfo()
        // then
        XCTAssertTrue(viewModel.hasNext())
        XCTAssertEqual(viewModel.fetchedAppGoodsInfoList.count, 40)
    }

    // MARK: 마지막 페이지일 경우 hasNext가 False이다.
    func test_Should_Success_To_Return_False_When_TotalPage_Is_Last_By_Calling_LoadAppGoodsInfo() {
        // given
        mockAppGoodsInfoFetchUseCase.entity = AppGoodsInfoEntityObjectMother.getAppGoodsInfoFetchEntityWithInsufficientData()
        // when
        viewModel.loadAppGoodsInfo()
        // then
        XCTAssertFalse(viewModel.hasNext())
    }

    /*
     [실패]
     1. viewModelError타입이 있다면 타입이 일치하는지
     */

    //MARK: 카테고리 하위목록 조회에 실패했을 경우 ViewModel의 상태가 변경된다.
    func test_Should_Fail_To_LoadAppDisplayBySubClass() {
        // given
        mockAppDisplayBySubClassFetchUseCase.scenario = .failure
        // when
        viewModel.loadAppDisplayBySubClass()
        // then
        XCTAssertTrue(viewModel.showErrorAlert)
        XCTAssertEqual(viewModel.viewModelError, AppDisplayBySubClassFetchError.failToFindAppDisplayBySubClass.rawValue)
        XCTAssertNotNil(viewModel.viewModelError)
    }

    //MARK: 카테고리 상품 조회에 실패했을 경우 ViewModel의 상태가 변경된다.
    func test_Should_Fail_To_LoadAppGoodsInfo() {
        // given
        mockAppGoodsInfoFetchUseCase.scenario = .failure
        // when
        viewModel.loadAppGoodsInfo()
        // then
        XCTAssertTrue(viewModel.showErrorAlert)
        XCTAssertEqual(viewModel.viewModelError, AppGoodsInfoFetchError.failToFindAppGoodsInfoList.rawValue)
        XCTAssertNotNil(viewModel.viewModelError)
    }
}
