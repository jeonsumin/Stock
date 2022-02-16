//
//  StockListViewController.swift
//  Stock
//
//  Created by Terry on 2022/02/16.
//

import SnapKit
import UIKit
import Pure

class StockListController: BaseViewController,FactoryModule {
  
    struct Dependency{
        let viewModel: StockListViewModel
    }
    
    let selfView = StockListView()
    let viewModel: StockListViewModel
    
    required init(dependency: Dependency, payload: ()) {
        viewModel = dependency.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        bind()
    }

    
    func bind() {
        viewModel.loading.subscribe(onNext: { loading in
            print("loading: \(loading)")
        }).disposed(by: disposeBag)
        
        viewModel.errorMessage.subscribe(onNext: { error in
            guard let error = error else { return }
            print("ERROR:: \(error)")
        }).disposed(by: disposeBag)
        
        viewModel.stocks.subscribe(onNext: { stocks in
            print("stocks: \(stocks)")
        }).disposed(by: disposeBag)
    }
    
    override func configureUI() {
        view.addSubview(selfView)
        selfView.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        
        selfView.searchViewController.delegate = self
        selfView.searchViewController.searchResultsUpdater = self
        
        navigationItem.searchController = selfView.searchViewController
    }
}

extension StockListController: UISearchControllerDelegate {
    
}

extension StockListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
