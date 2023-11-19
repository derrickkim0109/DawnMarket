//
//  AppDIContainer.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

import Moya

final class AppDIContainer: AppDIContainerInterface {
    func categoryViewDependencies() -> CategoryViewModel {
        let appDisplayClassFetchUseCase = appDisplayClassFetchDependencies()
        let appMainQuickMenuFetchUseCase = appMainQuickMenuFetchDependencies()

        let viewModel = CategoryViewModel(
            appDisplayClassFetchUseCase: appDisplayClassFetchUseCase,
            appMainQuickMenuFetchUseCase: appMainQuickMenuFetchUseCase
        )

        return viewModel
    }

    private func appDisplayClassFetchDependencies() -> AppDisplayClassInfoFetchUseCaseInterface {
        let networkProvider = MoyaProvider<AppDisplayClassInfoAPIService>()
        let dataSource: AppDisplayClassInfoDataSourceInterface = AppDisplayClassInfoDataSource(
            provider: networkProvider
        )
        let repository: AppDisplayClassInfoFetchRepositoryInterface = AppDisplayClassInfoFetchRepository(dataSource: dataSource)
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
        let repository: AppMainQuickMenuFetchRepositoryInterface = AppMainQuickMenuFetchRepository(dataSource: dataSource)
        let useCase: AppMainQuickMenuFetchUseCaseInterface = AppMainQuickMenuFetchUseCase(
            repository: repository
        )
        return useCase
    }
}
