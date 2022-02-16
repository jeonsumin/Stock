//
//  MainController.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import UIKit

class MainCoordinator:Coordinator {
    var navigationController: UINavigationController?
    
    func start() {
        let rootViewController = StockListViewController()
        navigationController?.setViewControllers([rootViewController], animated: false)
    }
    
    
}
