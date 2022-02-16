//
//  Coordinator.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import Foundation
import UIKit

class Coordinator{
    func start(window: UIWindow, rootViewController: UIViewController){
        let rootViewController = UINavigationController(rootViewController: StockListViewController())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
