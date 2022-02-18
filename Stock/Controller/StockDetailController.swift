//
//  StockDetailController.swift
//  Stock
//
//  Created by Terry on 2022/02/18.
//

import UIKit
import Pure

class StockDetailController: BaseViewController, FactoryModule{
    struct Dependency {
        let sotck: Stock
    }
    
    let stock: Stock
    
    required init(dependency: Dependency, payload: ()) {
        stock = dependency.sotck
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Detail"
    }
}
