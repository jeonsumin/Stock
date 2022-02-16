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
    }
    var navigationController: UINavigationController?
    
    let rootViewController: StockListController
    
    required init(dependency: Dependency, payload: ()) {
        rootViewController = dependency.stockLisControllerFactory()
    }
    
    func start() {
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
    
    
}
