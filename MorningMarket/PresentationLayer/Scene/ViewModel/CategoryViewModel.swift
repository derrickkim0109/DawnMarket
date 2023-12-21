//
//  CategoryViewModel.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

import SwiftUI
import Combine

final class CategoryViewModel: ObservableObject {
    @Published private(set) var fetchedAppDisplayClassList = [AppDisplayClassInfoFetchItemModel]()
    @Published private(set) var fetchedAppMainQuickMenuList = [AppMainQuickMenuFetchItemModel]()

    @Published var showToast: Bool = false
    @Published var showErrorAlert: Bool = false

    private(set) var viewModelError: String?

    private let router: CategoryRouter
    private let appDisplayClassFetchUseCase: AppDisplayClassInfoFetchUseCaseInterface
    private let appMainQuickMenuFetchUseCase: AppMainQuickMenuFetchUseCaseInterface

    private var cancellable = Set<AnyCancellable>()

    init(
        router: CategoryRouter,
        appDisplayClassFetchUseCase: AppDisplayClassInfoFetchUseCaseInterface,
        appMainQuickMenuFetchUseCase: AppMainQuickMenuFetchUseCaseInterface
    ) {
        self.router = router
        self.appDisplayClassFetchUseCase = appDisplayClassFetchUseCase
        self.appMainQuickMenuFetchUseCase = appMainQuickMenuFetchUseCase
    }

    func nextScreen(_ item: AppDisplayClassInfoFetchItemModel) -> some View {
        triggerTransition(route: .categoryDetail(item))
        return router.nextTransitionScreen()
    }

    func dismiss() {
        router.dismiss()
    }

    func viewWillAppear() {
        resetProperties()
        loadAppDisplayClassList()
        loadAppMainQuickMenuList()
    }

    func loadAppDisplayClassList() {
        fetchAppDisplayClassList()
    }

    func loadAppMainQuickMenuList() {
        fetchAppMainQuickMenuList()
    }

    func showToastByDebounce() {
        showToast = true
    }
    
    func isEmptyFetchedAppDisplayClassList() -> Bool {
        return fetchedAppDisplayClassList.isEmpty
    }

    func isEmptyFetchedAppMainQuickMenuList() -> Bool {
        return fetchedAppMainQuickMenuList.isEmpty
    }
    
    func setupFetchError(_ error: String) {
        viewModelError = error
        showErrorAlert = true
    }
}

extension CategoryViewModel {
    private func triggerTransition(route: CategoryRouter.PushRoute) {
        router.triggerScreenTransition(route: route)
    }
    
    private func fetchAppDisplayClassList() {
        appDisplayClassFetchUseCase.fetch()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self?.setupFetchError(error.rawValue)
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

    private func fetchAppMainQuickMenuList() {
        appMainQuickMenuFetchUseCase.fetch()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self?.setupFetchError(error.rawValue)
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

    private func resetProperties() {
        fetchedAppDisplayClassList = []
        fetchedAppMainQuickMenuList = []
        viewModelError = nil
    }
}
