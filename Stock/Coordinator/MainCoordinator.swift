//
//  MainController.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import UIKit
import Pure

class MainCoordinator:Coordinator, FactoryModule {
    struct Dependency {
        let stockLisControllerFactory: () -> StockListController
        let stockDetailControllerFatcory: (Stock) -> StockDetailController
    }
    var navigationController: UINavigationController?
    
    let rootViewController: StockListController
    let stockDetailControllerFactory: (Stock) -> StockDetailController
    
    required init(dependency: Dependency, payload: ()) {
        rootViewController = dependency.stockLisControllerFactory()
        stockDetailControllerFactory = dependency.stockDetailControllerFatcory
    }
    
    func start() {
        rootViewController.coordinator = self
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
    func stockCellTapped(item: Stock){
        let vc = stockDetailControllerFactory(item)
        navigationController?.pushViewController(vc, animated: true)
    }
}
