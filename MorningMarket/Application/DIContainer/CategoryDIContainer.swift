//
//  CategoryDIContainer.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/21/23.
//

import Moya

final class CategoryDIContainer: CategoryDIContainerInterface {
    func categoryRouter() -> CategoryRouter {
        return CategoryRouter(categoryDIContainer: self)
    }

    func categoryViewDependencies(categoryRouter: CategoryRouter) -> CategoryViewModel {
        let appDisplayClassFetchUseCase = appDisplayClassFetchDependencies()
        let appMainQuickMenuFetchUseCase = appMainQuickMenuFetchDependencies()
        let viewModel = CategoryViewModel(
            router: categoryRouter,
            appDisplayClassFetchUseCase: appDisplayClassFetchUseCase,
            appMainQuickMenuFetchUseCase: appMainQuickMenuFetchUseCase)
        return viewModel
    }

    func categoryDetailViewDependencies(
        categoryRouter: CategoryRouter,
        displayClassItem: AppDisplayClassInfoFetchItemModel
    ) -> CategoryDetailViewModel {
        let appDisplayBySubClassFetchUseCase = appDisplayBySubClassFetchDependencies()
        let appGoodsInfoFetchUseCase = appGoodsInfoFetchDependencies()

        let viewModel = CategoryDetailViewModelWithRouter(
            router: categoryRouter,
            displayClassItem: displayClassItem,
            appDisplayBySubClassFetchUseCase: appDisplayBySubClassFetchUseCase,
            appGoodsInfoFetchUseCase: appGoodsInfoFetchUseCase
        )

        return viewModel
    }
}

extension CategoryDIContainer {
    // MARK: categoryViewDependencies
    private func appDisplayClassFetchDependencies() -> AppDisplayClassInfoFetchUseCaseInterface {
        let repository: AppInfoRepositoryInterface = appInfoRepositoryDependencies()
        let useCase: AppDisplayClassInfoFetchUseCaseInterface = AppDisplayClassInfoFetchUseCase(
            repository: repository
        )
        return useCase
    }

    private func appMainQuickMenuFetchDependencies() -> AppMainQuickMenuFetchUseCaseInterface {
        let repository: AppInfoRepositoryInterface = appInfoRepositoryDependencies()
        let useCase: AppMainQuickMenuFetchUseCaseInterface = AppMainQuickMenuFetchUseCase(
            repository: repository
        )
        return useCase
    }

    // MARK: categoryDetailViewDependencies
    private func appDisplayBySubClassFetchDependencies() -> AppDisplayBySubClassFetchUseCaseInterface {
        let repository: AppInfoRepositoryInterface = appInfoRepositoryDependencies()
        let useCase: AppDisplayBySubClassFetchUseCaseInterface = AppDisplayBySubClassFetchUseCase(
            repository: repository
        )
        return useCase
    }

    private func appGoodsInfoFetchDependencies() -> AppGoodsInfoFetchUseCaseInterface {
        let repository: AppInfoRepositoryInterface = appInfoRepositoryDependencies()
        let useCase: AppGoodsInfoFetchUseCaseInterface = AppGoodsInfoFetchUseCase(
            repository: repository
        )
        return useCase
    }

    private func appInfoRepositoryDependencies() -> AppInfoRepositoryInterface {
        let networkProvider = MoyaProvider<AppInfoAPIService>()
        let dataSource: AppInfoDataSourceInterface = AppInfoDataSource(
            provider: networkProvider
        )
        let repository: AppInfoRepositoryInterface = AppInfoRepository(dataSource: dataSource)

        return repository
    }
}
