//
//  StockDetailController.swift
//  Stock
//
//  Created by Terry on 2022/02/18.
//

import UIKit
import Pure
import SnapKit

class StockDetailController: BaseViewController, FactoryModule{
    struct Dependency {
        let sotck: Stock
    }
    let selfView = StockDetailView()
    
    let stock: Stock
    
    required init(dependency: Dependency, payload: ()) {
        stock = dependency.sotck
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        enableScrollWhenKeyboardAppeared(scrollView: selfView.scrollView)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeListeners()
    }
    
    override func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Detail"
        view.addSubview(selfView)
        selfView.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
    }
}
