//
//  CompositionRoot.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//
struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        
        let stockRepository: StockRepository = StockRepositoryImpl()
        
        let stockListControllerFatory: () -> StockListController = {
            let usecase = StockUseCase(stockRepository: stockRepository)
            let viewModel = StockListViewModel(usecase: usecase)
            return .init(dependency: .init(viewModel: viewModel))
        }
        
        let stockDetailControllerFactory: (Stock) -> StockDetailController = { stock in
            return .init(dependency: .init(sotck: stock))
        }
        
        let mainCoordinator: MainCoordinator = .init(dependency: .init(stockLisControllerFactory: stockListControllerFatory, stockDetailControllerFatcory: stockDetailControllerFactory))
        
        return .init(mainCoordinator: mainCoordinator)
    }
}
