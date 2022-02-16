//
//  CompositionRoot.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import Foundation

struct AppDependency {
    let coordinator: Coordinator
}

extension AppDependency {
    static func resolve() -> AppDependency {
        let coordinator: Coordinator = .init()
        
        return .init(coordinator: coordinator)
    }
}
