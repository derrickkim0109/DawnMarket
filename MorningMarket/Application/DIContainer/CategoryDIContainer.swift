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
        let networkProvider = MoyaProvider<AppDisplayClassInfoAPIService>()
        let dataSource: AppDisplayClassInfoDataSourceInterface = AppDisplayClassInfoDataSource(
            provider: networkProvider
        )
        let repository: AppDisplayClassInfoRepositoryInterface = AppDisplayClassInfoRepository(dataSource: dataSource)
        let useCase: AppDisplayClassInfoFetchUseCaseInterface = AppDisplayClassInfoFetchUseCase(
            repository: repository
        )
        return useCase
    }

    private func appMainQuickMenuFetchDependencies() -> AppMainQuickMenuFetchUseCaseInterface {
        let networkProvider = MoyaProvider<AppMainQuickMenuAPIService>()
        let dataSource: AppMainQuickMenuFetchDataSourceInterface = AppMainQuickMenuFetchDataSource(
            provider: networkProvider
        )
        let repository: AppMainQuickMenuRepositoryInterface = AppMainQuickMenuRepository(dataSource: dataSource)
        let useCase: AppMainQuickMenuFetchUseCaseInterface = AppMainQuickMenuFetchUseCase(
            repository: repository
        )
        return useCase
    }

    // MARK: categoryDetailViewDependencies
    private func appDisplayBySubClassFetchDependencies() -> AppDisplayBySubClassFetchUseCaseInterface {
        let networkProvider = MoyaProvider<AppDisplayBySubClassAPIService>()
        let dataSource: AppDisplayBySubClassFetchDataSourceInterface = AppDisplayBySubClassFetchDataSource(
            provider: networkProvider
        )
        let repository: AppDisplayBySubClassRepositoryInterface = AppDisplayBySubClassRepository(dataSource: dataSource)
        let useCase: AppDisplayBySubClassFetchUseCaseInterface = AppDisplayBySubClassFetchUseCase(
            repository: repository
        )
        return useCase
    }

    private func appGoodsInfoFetchDependencies() -> AppGoodsInfoFetchUseCaseInterface {
        let networkProvider = MoyaProvider<AppGoodsInfoAPIService>()
        let dataSource: AppGoodsInfoFetchRepositoryDataSourceInterface = AppGoodsInfoFetchRepositoryDataSource(
            provider: networkProvider
        )
        let repository: AppGoodsInfoRepositoryInterface = AppGoodsInfoRepository(
            dataSource: dataSource)
        let useCase: AppGoodsInfoFetchUseCaseInterface = AppGoodsInfoFetchUseCase(
            repository: repository
        )
        return useCase
    }
}
