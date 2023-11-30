//
//  CategoryDetailViewModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/21/23.
//

import Foundation
import Combine
import UIKit

final class CategoryDetailViewModelWithRouter: CategoryDetailViewModel {
    private var router: CategoryRouter
    
    init(
        router: CategoryRouter,
        displayClassItem: AppDisplayClassInfoFetchItemModel,
        appDisplayBySubClassFetchUseCase: AppDisplayBySubClassFetchUseCaseInterface,
        appGoodsInfoFetchUseCase: AppGoodsInfoFetchUseCaseInterface
    ) {
        self.router = router
        super.init(
            displayClassItem: displayClassItem,
            appDisplayBySubClassFetchUseCase: appDisplayBySubClassFetchUseCase,
            appGoodsInfoFetchUseCase: appGoodsInfoFetchUseCase
        )
    }
}

class CategoryDetailViewModel: ObservableObject {
    @Published private(set) var fetchedAppSubDisplayClassInfoList = [AppSubDisplayClassInfoFetchItemModel]()
    @Published private(set) var fetchedAppGoodsInfoList = [AppGoodsInfoFetchItemModel]()
    
    @Published var showErrorAlert: Bool = false
    @Published var showToast: Bool = false
    
    private(set) var toastMessage: String = "개발 예정"
    
    @Published private(set) var selectedSubCategorySequence: Int = 0
    @Published private(set) var selectedSearchValue: SearchValueType = .recommended

    var viewModelError: String?
    private var pagination: PaginationModel?

    private var appGoodsCurrentPage = 0
    private let appGoodsSize = 20

    private let appDisplayBySubClassFetchUseCase: AppDisplayBySubClassFetchUseCaseInterface
    private let appGoodsInfoFetchUseCase: AppGoodsInfoFetchUseCaseInterface
    private let displayClassItem: AppDisplayClassInfoFetchItemModel
    
    private var cancellable = Set<AnyCancellable>()
    
    init(
        displayClassItem: AppDisplayClassInfoFetchItemModel,
        appDisplayBySubClassFetchUseCase: AppDisplayBySubClassFetchUseCaseInterface,
        appGoodsInfoFetchUseCase: AppGoodsInfoFetchUseCaseInterface
    ) {
        self.displayClassItem = displayClassItem
        self.appDisplayBySubClassFetchUseCase = appDisplayBySubClassFetchUseCase
        self.appGoodsInfoFetchUseCase = appGoodsInfoFetchUseCase
    }

    func viewWillAppear() {
        fetchAppDisplayBySubClass()
        loadAppGoodsInfo()
    }
    
    func loadAppDisplayBySubClass() {
        fetchAppDisplayBySubClass()
    }

    func loadAppGoodsInfo() {
        fetchAppGoodsInfo()
    }
    
    func getDisplayClassName() -> String {
        return displayClassItem.displayClassName
    }
    
    func didSelectSubCategory(_ item: AppSubDisplayClassInfoFetchItemModel) {
        resetAppGoodsInfoList()
        selectedSubCategorySequence = item.displayClassSequence
        fetchAppGoodsInfo()
    }
    
    func didSelectSearchValue(_ type: SearchValueType) {
        resetAppGoodsInfoList()
        selectedSearchValue = type
        fetchAppGoodsInfo()
    }
    
    func hasNext() -> Bool {
        return pagination?.hasNext(items: fetchedAppGoodsInfoList.count) ?? false
    }
    
    func showToastByDebounce(_ message: String) {
        showToast = true
        toastMessage = message
    }
    
    func setupFetchError(_ error: String) {
        viewModelError = error
        showErrorAlert = true
    }

    func getTotalElements() -> Int64 {
        return pagination?.totalElements ?? 0
    }
}

extension CategoryDetailViewModel {
    private func fetchAppDisplayBySubClass() {
        appDisplayBySubClassFetchUseCase.fetch(by: displayClassItem.displayClassSequence)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self?.setupFetchError(error.rawValue)
                }
            } receiveValue: { [weak self] entity in
                let appDisplayClassInfoBySubDisplayClassFetchModel = AppDisplayClassInfoBySubDisplayClassFetchModelMapper.toPresentationModel(entity: entity)
                
                let appSubDisplayClassInfoList = appDisplayClassInfoBySubDisplayClassFetchModel.data.appSubDisplayClassInfoList
                
                guard !appSubDisplayClassInfoList.isEmpty else {
                    return
                }

                self?.fetchedAppSubDisplayClassInfoList.append(
                    contentsOf: appSubDisplayClassInfoList
                )

            }
            .store(in: &cancellable)
    }

    private func fetchAppGoodsInfo() {
        let requestValue = AppGoodsInfoFetchRequestValue(
            displayClassSequence: displayClassItem.displayClassSequence,
            subDisplayClassSequence: selectedSubCategorySequence,
            page: appGoodsCurrentPage,
            size: appGoodsSize,
            searchValue: selectedSearchValue.rawValue
        )
        
        appGoodsInfoFetchUseCase.fetch(request: requestValue)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self?.setupFetchError(error.rawValue)
                }
            } receiveValue: { [weak self] entity in
                let appGoodsInfoFetchModel = AppGoodsInfoFetchModelMapper.toPresentationModel(entity: entity)
                
                guard !appGoodsInfoFetchModel.data.isEmpty else {
                    return
                }
                
                self?.appGoodsCurrentPage += 1
                self?.pagination = appGoodsInfoFetchModel.pagination

                if self?.validateCount() == true {
                    self?.fetchedAppGoodsInfoList.append(
                        contentsOf: appGoodsInfoFetchModel.data
                    )
                }
            }
            .store(in: &cancellable)
    }
    
    private func resetAppGoodsInfoList() {
        fetchedAppGoodsInfoList = []
        viewModelError = nil
        appGoodsCurrentPage = 0
    }

    private func validateCount() -> Bool {
        let totalElements = pagination?.totalElements ?? 0
        return fetchedAppGoodsInfoList.count < totalElements
    }
}
