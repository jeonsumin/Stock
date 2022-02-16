//
//  CompositionRoot.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import Foundation

struct AppDependency {
    let mainCoordinator: MainCoordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let mainCoordinator: MainCoordinator = .init()
        
        return .init(mainCoordinator: mainCoordinator)
    }
}
