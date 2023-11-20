//
//  CategoryViewModel.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Foundation
import Combine

final class CategoryViewModel: ObservableObject {
    @Published private(set) var fetchedAppDisplayClassList: [AppDisplayClassInfoFetchItemModel] = []
    @Published private(set) var fetchedAppMainQuickMenuList: [AppMainQuickMenuFetchItemModel] = []
    @Published var showToast: Bool = false
    @Published var showErrorAlert: Bool = false
    let publisher = PassthroughSubject<Void, Never>()

    var viewModelError: String?

    private let appDisplayClassFetchUseCase: AppDisplayClassInfoFetchUseCaseInterface
    private let appMainQuickMenuFetchUseCase: AppMainQuickMenuFetchUseCaseInterface
    private var cancellable: Set<AnyCancellable> = []

    init(
        appDisplayClassFetchUseCase: AppDisplayClassInfoFetchUseCaseInterface,
        appMainQuickMenuFetchUseCase: AppMainQuickMenuFetchUseCaseInterface
    ) {
        self.appDisplayClassFetchUseCase = appDisplayClassFetchUseCase
        self.appMainQuickMenuFetchUseCase = appMainQuickMenuFetchUseCase
    }

    public func viewWillAppear() {
        resetProperties()
        fetchAppDisplayClassList()
        fetchAppMainQuickMenuList()
    }

    public func fetchAppDisplayClassList() {
        appDisplayClassFetchUseCase.fetchAppDisplayClassInfoList()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self?.setupAppDisplayClassInfoFetchError(error)
                }
            } receiveValue: { [weak self] entity in
                let appDisplayClassInfoFetchModel = AppDisplayClassInfoFetchModelMapper.toPresentationModel(entity: entity)

                guard !appDisplayClassInfoFetchModel.data.isEmpty else {
                    return
                }

                self?.fetchedAppDisplayClassList.append(
                    contentsOf: appDisplayClassInfoFetchModel.data
                )
            }
            .store(in: &cancellable)
    }

    public func fetchAppMainQuickMenuList() {
        appMainQuickMenuFetchUseCase.fetchAppMainQuickMenuList()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self?.setupAppMainQuickMenuFetchError(error)
                }
            } receiveValue: { [weak self] entity in
                let appMainQuickMenuFetchModelModel = AppMainQuickMenuFetchModelMapper.toPresentationModel(entity: entity)

                guard !appMainQuickMenuFetchModelModel.data.isEmpty else {
                    return
                }

                self?.fetchedAppMainQuickMenuList.append(
                    contentsOf: appMainQuickMenuFetchModelModel.data
                )
            }
            .store(in: &cancellable)
    }

    func showToastByDebounce() {
        showToast = true
    }

    public func isEmptyFetchedAppDisplayClassList() -> Bool {
        return fetchedAppDisplayClassList.isEmpty
    }

    public func isEmptyFetchedAppMainQuickMenuList() -> Bool {
        return fetchedAppMainQuickMenuList.isEmpty
    }

    private func setupAppDisplayClassInfoFetchError(_ error: AppDisplayClassInfoFetchError) {
        self.viewModelError = error.rawValue
        self.showErrorAlert = true
    }

    private func setupAppMainQuickMenuFetchError(_ error: AppMainQuickMenuFetchError) {
        self.viewModelError = error.rawValue
        self.showErrorAlert = true
    }

    private func resetProperties() {
        self.fetchedAppDisplayClassList = []
        self.fetchedAppMainQuickMenuList = []
        self.viewModelError = nil
    }

}
